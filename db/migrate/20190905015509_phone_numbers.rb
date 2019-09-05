class PhoneNumbers < ActiveRecord::Migration[5.2]
  create_table :phone_numbers do |t|
      t.string :phone_number
      t.boolean :verified, default: false
  end
end
