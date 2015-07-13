class CreatePuppies < ActiveRecord::Migration
  def change
    create_table :puppies do |t|
      t.text :name
      t.text :age
      t.text :breed
      t.text :bio
      t.text :image

      t.timestamps null: false
    end
  end
end
