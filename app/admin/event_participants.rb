ActiveAdmin.register EventParticipant do
  menu priority: 5

  permit_params :participant_id, :event_id, :event_team_id, :avatar

  form do |f|
    f.inputs do
      f.input :event, include_blank: false
      f.input :participant
      # f.input :team, collection: %w[all one], include_blank: false,
      #                selected: f.object.team.presence || 'all'
      f.input :event_team
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
    column :event
    column :event_team
    column :total_distance
    actions
  end

  show title: :name do |a|
    attributes_table do
      row :avatar do |r|
        if r.avatar.present?
          link_to(image_tag(r.avatar.url(:main), class: 'avatar avatar--lg'), r.avatar.url, target: '_blank')
        else
          image_pack_tag(r.avatar.url(:main), class: 'avatar avatar--lg')
        end
      end
      row :event_team
      row :total_distance
    end
  end
end
