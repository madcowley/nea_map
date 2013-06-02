class GranteesController < ApplicationController
  def index
    @grantees = Grantee.near("#{params[:zip]}",100)
    Rails.logger.debug("\n\n**** grantees: #{@grantees.count}")
  end
end
