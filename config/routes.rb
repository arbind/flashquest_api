FlashquestApi::Application.routes.draw do

  resources :samples

  root 'home#index'

  get '/ping' => 'application#ping'

  namespace :admin do
    resources :factual, only: [:index]
    resources :setup, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :businesses do
      resources :branches do
        resources :quest_descriptions
        resources :reward_descriptions
      end
    end


  end

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

    # Aliases for /me (to act like RESTfull resource)
    # :id is simply ignored (since header token is used to find the Person)
    get 'me/:id', to: 'me#index', defaults: { format: 'json' } # alias for GET /me
    put 'me/:id', to: 'me#update', defaults: { format: 'json' } # alias for PATCH /me


    post '/branches/:branch_id/quest_descriptions/:quest_description_id/quests',
      to: 'quests#create', as: :new_quest, defaults: { format: 'json' }

    post '/branches/:branch_id/reward_descriptions/:reward_description_id/rewards',
      to: 'rewards#create', as: :new_reward, defaults: { format: 'json' }

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
