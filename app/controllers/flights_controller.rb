class FlightsController < ApplicationController
  def index
    @flights = Flight.all.order({ :created_at => :desc })

    render({ :template => "flights/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @flight = Flight.where({:id => the_id }).at(0)

    render({ :template => "flights/show.html.erb" })
  end

  def create
    @flight = Flight.new
    @flight.departs_at = params.fetch("query_departs_at")
    @flight.locator = params.fetch("query_locator")
    @flight.description = params.fetch("query_description")
    @flight.user_id = session.fetch(:user_id)
    @flight.alert_sent = params.fetch("query_alert_sent", false)

    if @flight.valid?
      @flight.save
      redirect_to("/flights", { :notice => "Flight created successfully." })
    else
      redirect_to("/flights", { :notice => "Flight failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @flight = Flight.where({ :id => the_id }).at(0)

    @flight.departs_at = params.fetch("query_departs_at")
    @flight.locator = params.fetch("query_locator")
    @flight.description = params.fetch("query_description")
    @flight.user_id = params.fetch("query_user_id")
    @flight.alert_sent = params.fetch("query_alert_sent", false)

    if @flight.valid?
      @flight.save
      redirect_to("/flights/#{@flight.id}", { :notice => "Flight updated successfully."} )
    else
      redirect_to("/flights/#{@flight.id}", { :alert => "Flight failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @flight = Flight.where({ :id => the_id }).at(0)

    @flight.destroy

    redirect_to("/flights", { :notice => "Flight deleted successfully."} )
  end
end
