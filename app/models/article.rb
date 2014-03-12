class Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  validates :title, presence: true, length: { minimum: 5 }
  validates :category_ids, presence: true
  validate :valid_date?

  before_validation :cleanup_categories

  class << self
    def active
      where('published_at <= ?', Time.zone.now)
    end
    def list(slug)
      joins(:categories).where("#{Category.table_name}.slug = ?", slug)
    end
  end

  def active?
    self.published_at.present? && self.published_at <= Time.zone.now
  end

  private
    def cleanup_categories
      self.categories.delete_if { |c| c.blank? }
    end

    def valid_date?
      if self.published_at.present? && !self.published_at.is_a?(Date)
        errors.add(:published_at, 'error')
      end
    end

end