class User < ApplicationRecord

  has_secure_password

  # Relationships
  belongs_to :team
  has_many :submissions
  has_many :challenges, through: :submissions
  has_many :photos, through: :submissions

  # Validations
  validates_presence_of :first_name, :last_name, :username, :email
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


  # Callbacks


  # Methods
  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end

  private
end
