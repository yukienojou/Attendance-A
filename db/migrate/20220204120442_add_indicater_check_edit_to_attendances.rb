class AddIndicaterCheckEditToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :indicater_check_edit, :string
    add_column :attendances, :tomorrow_edit, :boolean, default: false
    add_column :attendances, :started_edit_at, :datetime
    add_column :attendances, :started_before_at, :datetime
    add_column :attendances, :finished_before_at, :datetime
    add_column :attendances, :finished_edit_at, :datetime
    add_column :attendances, :change_edit, :boolean, default: false

  end
end
