class User < ActiveRecord::Base
  def self.from_omniauth(auth)

    where(auth.slice(:provider, :uid).permit!).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.instance_url = auth.credentials.instance_url
      user.save!
    end
  end

  def rank
    @rank ||= User.where("ranked_attribute > ?", ranked_attribute).count + 1
  end
end
