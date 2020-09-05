class CreateCertificates < ActiveRecord::Migration[6.0]
  def change
    create_table :certificates do |t|
      t.string :my_name
      t.string :your_name
      t.text :content
      t.integer :style

      t.timestamps
    end
  end
end
