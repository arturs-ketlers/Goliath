module ApplicationHelper
  def text_block(key)
    ts = TranslationSetting.find_by(key: key)
    return unless ts

    Globalize.with_locale(I18n.locale) do
      ts.content
    end
  end
end
