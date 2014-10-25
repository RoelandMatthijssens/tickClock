class Vacation < ActiveRecord::Base
	enum status: %i{requested canceled pending denied approved}
	belongs_to :user
	belongs_to :supervisor, class_name: :User
end
