class HomeController < ApplicationController
  respond_to :json
  def index
    @grantees = Grantee.near([27.98152,-82.44591],20)
    @venues = Venue.near([27.98152,-82.44591],20)
  end
end
