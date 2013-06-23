FlashquestApi::Application.routes.draw do

  get "home/index"

  namespace :api do namespace :v1 do
    resources :businesses,      only: [:index, :show], defaults: { format: 'json' } do
      resources :branches,      only: [:index], defaults: { format: 'json' }
      resources :patrons,       only: [:index], defaults: { format: 'json' }
      resources :people,        only: [:index], defaults: { format: 'json' }
      resources :activity,      only: [:index], defaults: { format: 'json' }
      resources :quests,        only: [:index], defaults: { format: 'json' }
      resources :photoquests,   only: [:index], controller: :quests, defaults: { format: 'json', type: 'photo' }
      resources :commentquests, only: [:index], controller: :quests, defaults: { format: 'json', type: 'comment' }
      resources :rewards,       only: [:index], defaults: { format: 'json' }
    end

    resources :people, only: [:index, :show], defaults: { format: 'json' } do
      resources :feed,          only: [:index], defaults: { format: 'json' }
      resources :activity,      only: [:index], defaults: { format: 'json' }
      resources :branches,      only: [:index, :show], defaults: { format: 'json' }
      resources :businesses,    only: [:index], defaults: { format: 'json' }
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
      resources :activity,      only: [:index], defaults: { format: 'json' }
      resources :quests,        only: [:index], defaults: { format: 'json' }
      resources :photoquests,   only: [:index], controller: :quests, defaults: { format: 'json', type: 'photo' }
      resources :commentquests, only: [:index], controller: :quests, defaults: { format: 'json', type: 'comment' }
      resources :approvals,     only: [:index], defaults: { format: 'json' }
      resources :comments,      only: [:index], defaults: { format: 'json' }
      resources :rewards,       only: [:index], defaults: { format: 'json' }
    end

    resources :patrons,         only: [:index, :show], defaults: { format: 'json' } do
      resources :activity,      only: [:index], defaults: { format: 'json' }
      resources :quests,        only: [:index], defaults: { format: 'json' }
      resources :photoquests,   only: [:index], controller: :quests, defaults: { format: 'json', type: 'photo' }
      resources :commentquests, only: [:index], controller: :quests, defaults: { format: 'json', type: 'comment' }
      resources :approvals,     only: [:index], defaults: { format: 'json' }
      resources :comments,      only: [:index], defaults: { format: 'json' }
      resources :rewards,       only: [:index], defaults: { format: 'json' }
    end

    resources :quests, only: [:index, :show], defaults: { format: 'json' } do
      resources :approvals,     only: [:index], defaults: { format: 'json' }
      resources :comments,      only: [:index, :create, :destroy], defaults: { format: 'json' }
    end

    resources :rewards, only: [:index, :show], defaults: { format: 'json' }
  end end
end
