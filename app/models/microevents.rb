class microeventsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @microevent = current_user.microevents.build(microevent_params)
    if @microevent.save
      flash[:success] = "Event created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @microevent.destroy
    flash[:success] = "Event deleted"
    redirect_to request.referrer || root_url
  end

  private

    def microevent_params
      params.require(:microevent).permit(:content, :picture)
    end

    def correct_user
      @microevent = current_user.microevents.find_by(id: params[:id])
      redirect_to root_url if @microevent.nil?
    end
end
