class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search_one(name)
    where("lower(name) ILIKE '%#{name}%'").order(:name).limit(1)
  end

  def self.search_all(name)
    where("lower(name) ILIKE '%#{name}%'").order(:name)
  end
end
