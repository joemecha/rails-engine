class API::APIController < ActionController::Base
  def self.search_one(name)
    where("lower(name) ILIKE '%#{name}%'").order(:name).limit(1)
  end
end
