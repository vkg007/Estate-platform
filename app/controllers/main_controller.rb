class MainController < ApplicationController
  def index
    # fetching property without contracts and not by current_user
    @properties = Property.includes(:contract).references(:contract).where('property_id IS NULL')
                          .where.not(user_id: current_user)
    # @properties = Property.all.where.not(user_id: current_user)
  end
end
