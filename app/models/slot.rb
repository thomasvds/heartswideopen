class Slot < ActiveRecord::Base
  belongs_to :volunteer

  scope :current, -> { where(date: Date.today).first }
  scope :currents, -> { where(date: Date.today) }
  scope :available, -> { where(available: true) }

  delegate :nickname, :mobile_phone_number, :address, :number_of_beds,
  :latitude, :longitude, to: :volunteer

  def self.build(options)
    self.create(options.merge(date: Date.today))
  end

  def disable!
    self.available = true
    save!
  end
end
