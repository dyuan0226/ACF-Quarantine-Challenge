class Submission < ApplicationRecord
  # Relationships
  belongs_to :challenge
  belongs_to :user
  has_one_attached :content

  # Validations
  validates_presence_of :user_id, :challenge_id, :content
  validates :content, attached: true, size: { less_than: 14.megabytes , message: 'must be less than 14 MB' }
  validates_date :date_completed, on_or_before: ->{ Date.current }, allow_blank: true, on_or_before_message: "cannot be in the future"
  validates_uniqueness_of :user_id, :scope => [:challenge_id]

  # Scopes
  scope :chronological,   -> { order('date_completed DESC') }
  scope :by_challenge,    -> { joins(:challenge).order('challenges.name ASC, date_completed DESC') }
  scope :by_user,         -> { joins(:user).order('users.first_name ASC, users.last_name ASC, date_completed DESC') }
  scope :for_team,        -> (team){ joins(:user).where('team_id = ?', team.id) }
  scope :for_user,        -> (user){ where('user_id = ?', user.id) }
  scope :for_date,        -> (date){ where('date_completed = ?', date) }
  scope :for_challenge,   -> (challenge){ where('challenge_id = ?', challenge.id) }
  scope :for_category,    -> (category){ joins(:challenge).where('category = ?', category) }
  scope :for_past_days,   -> (x){ where("date_completed BETWEEN ? AND ?", Date.current.to_date - x.days, Date.current.to_date) }
  scope :completed,       -> { where("date_completed NOT null") }

  # Callbacks
  before_create do
    if self.date_completed.nil?
      self.date_completed = Date.current
    end
  end

  after_rollback do
    unless content.record.content_attachment.nil?
      # purge blob and attachment
      content.record.content_attachment.blob.purge
      content.purge
    end
  end

  # Methods

  private
end
