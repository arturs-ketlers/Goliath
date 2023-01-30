class TranslationSetting < ActiveRecord::Base
  translates :content
  accepts_nested_attributes_for :translations

  CATEGORIES = %w[global data].freeze

  validates :content_type, inclusion: %w[plain rich], allow_blank: true
  validates :category, inclusion: CATEGORIES, allow_blank: true
end
