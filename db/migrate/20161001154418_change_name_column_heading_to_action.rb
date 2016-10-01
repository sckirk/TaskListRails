class ChangeNameColumnHeadingToAction < ActiveRecord::Migration
  def change
      rename_column(:tasks, :name, :action)
  end
end
