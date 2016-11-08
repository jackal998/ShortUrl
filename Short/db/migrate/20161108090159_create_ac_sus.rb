class CreateAcSus < ActiveRecord::Migration[5.0]
  def change
    create_table :ac_sus do |t|
    	t.string :target
    	t.string :shorturl
    	t.integer :used
      t.timestamps
    end
  end
end
