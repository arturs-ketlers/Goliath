ActiveAdmin.register Result do
  menu priority: 9

  permit_params :event_participant_id, :date, :steps, :distance, :comment

  form do |f|
    f.inputs do
      f.input :event_participant, collection: Event.active.participants
      f.input :date, as: :string, input_html: { class: "datepicker" }
      f.input :steps
      f.input :distance
      f.input :comment
    end
    f.actions
  end

  index do
    column :id
    column :event_participant
    column :steps
    column :distance
    column :date
    actions
  end
end
