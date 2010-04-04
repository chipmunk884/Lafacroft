class CreateNspirefiles < ActiveRecord::Migration
  def self.up
    create_table :nspirefiles do |t|
      t.string :title
      t.string :author
      t.string :category
      t.text :description
      t.string :image_url
      t.string :file_url

      t.timestamps
    end
  end

  def self.down
    drop_table :nspirefiles
  end
end
