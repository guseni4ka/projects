class Category < ActiveRecord::Base
  has_and_belongs_to_many :articles
  validates :title, presence: true, length: { minimum: 5, maximum: 10}
  validates :slug, presence: true, uniqueness: true

  def self.categories_options
    self.all.map { |category| [category.title, category.id] }
  end

  def to_param
    self.slug
  end
end
