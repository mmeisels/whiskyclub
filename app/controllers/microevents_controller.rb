class MicroeventsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @microevents = current_user.microevents.build(microevents_params)
    if @microevents.save
      flash[:success] = "microevents created!"
      redirect_to root_url
    end
  end

  def destroy
    @microevents.destroy
    flash[:success] = "microevents deleted"
    redirect_to request.referrer || root_url
  end

  private

    def microevents_params
      params.require(:microevents).permit(:description)
    end

    def correct_user
      @microevents = current_user.microevents.find_by(id: params[:id])
      redirect_to root_url if @microevents.nil?
    end
end
