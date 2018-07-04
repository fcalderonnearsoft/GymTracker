class CreateEvaluationsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations_users, id: false do |t|
      t.references :user, foreign_key: true
      t.references :evaluation, foreign_key: true
      t.string :result

      t.timestamps
    end
  end
end
