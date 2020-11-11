class ChangeStatusOnAttendance < ActiveRecord::Migration[6.0]
  def change
    change_column_default :attendances, :status, 'pending'
  end
end
