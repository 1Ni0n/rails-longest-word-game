Rails.application.routes.draw do
  get 'longuest_word/game'

  get 'longuest_word/score'

  get 'longuest_word/generate_grid'

  get 'longuest_word/frequency'

  get 'longuest_word/attempt_valid'

  get 'longuest_word/translate_word'

  get 'longuest_word/english_word'

  get 'longuest_word/well_done'

  get 'longuest_word/not_english_word'

  get 'longuest_word/not_in_grid'

  get 'longuest_word/run_game'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
