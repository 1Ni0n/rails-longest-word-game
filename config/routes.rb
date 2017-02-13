Rails.application.routes.draw do
  get 'run_game/grid'

  get 'run_game/compute_score'

  get 'run_game/score_and_message'

  get 'run_game/get_translation'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
