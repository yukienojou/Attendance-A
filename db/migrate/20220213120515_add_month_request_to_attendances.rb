class AddMonthRequestToAttendances < ActiveRecord::Migration[5.1]
   # 1ヶ月の勤怠承認
  def change
    # 承認申請月
    add_column :attendances, :month_approval, :date
   # モーダルの変更ボタン
    add_column :attendances, :change_month, :boolean, default: false
    # どの上長に申請したか
    add_column :attendances, :indicater_check_month, :string
   # 指示者確認のセレクト    
    add_column :attendances, :indicater_reply_month, :integer
    # お知らせモーダルのメッセージ    
    add_column :attendances, :indicater_check_month_anser, :string
  end
end
