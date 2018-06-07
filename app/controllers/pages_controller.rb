class PagesController < ApplicationController
  def home
    @rooms = Room.all.sample(3)
  end

  def search
    if params[:search].present?
      session[:ekonda_search] = params[:search]
    end

    arrResult = Array.new

    if session[:ekonda_search].present?
      @rooms_address = Room.active
                           .near(session[:ekonda_search], 5, order: 'distance')
    else
      @rooms_address = Room.active
    end

    @search = @rooms_address.ransack(params[:q])
    @rooms = @search.result

    @arrRooms = @rooms.to_a

    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @rooms.each do |room|
        not_available = room.reservations
                            .reservation_dates(start_date, end_date)
                            .limit(1)

        @arrRooms.delete(room) if not_available.length > 0
      end
    end
  end
end
