class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable
  attr_accessor :login, :message
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validate :valid_username

  enum role: [:normal, :admin, :banned]

  scope :normal, -> {where(role: 0)}
  scope :admin, -> {where(role: 1)}
  scope :banned, -> {where(role: 2)}
  scope :newest, -> {order(created_at: :desc)}
  scope :oldest, -> {order(created_at: :asc)}

  class << self
    def find_for_database_authentication warden_conditions
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value",
        { value: login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_hash).first
      end
    end
  end

  def valid_username
    if User.where(email: self.username).exists?
      errors.add :username, :invalid
    end
  end
end
