class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable
  attr_accessor :login
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validate :valid_username

  def valid_username
    if User.where(email: self.username).exists?
      errors.add :username, :invalid
    end
  end
end
