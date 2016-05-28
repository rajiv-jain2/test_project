Rails.application.routes.draw do
  devise_for :users, :controllers => {
      :registrations => "users/registrations",
  }
  scope :profile, :path => :profile, :as => :profile, :controller => :user_profile do
    get ':slug' => :show
  end

end
