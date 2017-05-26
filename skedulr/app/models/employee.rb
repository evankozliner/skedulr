class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :business_employee_relations
  has_many :businesses, through: :business_employee_relations #, optional: true
  has_many :shifts

  has_many :manager_employees, foreign_key: "manager_id", primary_key: "id"
end
