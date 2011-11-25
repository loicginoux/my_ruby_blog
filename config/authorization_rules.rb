authorization do
  role :admin do
    has_permission_on [:posts, :comments], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
  role :guest do
    has_permission_on :posts, :to => [:index, :show]
    has_permission_on :comments, :to => [:new, :create]
    has_permission_on :comments, :to => [:edit, :update, :destroy] do
      if_attribute :user => is { user }
    end
  end
  
  role :moderator do
    includes :guest
    has_permission_on :comments, :to => [:edit, :update, :destroy]
  end
  
  role :author do
    includes :guest
    has_permission_on :posts, :to => [:new, :create]
    has_permission_on :posts, :to => [:edit, :update, :destroy] do
      if_attribute :user => is { user }
    end
  end
end