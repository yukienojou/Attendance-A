class AddOvertimeNoticeToAttendances < ActiveRecord::Migration[5.1]
  def change
     # 指示者確認
    add_column :attendances, :indicater_reply, :integer
    add_column :attendances, :change, :boolean, default: false
    add_column :attendances, :verification, :boolean, default: false
  end
end
