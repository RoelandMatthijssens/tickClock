class Timelog < ActiveRecord::Base
	enum timelog_types: %i{start stop}
	belongs_to :user
end
