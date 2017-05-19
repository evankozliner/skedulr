class BusinessEmployeeRelation < ApplicationRecord
  belongs_to :business
  belongs_to :employee
end
