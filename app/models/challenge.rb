class Challenge < ApplicationRecord
  # Relationships
  has_many :submissions
  has_many :users, through: :submissions

  # Validations
  validates_presence_of :name, :num_points, :category
  validates_numericality_of :num_points, greater_than: 0, only_integer: true
  validates_inclusion_of :category, in:  %w[Bible Lifestyle Creative]

  # Scopes
  scope :alphabetical,  -> { order('name') }
  scope :for_category,  ->(category) { where("category = ?", category) }

  # Callbacks


  # Methods
  

  private
end
