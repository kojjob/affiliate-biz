class Article < ApplicationRecord
  has_one_attached :featured_image

  scope :featured, -> { where(featured: true).order(featured_position: :desc) }
  scope :published, -> { where(published: true) }
  scope :recent, -> { order(published_at: :desc) }

  validates :title, presence: true
  validates :content, presence: true

  before_save :set_published_at, if: :will_save_change_to_published?

  private

  def set_published_at
    self.published_at = published? ? Time.current : nil
  end
end
