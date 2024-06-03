class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :user_id
      t.string :category
      t.date :date
      t.date :deadline
      t.string :comment

      t.timestamps
    end
  end
end
