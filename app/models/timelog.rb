class Timelog < ActiveRecord::Base
	enum kinds: %i{start stop}
	belongs_to :user
end
