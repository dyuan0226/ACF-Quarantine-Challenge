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


  # Methods
  def make_active
    self.active = true
    self.save!
  end
  
  def make_inactive
    self.active = false
    self.save!
  end

  private
end
