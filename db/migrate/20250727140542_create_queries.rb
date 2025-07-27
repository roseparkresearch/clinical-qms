class CreateQueries < ActiveRecord::Migration[8.0]
  def change
    create_table :queries do |t|
      t.string :query_number
      t.references :queryable, polymorphic: true, null: false
      t.string :query_type
      t.string :priority
      t.string :status
      t.string :title
      t.text :description
      t.string :field_name
      t.string :expected_value
      t.datetime :due_date
      t.references :assigned_to, null: false, foreign_key: { to_table: :users }
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.text :response
      t.datetime :resolved_at

      t.timestamps
    end
  end
end
