Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'

    resources :kata_benda do
    	collection { post :import }
    end
    resources :kata_bilangan do
    	collection { post :import }
    end
    resources :kata_ganti_milik do
    	collection { post :import }
    end
    resources :kata_ganti_orang do
    	collection { post :import }
    end
    resources :kata_hubung do
    	collection { post :import } 
    end
    resources :kata_kerja_dan_kata_sifat do
    	collection { post :import }
    end
    resources :kata_tanya do
    	collection { post :import }
    end
    resources :kata_tunjuk do
    	collection { post :import }
    end
    resources :settings
    resources :admins
  end
  
resources :session, only: [:new, :create]
get '/logout' => 'session#destroy'
root 'session#new'
end
