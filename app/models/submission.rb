class Submission < ApplicationRecord
  # Relationships
  belongs_to :challenge
  belongs_to :user

  # Validations
  validates_presence_of :user_id, :challenge_id
  validates_date :date_completed, on_or_before: ->{ Date.current }, allow_blank: true, on_or_before_message: "cannot be in the future"
  validates_uniqueness_of :user_id, :scope => [:challenge_id]

  # Scopes


  # Callbacks
  before_create do 
    if self.date_completed.nil?
      self.date_completed = Date.current
    end
  end

  # Methods
  

  private
end
