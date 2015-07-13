class CreateImageLibraryUploads < ActiveRecord::Migration
  def change
    create_table :image_library_uploads do |t|
      t.string :image

      t.timestamps null: false
    end
  end
end
