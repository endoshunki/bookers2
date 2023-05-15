class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.string :title
      t.string :body
      t.binary :image_name
      t.timestamps
    end
  end
end
