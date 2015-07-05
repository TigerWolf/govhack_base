require 'csv'
module Ip
  class Categories < Grape::API
      version 'v1'

     resource :categories do
      get :list do
        Category.list
      end

      get :children do
        parent = params["parent"]
        Category.list(parent)
      end
    end

  end
end
