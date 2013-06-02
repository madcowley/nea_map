class CreateGrantees < ActiveRecord::Migration
  def change
    create_table :grantees do |t|
      t.string :grant_num
      t.integer :fiscal_year
      t.integer :nea_office_id
      t.string :grantee_name
      t.string :url
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
