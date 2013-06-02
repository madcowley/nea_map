class CreateNeaOffices < ActiveRecord::Migration
  def change
    create_table :nea_offices do |t|
      t.string :name

      t.timestamps
    end
  end
end
