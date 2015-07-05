require 'csv'
module Ip
  class Patents < Grape::API
      version 'v1'

     resource :patents do
      get :query do
        patent_id = params["patent_id"]
        Patent.find(patent_id)
      end
    end

  end
end
