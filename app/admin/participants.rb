ActiveAdmin.register Participant do
  menu priority: 2

  permit_params :name, :team, :avatar

  form do |f|
    f.inputs do
      f.input :name
      f.input :team, collection: %w[all one], include_blank: false,
                     selected: f.object.team.presence || 'all'
      f.input :avatar,
        hint: (if f.object.avatar.present?
                 f.image_tag(f.object.avatar.url(:small_thumb))
               else
                 f.content_tag(:span, class: 'missing-participant-img') do
                   f.image_pack_tag(f.object.avatar(:small_thumb), class: 'missing-participant-img') +
                     f.content_tag(:span, "No image")
                 end
               end)
    end
    f.actions
  end

  index do
    column :avatar do |r|
      if r.avatar.present?
        link_to(image_tag(r.avatar.url(:small_thumb), class: 'avatar'), r.avatar.url, target: '_blank')
      else
        image_pack_tag(r.avatar.url(:small_thumb), class: 'avatar')
      end
    end
    column :name
    column :team
    column :total_distance
    column :last_result_date
    actions
  end
end
