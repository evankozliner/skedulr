class Business < ApplicationRecord
  has_many :shifts
  has_many :employees, through: :shifts

  before_save :lowercase_name!

  after_find :titleize_name

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term.downcase}%")
    else
      all
    end
  end

  private

  def lowercase_name!
    self.name = name.downcase
  end

  def titleize_name
    self.name = name.titleize
  end
end
