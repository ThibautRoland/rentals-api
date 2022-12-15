class Mission < ApplicationRecord
  belongs_to :listing

  # enum mission_type: {first_checkin: 0, last_checkout: 1, checkout_checkin: 2}
end
