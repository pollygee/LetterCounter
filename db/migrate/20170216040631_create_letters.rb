class CreateLetters < ActiveRecord::Migration[5.0]
  def change
    create_table :letters do |t|
      t.string :letter
      t.integer :count, default: 0
      t.timestamps
    end
  end
end
