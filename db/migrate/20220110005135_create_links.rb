class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :long_url, null: false
      t.string :slug, unique: true, null: false, index: true

      t.timestamps
    end
  end
end
