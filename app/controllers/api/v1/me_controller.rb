class Api::V1::MeController < Api::V1::ApplicationController
  before_action :ensure_access_token

  # GET /me
  def index
    render :me
  end

  #PATCH /me
  def update
    @current_user.update_attributes me_params
    render :me
  end

private
  def me_params
    params.require(:me)
      .permit(
        :name,
        twitter:  twitter_profile_params,
        facebook: facebook_profile_params
      )
  end

  def twitter_profile_params
    [
      :id,
      :id_str,
      :name,
      :screen_name,
      :lang,
      :location,
      :url,
      :profile_image_url,
      :profile_image_url_https,
      :verified,
      :statuses_count,
      :followers_count,
      :friends_count,
      :geo_enabled,
      :listed_count,
      :notifications,
      :time_zone,
      :utc_offset,
      :created_at,
    ]
 end

  def facebook_profile_params
    [
      :id,
      :name,
      :first_name,
      :middle_name,
      :last_name,
      :gender,
      :locale,
      :languages,
      :link,
      :username,
      :age_range,
      :installed,
      :timezone,
      :updated_time,
      :verified,
      :bio,
      :birthday,
      :cover,
      :currency,
      :email,
      :location,
      :picture,
      :relationship_status,
      :religion,
      :significant_other,
      :website,
    ]
  end

end


