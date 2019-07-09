Rails.application.routes.draw do
  get "api/v1/quotes" => "api/v1/quotes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :quotes
    end
  end
end
