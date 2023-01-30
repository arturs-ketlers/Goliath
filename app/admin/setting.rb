ActiveAdmin.register Setting do
  menu parent: 'administration', priority: 1

  config.sort_order = 'category_asc'
  config.per_page = 25

  permit_params :value

  filter :key
  filter :value
  filter :created_at

  actions :show, :edit, :index, :update

  form do |f|
    f.inputs do
      div class: 'setting-title' do
        f.object.to_s
      end
      f.input :value
    end
    actions
  end

  index do
    column :category
    column :key
    column :value
    actions
  end

  show title: :key do |a|
    attributes_table do
      row :value
      row :key
      row :created_at
      row :updated_at
    end
  end
end
