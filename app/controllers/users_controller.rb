class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  def show
    @user = User.find(params[:uid])
    @events = @user.events.paginate(page: params[:page])
  end
end
