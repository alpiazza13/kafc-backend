class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable,
         :timeoutable, :trackable, :jwt_authenticatable, jwt_revocation_strategy: self

  validates :email, presence: true

  def full_name
    (first_name.present? && last_name.present?) ? "#{first_name} #{last_name}" : email
  end
end
