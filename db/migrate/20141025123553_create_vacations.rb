class CreateVacations < ActiveRecord::Migration
	def change
		create_table :vacations do |t|
			t.references :user, index: true
			t.integer :status, null: false, default: 0
			t.integer :supervisor_id
			t.datetime :start
			t.datetime :end

			t.timestamps
		end
	end
end
