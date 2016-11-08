Rails.application.routes.draw do

	resources :ac_sus
	root :to => "ac_sus#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
