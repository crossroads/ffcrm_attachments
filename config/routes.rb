Rails.application.routes.draw do

	post ':entity_type/:id/attachments/create' => 'attachments#create'

	get 'attachments/:id' => 'attachments#show'

end
