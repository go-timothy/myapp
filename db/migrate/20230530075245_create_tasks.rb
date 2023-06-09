class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :title
      t.string :detail
      t.string :text
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
