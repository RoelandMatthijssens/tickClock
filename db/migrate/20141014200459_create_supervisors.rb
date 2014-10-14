class CreateSupervisors < ActiveRecord::Migration
	def change
		create_table :supervisions do |t|
			t.references :user
			t.integer :subordinate_id
			t.timestamps
		end
	end
end
