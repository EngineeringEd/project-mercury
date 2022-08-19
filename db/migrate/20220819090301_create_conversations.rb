# typed: true

class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table(:conversations)
    add_column(:conversations, :sid, :string)
    add_column(:conversations, :booking_id, :integer)
    add_column(:conversations, :driver_number, :string)
    add_column(:conversations, :owner_number, :string)
    add_column(:conversations, :friendly_name, :string)
  end
end
