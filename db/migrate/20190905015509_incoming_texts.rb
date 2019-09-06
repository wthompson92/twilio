class IncomingTexts < ActiveRecord::Migration[5.2]
  create_table :incoming_texts do |t|
      t.string :phone_number
      t.string :body
  end
end
