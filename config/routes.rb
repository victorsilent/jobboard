Rails.application.routes.draw do
  devise_for :users,:path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  devise_scope :user do
    resources :posts
  end

  root to: "pages#index"
end
