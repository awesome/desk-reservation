class CalendarController < ApplicationController

  def index
  	@events = calendar.events
    @event = Event.new
  end

  def new
  end
    

  def create
    @event_params = params[:event]

    @event = calendar.create_event do |e|
      e.title = 'A Cool Event'
      e.start_time = Time.now
      e.end_time = Time.now + (60 * 60) # seconds * min
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
