class CmsController < ApplicationController
  skip_before_action :authorize
  
  def index
    @homepage = Page.find_by_defaut("t");
    if @homepage.nil? 
      @homepage = Page.take;
    end
    @homepage
  end
end
