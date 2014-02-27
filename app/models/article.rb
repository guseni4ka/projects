class Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  validates :title, presence: true, length: { minimum: 5 }
  validates :category_ids, presence: true
  validates :published_at, presence: true, allow_blank: true

  before_validation :cleanup_categories

  private
    def cleanup_categories
      self.categories.delete_if { |c| c.blank? }
    end
end