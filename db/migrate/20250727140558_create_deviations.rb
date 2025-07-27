class CreateDeviations < ActiveRecord::Migration[8.0]
  def change
    create_table :deviations do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :visit, null: false, foreign_key: true
      t.string :deviation_type
      t.string :severity
      t.text :description
      t.text :root_cause
      t.text :corrective_action
      t.text :preventive_action
      t.date :detected_date
      t.date :resolved_date

      t.timestamps
    end
  end
end
