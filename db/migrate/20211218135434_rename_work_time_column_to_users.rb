class RenameWorkTimeColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :work_time, :basic_work_time
  end
end