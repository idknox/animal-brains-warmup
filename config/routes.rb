Rails.application.routes.draw do

  root "brains#index"
  get "/seed" => "brains#seed"
end
