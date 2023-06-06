class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks

  after_create :assign_default_role

  def assign_default_role
    add_role(:create_task)
    add_role(:read_task)
    add_role(:update_task)
    add_role(:delete_task)
  end
end
