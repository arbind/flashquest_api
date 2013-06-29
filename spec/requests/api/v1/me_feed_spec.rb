require 'spec_helper'

describe "/me/feed", :type => :request do
  include_context "json response"
  include_context "access token"

  context :GET do
    it 'works'
  end
end