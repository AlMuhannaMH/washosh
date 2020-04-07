class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :account, foreign_key: true
      t.references :community, foreign_key: true

      t.timestamps
    end
  end
end
