class ChangeCategoryIdToNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tasks, :category_id, false
  end
end

