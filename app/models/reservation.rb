class Reservation < ApplicationRecord
  belongs_to :listing

  after_create_commit :create_checkout_checkin_mission

  private

  def create_checkout_checkin_mission
    return if listing.missions.find_by(mission_type: :last_checkout, date: end_date)

    listing.missions.create!(
      listing_id: listing.id,
      mission_type: :checkout_checkin,
      date: start_date,
      price: 10 * listing.num_rooms
    )
  end
end
