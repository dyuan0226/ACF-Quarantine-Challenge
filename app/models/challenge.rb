class Challenge < ApplicationRecord
  # Relationships
  has_many :submissions
  has_many :users, through: :submissions

  # Validations
  validates_presence_of :name, :num_points, :category
  validates_numericality_of :num_points, greater_than: 0, only_integer: true
  validates_inclusion_of :category, in:  %w[Spiritual Physical Social Miscellaneous]

  # Scopes
  scope :alphabetical,        -> { order('name') }
  scope :for_category,        ->(category) { where("category = ?", category) }

  def self.for_user_completed(user)
    user.challenges_completed
  end

  def self.for_user_incomplete(user)
    Challenge.all - user.challenges_completed
  end

  # Callbacks
  before_destroy do 
    handle_deletion_request()
  end

  # Methods
  

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
    unless self.submissions.empty?
      cannot_destroy_object()
    end
  end
end
