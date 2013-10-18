class CalendarController < ApplicationController

  def index
  	@events = calendar.events
  end

  def create
    event_params = params[:event]

    @event = calendar.create_event do |e|
      e.name = event_params[:name]
      e.email = event_params[:email]
      e.start = Time.parse( event_params[:start] )
      e.end = Time.parse( event_params[:end] )
    end
    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: "Reservation saved" }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html {
          flash.now[:notice]= "Not able to make the reservation"
          render :create
        }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @event = calendar.find_event_by_id( params[:id] )
  end

  def update
    @event = cal.find_or_create_event_by_id( params[:id] ) do |e|
      e.name = event_params[:name]
      e.email = event_params[:email]
      e.start = Time.parse( event_params[:start] )
      e.end = Time.parse( event_params[:end] )
    end
  end

  private

  def calendar
    @calendar ||= begin
      config = YAML.load(
        ERB.new(
          File.read(
            Rails.root.join('config', "google_api.yml"
        ))).result)[(Rails.env || 'development')]

      Google::Calendar.new(
        :username => config['username'],
        :password => config['password'],
        :app_name => config['app_name'])
    end
  end
end
