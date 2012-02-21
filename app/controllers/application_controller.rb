class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_location, :main_menu
  before_filter :authenticate_user!, :except => [:show,:index]
  def current_location
    @current_location = Location.first
  end
  def main_menu
    @main_menu = Article.where(:parent_id=>1).order('position DESC')
  end
  
end
