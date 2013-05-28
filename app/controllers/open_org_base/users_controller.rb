module OpenOrgBase
class UsersController < ApplicationController
  inherit_resources
  actions :show

  def dashboard
    render "open_org_base/users/dashboard"
  end
end
end
