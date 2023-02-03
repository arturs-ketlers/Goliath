OFFSET = 5
OFFSET_STR = ' ' * OFFSET

def message(model, done: false)
  if done
    pre = 'Created '
    puts "\r#{OFFSET_STR}\e[92m✔ #{pre}\e[1m #{model}\e[0m"
  else
    pre = 'Creating'
    print "#{OFFSET_STR}* #{pre}\e[1m\e[96m #{model}\e[0m"
  end
end

if Rails.env.development? && !AdminUser.exists?
  message('AdminUser')
  AdminUser.create!(
    email: 'admin@example.com',
    password: 'pwOneVsAll',
    password_confirmation: 'pwOneVsAll'
  )
  message('AdminUser', done: true)
end


message('TranslationSetting')
translation_settings = [
  {
    key: 'rules',
    content_type: 'rich',
    category: 'global'
  }
]
translation_settings.each do |ts|
  if (current = TranslationSetting.find_by(key: ts[:key])).present?
    if current.category != ts[:category]
      current.update(
        content_type: ts[:content_type] || 'plain',
        category: ts[:category]
      )
    end
    next
  end

  ts_attrs = {
    key: ts[:key],
    content_type: ts[:content_type] || 'plain',
    category: ts[:category]
  }
  if ts[:content].present?
    ts_attrs.merge!({
      translations_attributes: [
        { locale: 'lv', content: ts[:content][:lv].to_s.squish },
        { locale: 'en', content: ts[:content][:en].to_s.squish }
      ]
    })
  end

  TranslationSetting.create!(ts_attrs)
end

# Remove old keys
ts_keys = translation_settings.map { |hsh| hsh[:key] }
TranslationSetting.where.not(key: ts_keys).destroy_all

message('TranslationSetting', done: true)


message('Setting')
settings = [
  {
    category: 'global',
    items: [
      { key: 'unit',    value: 'km' },
      { key: 'footer',  value: "© #{Date.today.year}" }
    ]
  },
  {
    category: 'page',
    items: [
      { key: 'team_name', value: '' }
    ]
  },
  {
    category: 'page',
    items: [
      { key: 'rules_url', value: '' }
    ]
  },
]

settings.each do |block|
  block[:items].each do |item|
    if (setting = Setting.find_by(key: item[:key])).present?
      next if setting.category.present? && Setting::CATEGORIES.include?(setting.category)

      setting.update(category: block[:category])
    else
      Setting.create! do |s|
        s.category = block[:category]
        s.key = item[:key]
        s.value = item[:value]
      end
    end
  end
end
message('Setting', done: true)
