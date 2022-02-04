class AddIndicaterReplyMonthToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :indicater_reply_month, :integer
  end
end
