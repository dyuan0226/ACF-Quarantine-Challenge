class Team < ApplicationRecord
  # include AppHelpers::Activeable::InstanceMethods
  # extend AppHelpers::Activeable::ClassMethods

  # Relationships
  has_many :users
  has_many :submissions, through: :users

  # Validations
  validates_presence_of :name, :description
  validates_uniqueness_of :name, case_sensitive: false
  validates_format_of :name, with: /\A([A-Z])[a-zA-Z]/
  validates_format_of :description, with: /[a-zA-Z]/

  # Scopes
  scope :active,          -> { where(active: true) }
  scope :inactive,        -> { where.not(active: true) }

  # Callbacks
  before_destroy do 
    handle_deletion_request()
  end

  # Methods
  def make_active
    self.active = true
    self.save!
  end
  
  def make_inactive
    self.active = false
    self.save!
  end

  def total_points
    self.users.map { |u| u.points }.sum
  end

  def top_x_scorers(x)
    if x > self.users.size
      self.users.by_points
    else
      self.users.by_points.take(x)
    end
  end

  private
  attr_accessor :destroyable

  # Multiple models do not allow for deletions, so we can 
  # create a simple method here for callbacks to use as needed
  def cannot_destroy_object
    self.destroyable = false
    msg = "This #{self.class.to_s.downcase} cannot be deleted at this time. If this is a mistake, please alert the administrator."
    errors.add(:base, msg)
    puts "got here"
    throw(:abort) if errors.present?
    puts "got here to this point"
  end

  # only the user themself can delete themselves - this would be handled with ability.rb
  def handle_deletion_request
    self.make_inactive
    unless self.users.empty?
      cannot_destroy_object()
    end
  end
end
