class Volunteer < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  validates :first_name, :mobile_phone_number, :address, presence: true

  scope :available_today, -> { where("available_#{Time.now.strftime("%a").downcase} = true") }
  scope :available_on, -> (day) { where("available_#{day} = true") }
  scope :active, -> { where("is_active = true") }

  def full_name
    first_name + ' ' + last_name
  end

  def activate!
    self.is_active = true
    save!
  end

  def deactivate!
    self.is_active = false
    save!
  end

  def active?
    is_active
  end

  def confirm_slot_for_today!
  end

  def cancel_slot_for_today!
  end
end
