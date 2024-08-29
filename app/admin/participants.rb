ActiveAdmin.register Participant do
  menu priority: 2

  permit_params :name, :height, :avatar

  form do |f|
    f.inputs do
      f.input :name
      f.input :height
      f.input :avatar
    end
    f.actions
  end

  index do
    column :avatar do |r|
      # if r.avatar.present?
      #   link_to(image_tag(r.avatar.url(:small_thumb), class: 'avatar'), r.avatar.url, target: '_blank')
      # end
    end
    column :name
    column :height
    column :step_length do |r|
      format('%.3f', r.step_length)
    end
    actions
  end

  show title: :name do |a|
    attributes_table do
      row :avatar do |r|
        # if r.avatar.present?
        #   link_to(image_tag(r.avatar.url(:main), class: 'avatar avatar--lg'), r.avatar.url, target: '_blank')
        # end
      end
      row :height
      row :step_length do |r|
        format('%.3f', r.step_length)
      end
    end
  end
end
