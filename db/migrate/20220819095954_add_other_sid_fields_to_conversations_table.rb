# typed: true

class AddOtherSidFieldsToConversationsTable < ActiveRecord::Migration[7.0]
  def change
    add_column(:conversations, :chat_sid, :string)
    add_column(:conversations, :messaging_sid, :string)
  end
end
