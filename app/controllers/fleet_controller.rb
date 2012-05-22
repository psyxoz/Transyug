class FleetController < ApplicationController
  def index
    @page = Page.find_by_code(:fleet)
    @vessels = Vessel.active
    @vessels_archive = Vessel.archive
  end

  def show
    @vessel = Vessel.find(params[:id])
  end
end
