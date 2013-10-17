class Api::V1::MeController < Api::V1::ApplicationController
  before_action :ensure_access_token

  # GET /me
  def index
    render :me
  end

  #PATCH /me
  #PUT /me/:id - :id is ignored
  def update
    @current_user.update_attributes me_params
    render :me
  end

  def feed
    @activities = Activity.all
  end

  def activities
    @activities = @current_user.activities
  end

private
  def me_params
    params.require(:me).permit(twitter: twitter_params, facebook: facebook_params)
  end

  def twitter_params
    %w(
      id
      name
      screen_name
      avatar
      location
      followers_count
      friends_count
      statuses_count
    )
 end

  def facebook_params
    %w(
      id
      name
      username
      avatar
      email
    )
  end
end

### Some more facebook profile attributes:
# first_name
# last_name
# gender
# link
# locale
# timezone

### Some more twitter profile attributes:
# description
# url
# entities
# protected
# listed_count
# created_at
# favourites_count
# utc_offset
# time_zone
# geo_enabled
# verified
# lang
# contributors_enabled
# is_translator
# profile_background_color
# profile_background_image_url
# profile_background_image_url_https
# profile_background_tile
# profile_image_url
# profile_image_url_https
# profile_link_color
# profile_sidebar_border_color
# profile_sidebar_fill_color
# profile_text_color
# profile_use_background_image
# default_profile
# default_profile_image
# following
# follow_request_sent
# notifications