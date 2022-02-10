class AddOvertimeToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime_finished_at, :string
    add_column :attendances, :tomorrow, :boolean, default: false
    add_column :attendances, :overtime_work, :string

  end
end
