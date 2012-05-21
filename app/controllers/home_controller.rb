# encoding : utf-8
class HomeController < ApplicationController
  def index
    @pages = {}
    Page.all.each { |p| @pages[p.code] = p }
  end
end
