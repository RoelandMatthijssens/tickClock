class Timelog < ActiveRecord::Base
	enum log_types: %i{start stop}
	belongs_to :user
end
