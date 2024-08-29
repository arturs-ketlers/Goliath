class CreateTranslationSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :translation_settings do |t|
      t.string :key
      t.string :content_type
      t.string :category
      t.timestamps
    end

    unless ActiveRecord::Base.connection.table_exists? 'translation_setting_translations'
      TranslationSetting.create_translation_table! content: :text
    end
  end
end
