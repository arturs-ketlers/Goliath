ActiveAdmin.register Event do
  menu priority: 3

  permit_params :participant_id, :event_id, :team, :avatar

  permit_params :name, :event_type, :date_from, :date_till, :is_active, :target_type, :target

  form do |f|
    f.inputs do
      f.input :is_active
      f.input :name
      f.input :event_type, collection: Event.types_to_select, include_blank: false
      f.input :date_from, as: :string, input_html: { class: "datepicker" }
      f.input :date_till, as: :string, input_html: { class: "datepicker" }
      f.input :target_type, collection: Event.target_types_to_select, include_blank: false
      f.input :target
    end
    f.actions
  end

  index do
    column :is_active
    column :name
    column :event_type
    column :date_from
    column :date_till
    actions
  end

  show title: :name do |a|
    attributes_table do
      row :is_active
      row :event_type
      row :date_from
      row :date_till
    end
  end
end
