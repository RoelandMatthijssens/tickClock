class Timelog < ActiveRecord::Base
	enum log_type: %i{start stop}
	belongs_to :user
end
