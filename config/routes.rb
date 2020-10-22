Rails.application.routes.draw do
  resources :songs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # rails_disk_service GET  /rails/active_storage/disk/:encoded_key/*filename(:format)        active_storage/disk#show

  # update_rails_disk_service PUT  /rails/active_storage/disk/:encoded_token(.:format)        active_storage/disk#update
  

end

# get '*all', to: 'application#mount', constraints: lambda { |req|
#     req.path.exclude? 'rails/active_storage'
#   }

# get '*path', to: redirect('/'), constraints: lambda { |req|
#   req.path.exclude? 'rails/active_storage'
# }