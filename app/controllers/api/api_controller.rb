class API::APIController < ActionController::Base
  def self.search_one(name)
    where("lower(name) LIKE '%#{name}%'").order(:name).limit(1)
  end
end
