ActiveAdmin.register EventTeam do
  menu priority: 4

  permit_params :name, :color

  form do |f|
    f.inputs do
      f.input :name
      f.input :color, as: :select, collection: EventTeam.colors_to_select
    end
    f.actions
  end

  index do
    column :name
    column :color do |r|
      if r.color.present?
        image_tag("teams/#{r.color}.png")
      end
    end
    column :event_participants
    column :total_distance
    actions
  end

  show title: :name do |a|
    attributes_table do
      row :name
      row :total_distance
    end
  end
end
