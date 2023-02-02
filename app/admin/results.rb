ActiveAdmin.register Result do
  menu priority: 3

  permit_params :distance, :participant_id, :datetime
end
