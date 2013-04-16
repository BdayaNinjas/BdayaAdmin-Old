class EventsController < ApplicationController
  def index

  end

  def new
    @event = Event.new
    @members = Member.all - [current_member]
  end

  def create

  end

  def update

  end

  def destroy

  end
end