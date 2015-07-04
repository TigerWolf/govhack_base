module Acme
  class Protected < Grape::API
    namespace :protected do
      http_basic do |username, password|
        resource = User.where(:email=> username)
        if resource.valid_password?(password)
          sign_in :user, resource
        end
      end
      desc 'Returns pong if username=username and password=password.'
      get :ping do
        { ping: 'pong' }
      end
    end
  end
end
