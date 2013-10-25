require 'calendar'

class CalendarController < ApplicationController
  
  def index
  	@events = Calendar.retrieve.events
    @event = Event.new
  end

  def new
  end
    

  def create    
  end

  def edit    
  end

  def update    
  end

  private
  
end
