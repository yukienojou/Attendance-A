class AddIndicaterReplyEditToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :indicater_reply_edit, :integer
  end
end
