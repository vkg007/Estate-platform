class MainController < ApplicationController
  def index
    # fetching property without contracts and not by current_user
    @properties = if current_user
                    Property.without_contract_user(current_user)
                  else
                    Property.without_contract
                  end
  end
end
