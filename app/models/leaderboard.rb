# app/controllers/leaderboard.rb
class LeaderboardController
  def index
    @limit = 15
    users = User.where("ranked_attribute IS NOT NULL")
    users = users.where("ranked_attribute > 0")
    users = users.order("ranked_attribute DESC")
    users = users.limit(@limit)
    users = users.where("ranked_attribute <= ?", params[:last_ranked_value]) if params[:last_ranked_value].present?
    users = users.where("id NOT IN (?)", params[:uids].to_a) if params[:uids].present? # don't display any already displayed

    @ranked_users = users.sort_by(&:rank_30_days)
  end
end
