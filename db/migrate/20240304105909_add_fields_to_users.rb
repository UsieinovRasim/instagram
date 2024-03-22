# frozen_string_literal: true

class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :website, :string
    add_column :users, :about_myself, :text, limit: 150
    add_column :users, :gender, :string
  end
end
