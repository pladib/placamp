class BookingMailer < ApplicationMailer
  def booking_confirmation_email(booking)
    @event = booking.event
    @user = booking.user
    @qr_url = "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=#{booking.id}"

    subject = "You successfully booked the ticket to #{@event.name}"
    mail(to: @user.email, subject: subject);
  end
end
