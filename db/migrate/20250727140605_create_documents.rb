class CreateDocuments < ActiveRecord::Migration[8.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :document_type
      t.string :version
      t.string :status
      t.string :file_path
      t.text :description
      t.references :uploaded_by, null: false, foreign_key: { to_table: :users }
      t.datetime :uploaded_at

      t.timestamps
    end
  end
end
