class Link < ApplicationRecord
  validates :long_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :slug, uniqueness: true

  before_validation :generate_or_parameterize_slug

  private

  def generate_or_parameterize_slug
    self.slug = slug.nil? || slug.blank? ? SecureRandom.uuid[0..6] : slug.parameterize
  end
end
