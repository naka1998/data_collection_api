Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api do
    resources :admin_posts, only:[:index, :create, :update]
  end
  get '/api/:station_name/', to: 'admin_posts#filter_by_station'
  get '/api/:station_name/:data', to: 'admin_posts#filter_by_data'
end
