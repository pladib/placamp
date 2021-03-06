class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_event, only: [:show, :edit, :update, :destroy,
                                    :book, :cancel_booking]

  # GET /events
  # GET /events.json
  def index
    authorize Event
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    authorize @event
  end

  # GET /events/new
  def new
    @event = Event.new
    authorize @event
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    authorize @event

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /events.json
  def latest
    authorize Event.last, :show?
    @event = Event.last
    render :show
  end

  # POST /events/book
  def book
    booking = Booking.new(user: current_user, event: @event)
    if booking.save
      BookingMailer.booking_confirmation_email(booking).deliver_later
      redirect_to events_url, notice: 'You have successfully booked the event.'
    else
      redirect_to events_url, alert: booking.errors
    end
  end

  # DELETE
  def cancel_booking
    current_user.bookings.find_by(event: @event).destroy
    redirect_to events_url, notice: 'You have successfully cancelled the booking.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      authorize @event
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :start_datetime, :end_datetime, :description, :maximum_quantity)
    end
end
