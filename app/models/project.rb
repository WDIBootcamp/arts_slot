class Project < ActiveRecord::Base
    has_many :characters
    belongs_to :user
end
