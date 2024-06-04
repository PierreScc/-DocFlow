class CreateAssignements < ActiveRecord::Migration[7.1]
  def change
    create_table :assignements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
