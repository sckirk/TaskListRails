class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end
