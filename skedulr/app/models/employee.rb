class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :business_employee_relations
  has_many :businesses, through: :business_employee_relations #, optional: true

  has_many :shifts

  has_many :manager_employees
  has_many :managers, through: :manager_employees

  def is_manager?(business_id)
    Manager.exists?(employee_id: self.id, business_id: business_id)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def has_manager?(business_id)
    self.managers.exists?(business_id: business_id)
  end

  def find_manager_profiles(business_id)
    self.managers.where(business_id: business_id)
  end

end
