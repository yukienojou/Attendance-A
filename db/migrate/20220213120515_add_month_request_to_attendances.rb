class AddMonthRequestToAttendances < ActiveRecord::Migration[5.1]
   # 1ヶ月の勤怠承認
  def change
    # 承認申請月
    add_column :attendances, :month_approval, :date
   # モーダルの変更ボタン
    add_column :attendances, :change_month, :boolean, default: false
 
  end
end
