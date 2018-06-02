class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :exercise, foreign_key: true
      t.date :evaluation_day

      t.timestamps
    end
  end
end
