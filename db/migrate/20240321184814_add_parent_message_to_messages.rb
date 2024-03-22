class AddParentMessageToMessages < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :parent_message, null: true, foreign_key: { to_table: :messages, on_delete: :cascade }
  end
end
