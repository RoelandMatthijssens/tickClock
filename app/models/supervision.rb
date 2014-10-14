class Supervision < ActiveRecord::Base
	belongs_to :user, class_name: :User, foreign_key: :user_id
	belongs_to :subordinate, class_name: :User, foreign_key: :subordinate_id
end
