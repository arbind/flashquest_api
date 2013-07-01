FlashquestApi::Application.routes.draw do

  get "home/index"

  namespace :api do namespace :v1 do
    resources :devices,         only: [:create], defaults: { format: 'json' }

    get   'me',
      to: 'me#index',  as: :me,         defaults: { format: 'json' }

    patch 'me',
      to: 'me#update', as: :my_profile, defaults: { format: 'json' }

    get 'me/feed',
      to: 'me#feed', as: :me_feed, defaults: { format: 'json' }

    get 'me/activities',
      to: 'me#activities', as: :me_activities, defaults: { format: 'json' }

    post '/branches/:branch_id/quest_descriptions/:quest_description_id/quests',
      to: 'quests#create', as: :new_quest, defaults: { format: 'json' }

    resources :activities,        only: [:show], defaults: { format: 'json' }

    resources :businesses,      only: [:index, :show], defaults: { format: 'json' } do
      resources :branches,      only: [:index], defaults: { format: 'json' }
      resources :patrons,       only: [:index], defaults: { format: 'json' }
      resources :people,        only: [:index], defaults: { format: 'json' }
      resources :activities,      only: [:index], defaults: { format: 'json' }
      resources :quests,        only: [:index], defaults: { format: 'json' }
      resources :photoquests,   only: [:index], controller: :quests, defaults: { format: 'json', type: 'photo' }
      resources :commentquests, only: [:index], controller: :quests, defaults: { format: 'json', type: 'comment' }
      resources :rewards,       only: [:index], defaults: { format: 'json' }
    end

    resources :people, only: [:index, :show], defaults: { format: 'json' } do
      resources :feed,          only: [:index], defaults: { format: 'json' }
      resources :activities,    only: [:index], defaults: { format: 'json' }
      resources :branches,      only: [:index, :show], defaults: { format: 'json' }
      resources :businesses,    only: [:index, :show], defaults: { format: 'json' }
      resources :quests,        only: [:index], defaults: { format: 'json' }
      resources :photoquests,   only: [:index], controller: :quests, defaults: { format: 'json', type: 'photo' }
      resources :commentquests, only: [:index], controller: :quests, defaults: { format: 'json', type: 'comment' }
      resources :approvals,     only: [:index], defaults: { format: 'json' }
      resources :comments,      only: [:index], defaults: { format: 'json' }
      resources :rewards,       only: [:index], defaults: { format: 'json' }
    end

    resources :branches,        only: [:index, :show], defaults: { format: 'json' } do
      resources :patrons,       only: [:index], defaults: { format: 'json' }
      resources :people,        only: [:index], defaults: { format: 'json' }
      resources :activities,      only: [:index], defaults: { format: 'json' }
      resources :quests,        only: [:index], defaults: { format: 'json' }
      resources :photoquests,   only: [:index], controller: :quests, defaults: { format: 'json', type: 'photo' }
      resources :commentquests, only: [:index], controller: :quests, defaults: { format: 'json', type: 'comment' }
      resources :approvals,     only: [:index], defaults: { format: 'json' }
      resources :comments,      only: [:index], defaults: { format: 'json' }
      resources :rewards,       only: [:index], defaults: { format: 'json' }
    end

    resources :patrons,         only: [:index, :show], defaults: { format: 'json' } do
      resources :activities,      only: [:index], defaults: { format: 'json' }
      resources :quests,        only: [:index], defaults: { format: 'json' }
      resources :photoquests,   only: [:index], controller: :quests, defaults: { format: 'json', type: 'photo' }
      resources :commentquests, only: [:index], controller: :quests, defaults: { format: 'json', type: 'comment' }
      resources :approvals,     only: [:index], defaults: { format: 'json' }
      resources :comments,      only: [:index], defaults: { format: 'json' }
      resources :rewards,       only: [:index], defaults: { format: 'json' }
    end

    resources :quests, only: [:index, :show, :destroy], defaults: { format: 'json' } do
      resources :approvals,     only: [:index, :create, :destroy], defaults: { format: 'json' }
      resources :comments,      only: [:index, :create, :destroy], defaults: { format: 'json' }
    end

    resources :rewards, only: [:index, :show], defaults: { format: 'json' }
  end end
end
