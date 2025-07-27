class CreateStudies < ActiveRecord::Migration[8.0]
  def change
    create_table :studies do |t|
      t.string :name
      t.string :protocol_number
      t.string :version
      t.string :status
      t.string :principal_investigator
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
