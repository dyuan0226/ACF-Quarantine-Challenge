class User < ApplicationRecord
  # Relationships
  belongs_to :team
  has_many :submissions
  has_many :challenges, through: :submissions

  # Validations


  # Scopes


  # Callbacks


  # Methods
  

  private
end
