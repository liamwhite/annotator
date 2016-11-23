class Chapter < ApplicationRecord
  belongs_to :next_chapter, class_name: 'Chapter', optional: true
  belongs_to :prev_chapter, class_name: 'Chapter', optional: true

  has_many :annotations
  has_many :summaries
end
