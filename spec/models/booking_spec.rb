require 'rails_helper'

RSpec.describe Booking, :type => :model do
  it "validate uniqueness of events and users" do
    user = create :user
    event = create :event
    Booking.create user: user, event: event
    expect(Booking.count).to be 1
    Booking.create user: user, event: event
    expect(Booking.count).to be 1
    Booking.create user: user, event: create(:event)
    expect(Booking.count).to be 2
  end
end
