class AddPrevChapterToChapters < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :prev_chapter_id, :integer
  end
end
