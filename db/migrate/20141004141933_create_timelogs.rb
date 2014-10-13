class CreateTimelogs < ActiveRecord::Migration
	def change
		create_table :timelogs do |t|
			t.datetime :time, default: Time.now
			t.text :description
			t.integer :kind, null: false
			t.references :user

			t.timestamps
		end
	end
end
