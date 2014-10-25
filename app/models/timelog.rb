class Timelog < ActiveRecord::Base
	before_save :enforce_kind

	enum kinds: %i{start stop}
	belongs_to :user

	def enforce_kind
		if !kind
			last_timelog = user.last_timelog
			self.kind = Timelog.next_kind_for_timelog last_timelog
		end
	end

	def next_kind
		case kind
		when Timelog.kinds[:start]
			return Timelog.kinds[:stop]
		when Timelog.kinds[:stop]
			return Timelog.kinds[:start]
		end
	end

	def self.next_kind_for_timelog timelog
		timelog ? timelog.next_kind : kinds[:start]
	end

end
