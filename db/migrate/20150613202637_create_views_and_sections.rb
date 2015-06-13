class CreateViewsAndSections < ActiveRecord::Migration
  def change

    create_table :views do |t|
      t.integer :view_index

      t.timestamps null: false
    end

    create_table :sections do |t|
      t.belongs_to :view, index:true

      t.integer :section_index
      t.integer :x
      t.integer :y
      t.integer :width
      t.integer :height
      t.integer :section_type

      t.timestamps null: false
    end

    create_table :image_sections do |t|
      t.belongs_to :section, index: true

      t.string :image_name
      t.string :image

      t.timestamps null: false
    end

    create_table :text_sections do |t|
      t.belongs_to :section, index: true

      t.text :content
      t.string :font
      t.integer :font_size
      t.integer :red
      t.integer :green
      t.integer :blue
      t.integer :alignment
      t.boolean :scrollable

      t.timestamps null: false
    end

  end
end
