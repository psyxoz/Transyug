class FleetController < ApplicationController
  before_filter do
    check_menu(:fleet)
  end

  def index
    @page = Page.find_by_code(:fleet)
    @vessels = Vessel.active
    @vessels_archive = Vessel.archive
  end

  def show
    @vessel = Vessel.find(params[:id], :include => :images)
    @prev_vessel = Vessel.where('id < ?', @vessel.id).order('id DESC').first
    @next_vessel = Vessel.where('id > ?', @vessel.id).order('id ASC').first
  end
end
