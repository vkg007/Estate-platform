class MainController < ApplicationController
  def index

    # fetching property without contracts and not by current_user
    @properties = Property.without_contract_user(current_user)
    return if current_user

    @properties = Property.without_contract
  end
end
