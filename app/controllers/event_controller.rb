class EventController < ApplicationController
  def index

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params[:event])
    if @event.save
      flash[:notice] = "A new reservation was successfully made"
      @gcal_event = calendar.create_event do |e|
        e.title = @event.name
        e.start_time = @event.start
        e.end_time = @event.end
      end
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def edit
    @event = calendar.find_event_by_id( params[:id] )
  end

  def show
  end

  def update
    @event = cal.find_or_create_event_by_id( params[:id] ) do |e|
      e.name = event_params[:name]
      e.email = event_params[:email]
      e.start = Time.parse( event_params[:start] )
      e.end = Time.parse( event_params[:end] )
    end
  end

  def calendar
    @calendar ||= Calendar.retrieve
  end

  private
  def event_params
    params.require(:event).permit(:start, :end)
  end

end
