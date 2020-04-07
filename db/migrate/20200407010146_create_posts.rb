# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :account
      t.references :community
      t.string :title
      t.text :body
      t.integer :total_comments
      t.integer :upvotes
      t.integer :downvotes
      t.timestamps
    end
  end
end
