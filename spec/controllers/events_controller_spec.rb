require 'rails_helper'
include Devise::TestHelpers

RSpec.describe EventsController, :type => :controller do
  it "books an event" do
    sign_in create(:user)
    event = create :event
    expect(Booking.count).to be 0
    post :book, params: {id: event.id}
  end

end
