class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def interests
    @user = current_user
    Category.all.each do |category|
      @user.interests.build(category: category) if Interest.new(user: @user, category: category).valid?
    end
  end

  def update
    user = current_user
    user.update(user_params)
    user_params['interests_attributes'].each_value do |interest|
      if interest['_destroy'] == '0'
        category = Category.find(interest['category_id'])
        Interest.find_or_create_by(user: user, category: category)
      end
    end
    flash[:notice] = 'Your interests have been updated'
    redirect_to interests_path
  end

  private

  def user_params
    params.require(:user).permit(interests_attributes: [ :_destroy, :id, :category_id ])
  end

end
