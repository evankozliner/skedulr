class ManagerEmployee < ApplicationRecord
  belongs_to :manager
  belongs_to :employee
end
