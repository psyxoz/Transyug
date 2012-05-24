# encoding : utf-8
class HomeController < ApplicationController
  def index
    @pages = {}
    Page.all.each { |p| @pages[p.code.to_sym] = p }
    @vessel = Vessel.where(:featured => 1).order('RAND()').limit(1).first
    @jobs = Job.order('created_at DESC').limit(5)
  end
end
