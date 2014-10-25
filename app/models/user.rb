class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable
	has_many :timelogs
	has_many :team_memberships
	has_many :teams, through: :team_memberships

	has_many :supervised_by, class_name: :Supervision, foreign_key: :user_id
	has_many :supervises, class_name: :Supervision, foreign_key: :subordinate_id
	has_many :supervisors, through: :supervised_by, source: :subordinate
	has_many :subordinates, through: :supervises, source: :user
end
