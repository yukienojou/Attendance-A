class AddOvertimeNoticeToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :change, :boolean, default: false
    add_column :attendances, :verification, :boolean, default: false
  end
end
