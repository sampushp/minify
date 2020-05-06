class Url < ActiveRecord::Base
  validate :presence, :original

  before_create :sanitize_original
  before_create :generate_minified
  after_commit :set_expire_at

  has_many :visits

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

  def set_expire_at
    update_column(:expire_at, 1.month.from_now)
  end
end
