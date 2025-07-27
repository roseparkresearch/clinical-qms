class CreatePatients < ActiveRecord::Migration[8.0]
  def change
    create_table :patients do |t|
      t.string :patient_id
      t.references :study, null: false, foreign_key: true
      t.string :status
      t.date :enrollment_date
      t.date :screening_date
      t.json :demographics

      t.timestamps
    end
  end
end
