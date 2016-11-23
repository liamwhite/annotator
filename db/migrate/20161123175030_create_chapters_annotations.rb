class CreateChaptersAnnotations < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.text :body
      t.integer :next_chapter_id
    end

    create_table :annotations do |t|
      t.references :chapter, index: true
      t.integer :line
      t.text :note
    end
  end
end
