class Setting < ActiveRecord::Base
  validates :key, :category, presence: true
  @@cache = {}

  CATEGORIES = %w[global page].freeze
  validates :category, inclusion: CATEGORIES, allow_blank: true

  def to_s
    key
  end

  def self.value_for(key, cashing = {})
    return Setting.where(key: key).last.value if cashing == "no_cashing"
    return @@cache[key] unless @@cache[key].nil?

    setting = Setting.find_by(key: key)
    @@cache[key] = setting.nil? ? nil : setting.value
    @@cache[key]
  end

  def self.uncached_value_for(key)
    setting = Setting.find_by(key: key)
    setting.nil? ? nil : setting.value
  end
end
