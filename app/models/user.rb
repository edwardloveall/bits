class User < ActiveRecord::Base
  has_many :items
  has_one  :color

  has_secure_password

  # attr_accessible :name, :username, :color_id, :password, :password_confirmation

  validates_uniqueness_of :username
  validates_uniqueness_of :name
  validates_presence_of :password, on: :create

  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
