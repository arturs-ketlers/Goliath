ActiveAdmin.register TranslationSetting do
  menu parent: 'administration', priority: 2

  permit_params translations_attributes: %i[id locale content]

  actions :show, :edit, :index, :update

  config.sort_order = 'key_asc'

  filter :key

  index do
    column :key
    actions
  end

  show do
    attributes_table do
      row :id
      row :key
      row :created_at
      row :updated_at
      tabs do
        resource.available_locales.each do |l|
          tab t("locales.#{l}") do
            render 'admin/show', { resource: resource, attrs: %i[content], l: l }
          end
        end
      end
    end
  end

  form do |f|
    f.inputs do
      # TODO: Something wrong with I18n.available_locales - returns all, not only defined in confog
      locales = %w[lv en]

      locales.each do |loc|
        unless f.object.translations.exists?(locale: loc)
          f.object.translations.build(locale: loc)
        end
      end
      f.fields_for :translations, new_record: false, allow_destroy: false do |tf|
        tf.inputs do
          tf.input :locale, label: false, input_html: { disabled: true, class: 'locale' }
          tf.input :locale, as: :hidden
          tf.input :content, as: f.object.content_type == 'rich' ? :ckeditor : :text
        end
      end
    end
    actions
  end

  controller do
    def update
      update! { admin_translation_settings_path }
    end
  end
end
