namespace :db do
  desc "Seed the DB"
  task :mvp => :environment do
    biz = Business.where(name: "Liang's Village Cuisine",  type: 'Chinese',  url: 'http://www.liangskitchen.com',  phone: '(408) 725-9999').first_or_create
    branch = biz.branches.where(name: "Liang's Village Cuisine",  type: "Chinese",
                                url: "http://www.liangskitchen.com",
                                twitter_url: "https://twitter.com/flashquest",
                                facebook_url: "https://facebook.com/flashquest",
                                address: "19772 Stevens Creek Blvd2",  city: "Cupertino",  state: "CA",  zip: 95014, phone: "(408) 725-9999",
                                ).first_or_create
  end
end