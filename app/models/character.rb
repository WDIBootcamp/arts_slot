class Character < ActiveRecord::Base
    belongs_to :user
    belongs_to :project

    def to_hash
      hash = {}; self.attributes.each { |k,v| hash[k] = v }
      return hash
    end
end
