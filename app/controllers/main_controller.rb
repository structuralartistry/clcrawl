class MainController < ApplicationController
  def index
    @output = Craigslist.new.get_results
  end

end
