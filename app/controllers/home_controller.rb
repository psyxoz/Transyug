# encoding : utf-8
class HomeController < ApplicationController
  def index
    @pages = {}
    Page.all.each { |p| @pages[p.code.to_sym] = p }
  end
end
