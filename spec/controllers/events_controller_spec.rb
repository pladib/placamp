require 'rails_helper'
include Devise::TestHelpers

RSpec.describe EventsController, :type => :controller do

  before { sign_in create(:user) }

  it "books an event" do
    event = create :event
    post :book, params: {id: event.id}
    expect(Booking.count).to be 1
  end

  it "cancel an event" do
    event = create :event
    post :book, params: {id: event.id}
    expect(Booking.count).to be 1
    delete :cancel_booking, params: {id: event.id}
    expect(Booking.count).to be 0
  end
end
