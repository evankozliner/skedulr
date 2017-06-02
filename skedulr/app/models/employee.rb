class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :business_employee_relations
  has_many :businesses, through: :business_employee_relations #, optional: true
  has_many :shifts

  has_many :manager_employees, foreign_key: "manager_id", primary_key: "id"

  def is_manager?(business_id)
    ManagerEmployee.exists?(manager_id: self.id, business_id: business_id)
  end

  def has_manager?(business_id)
    ManagerEmployee.exists?(employee_id: self.id, business_id: business_id)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
