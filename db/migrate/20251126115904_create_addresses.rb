class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :postcode,null:false
      t.string :local,null:false
      t.string :building
      t.integer :phone_number,null:false
      t.integer :region_id,null:false
      
      t.references :buyer,null:false,foreign_key: true

      t.timestamps
    end
  end
end
