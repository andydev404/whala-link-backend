class Link < ApplicationRecord
  validates :long_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :slug, uniqueness: true

  before_validation :generate_slug

  private

  def generate_slug
    self.slug = SecureRandom.uuid[0..6] if slug.nil?
  end
end
