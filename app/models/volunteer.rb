class Volunteer < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  validates :first_name, :mobile_phone_number, :address, presence: true

  def full_name
    first_name + ' ' + last_name
  end

  def active?
    is_active
  end
end
