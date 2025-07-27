class CreateVisits < ActiveRecord::Migration[8.0]
  def change
    create_table :visits do |t|
      t.references :patient, null: false, foreign_key: true
      t.integer :visit_number
      t.string :visit_name
      t.date :visit_date
      t.string :status
      t.date :visit_window_start
      t.date :visit_window_end

      t.timestamps
    end
  end
end
