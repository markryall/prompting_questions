PromptingQuestions::Application.routes.draw do
  root 'questions#index'
  get "questions/:id" => 'questions#show'
end
