class Challenge < ApplicationRecord
  # Relationships
  has_many :submissions
  has_many :users, through: :submissions

  # Validations


  # Scopes


  # Callbacks


  # Methods
  

  private
end
