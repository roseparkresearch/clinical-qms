class CreateAdverseEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :adverse_events do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :visit, null: false, foreign_key: true
      t.string :severity
      t.string :causality
      t.boolean :serious
      t.date :start_date
      t.date :end_date
      t.text :description
      t.text :treatment
      t.string :outcome

      t.timestamps
    end
  end
end
