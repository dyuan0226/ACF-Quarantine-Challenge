class User < ApplicationRecord
  # for some reason, this doesnt work so i did a jank workaround
  # include AppHelpers::Deletions

  has_secure_password

  # Relationships
  belongs_to :team
  has_many :submissions
  has_many :challenges, through: :submissions
  has_many :photos, through: :submissions

  # Validations
  validates_presence_of :first_name, :last_name, :username, :team_id, :email
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates_format_of :first_name, with: /\A([A-Z])[a-z]+\z/, message: "First name should be capitalized!"
  validates_format_of :last_name, with: /\A([A-Z])[a-z]+\z/, message: "Last name should be capitalized!"
  validates_uniqueness_of :username, case_sensitive: false
  validates_uniqueness_of :email, case_sensitive: false
  validates_presence_of :password, :on => :create 
  validates_presence_of :password_confirmation, :on => :create 
  validates_confirmation_of :password, message: "does not match"
  validates_length_of :password, :minimum => 4, message: "must be at least 4 characters long", :allow_blank => true
  validates_inclusion_of :role, in: %w[admin regular], message: "is not recognized in the system"

  # Scopes
  scope :for_team,        -> (team){ where('team_id = ?', team.id) }
  scope :for_challenge,   -> (challenge){ joins(:submissions).where('submissions.challenge_id = ? AND submissions.date_completed NOT NULL', challenge.id) }
  scope :for_role,        -> (role){ where('role = ?', role) }
  scope :by_last_name,    -> { order('last_name ASC') }
  scope :by_first_name,   -> { order('first_name ASC') }
  scope :active,          -> { where(active: true) }
  scope :inactive,        -> { where.not(active: true) }

  # Challenge Types
  CHALLENGE_TYPES = ['Social', 'Spiritual', 'Physical', 'Misc']

  def self.by_points
    User.all.sort_by { |u| u.points }.reverse
  end


  # Callbacks
  before_create do 
    if self.role.nil?
      self.role = "regular"
    end
  end

  before_destroy -> { handle_deletion_request() }

  # Methods
  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end

  def points
    self.submissions.map { |s| s.challenge.num_points }.sum
  end

  def previous_challenge
    if self.submissions.completed.first.nil? 
      nil
    else 
      self.submissions.completed.first.challenge
    end
  end

  def name 
    self.first_name + " " + self.last_name 
  end

  def challenges_completed 
    self.submissions.map{|s| s.challenge}
  end

  def make_active
    self.active = true
    self.save!
  end

  def make_inactive
    self.active = false 
    self.save!
  end

  def role?(authorized_role)
    return false if role.nil?
    role.downcase.to_sym == authorized_role
  end

  private
  attr_accessor :destroyable

  # Multiple models do not allow for deletions, so we can 
  # create a simple method here for callbacks to use as needed
  def cannot_destroy_object
    self.destroyable = false
    msg = "This #{self.class.to_s.downcase} cannot be deleted at this time. If this is a mistake, please alert the administrator."
    errors.add(:base, msg)
    throw(:abort) if errors.present?
  end

  # only the user themself can delete themselves - this would be handled with ability.rb
  def handle_deletion_request
    self.make_inactive
    cannot_destroy_object()
  end
  
end
