ActiveAdmin.register Result do
  menu priority: 3

  permit_params :participant_id, :date, :steps, :distance, :comment

  form do |f|
    f.inputs do
      f.input :participant
      f.input :date
      f.input :steps
      f.input :distance
      f.input :comment
    end
    f.actions
  end

  index do
    column :id
    column :participant
    column :steps
    column :distance
    column :date
    actions
  end
end
