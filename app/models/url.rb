class Url < ActiveRecord::Base
  validate :presence, :original

  before_create :sanitize_original
  before_create :generate_minified

  def minify
    Rails.application.routes.url_helpers.mini_url(checksum: self.checksum)
  end

  private
  def sanitize_original
    return false if self.original.blank?
    original.strip!
    sanitize_url = self.original.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    self.original = "http://#{sanitize_url}"
  end

  def generate_minified
    self.checksum = rand(36**8).to_s(36)
  end

end
