class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index, :api, :registration, :company ]

  def home
  end

  def company
    # siren = params['search']['siren']
    # url = 'https://firmapi.com/api/v1/companies/' + siren
    # user_serialized = open(url).read
    # @company = JSON.parse(user_serialized)
  end

end
