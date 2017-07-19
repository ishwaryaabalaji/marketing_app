class AddimageColumnToproducts < ActiveRecord::Migration
   def change
    add_column :image_url, :string
  end
end
