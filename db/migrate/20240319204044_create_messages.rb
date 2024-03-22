class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.bigint :sender_id
      t.bigint :receiver_id
      t.text :content
      t.boolean :read

      t.timestamps
    end
  end
end
