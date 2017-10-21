class Volunteer < ActiveRecord::Base

  geocoded_by :address

  before_save :cleanup_mobile_phone_number
  after_validation :geocode, :if => :address_changed?

  validates :nickname, :mobile_phone_number, :address, presence: true
  validates :mobile_phone_number, phone: true
  validates :mobile_phone_number, uniqueness: true

  scope :available_today, -> { where("available_#{Time.now.strftime("%a").downcase} = true") }
  scope :not_yet_queried_today, -> { where("last_queried_at < ?", Time.now.beginning_of_day) + where(last_queried_at: nil)}
  scope :available_on, -> (day) { where("available_#{day} = true") }
  scope :active, -> { where("active = true") }

  has_many :slots, dependent: :destroy


  def cleanup_mobile_phone_number
    self.mobile_phone_number = Phonelib.parse(mobile_phone_number).e164
  end

  def activate!
    self.active = true
    save
  end

  def deactivate!
    self.active = false
    self.slots.try(:current).try(:disable!)
    save
  end

  def mark_as_queried_today!
    self.last_queried_at = Time.now
    save
  end

  def already_queried_today?
    Time.now.beginning_of_day < self.last_queried_at
  end

  def active?
    active
  end

  def confirm_slot_for_today!
    current_slot = slots.try(:current)
    current_slot.present? ? current_slot.update(available: true) : Slot.build(volunteer: self)
    save!
  end

  def cancel_slot_for_today!
    current_slot = slots.try(:current)
    current_slot.update(available: false) if current_slot.present?
    save!
  end
end
