class CreateSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :summaries do |t|
      t.references :chapter, index: true
      t.integer :line
      t.text :note
    end
  end
end
