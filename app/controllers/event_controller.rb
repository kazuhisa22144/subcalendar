class EventController < ApplicationController
  before_action :authenticate_user!
    def show
      @event = Event.all
      # render :json => @event
      respond_to do |format|
        format.json {
          render json:
          @event.to_json(
            only: [:title, :start, :end]
          )
        }
      end
    end
  
    def create
      event = Event.new
      event.attributes = {
        title: params[:title],
        start: params[:start],
        end: params[:end],
      }
      event.save
      respond_to do |format|
        format.json {
          render json:
          @event.to_json(
            only: [:title, :start, :end]
          )
        }
      end
    end
  end