class BlogPost < ApplicationRecord
  include Filterable
  has_rich_text :content
  has_one_attached  :cover_image

  validates :title, presence: true
  validates :content, presence: true

  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_first).order(updated_at: :desc)}
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }
  scope :filter_by_tag, -> (tag) { where tag: tag }

  enum tag: {
    travel: 'travel',
    code: 'code',
    food: 'food',
    offbeat: 'offbeat',
  }, _prefix: true
  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end
