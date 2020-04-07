# frozen_string_literal: true

class CreateSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribers do |t|
      t.references :account
      t.references :community
      t.timestamps
    end
  end
end
