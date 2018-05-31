Rails.application.routes.draw do
 

  resources :departments do
    resources :items
  end

  scope 'items/:item_id', as: 'item' do
    resources :comments, only: [:new, :create, :edit, :update]
  end
end
