class Character < ActiveRecord::Base
    belongs_to :user
    belongs_to :project

    serialize :ethnicity, Hash

    def to_hash
      hash = {}; self.attributes.each { |k,v| hash[k] = v }
      return hash
    end

    def suggestions
       character_params = self.attributes
       character_params["id"] = nil
       character_params["name"] = nil
       character_params["project_id"] = nil
       character_params["user_id"] = nil
       character_params["created_at"] = nil
       character_params["updated_at"] = nil
       character_params["description"] = nil
       search = character_params.delete_if{|k,v| v.nil?}
       return suggestions = User.where(search)
    end

end
