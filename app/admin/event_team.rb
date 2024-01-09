ActiveAdmin.register EventTeam do
  menu priority: 4

  permit_params :name, :color, :slogan

  form do |f|
    f.inputs do
      f.input :name
      f.input :slogan
      f.input :color, as: :select, collection: EventTeam.colors_to_select
    end
    f.actions
  end

  index do
    column :name
    column :slogan
    column :color do |r|
      if r.color.present?
        image_tag("teams/#{r.color}.png")
      end
    end
    column :participants do |t|
      html = t.participants.order(total_distance: :desc).map do |tp|
        "#{tp.name} (#{format("%.2f", tp.total_distance)})"
      end
      html.join('</br>').try(:html_safe)
    end
    column :total_distance
    actions
  end

  show title: :name do |a|
    attributes_table do
      row :name
      row :slogan
      row :total_distance
    end
  end
end
