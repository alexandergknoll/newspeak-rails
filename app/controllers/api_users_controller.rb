class ApiUsersController < ApplicationController
  # before_filter :parse_request, :authenticate_client_from_token!
  before_filter :find_user, only: [:show]

  def show
    render json: @user, :include => {:categories => {:only => [:name, :abbreviation]}} 
  end

  private

  def find_user
    @user = User.find_by_phone(PhonyRails.normalize_number(params[:phone], :country_code => 'US'))
    render nothing: true, status: :not_found unless @user.present?
  end

  def authenticate_client_from_token!
    unless @json['api_token'] == ENV["API_KEY"]
      render nothing: true, status: :unauthorized
    end
  end

  def parse_request
    json = request.body.read
    @json = JSON.parse(json)
  end
end