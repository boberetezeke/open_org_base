OpenOrgBase::Engine.routes.draw do
  resources :task_definitions
  resources :groups
  resources :tasks
  resources :roles
  resources :organizations, :shallow => true do
    resources :task_graph_definitions
  end

  resources :user_sessions do
    member do
      get 'new'
      post 'create'
      delete 'destroy'
    end
  end
      
  resources :users do
    member do
      get 'edit'
      get 'dashboard'
    end
  end
end
