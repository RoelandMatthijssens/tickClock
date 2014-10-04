class AddAvailableVacationTimeToUser < ActiveRecord::Migration
  def change
		add_column :users, :available_vacation, :float
  end
end
