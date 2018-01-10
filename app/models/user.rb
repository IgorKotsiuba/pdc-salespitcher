class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :groups

  validates :first_name, presence: true
  validates :last_name,  presence: true

  def full_name
    [first_name, last_name].join(' ')
  end
end
