Rails.application.routes.draw do

	post ':entity_type/:id/attachments/create' => 'attachments#create'

	get 'attachments/:id' => 'attachments#show'

  resources :attachments do
    member do
      get :download
      put :remove
    end
  end

end
