ActiveAdmin.register User do
  actions :index, :edit, :update, :create, :destroy

  menu label: "All Customers"
  permit_params :email, :password, :password_confirmation, :user_type, :approve

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :user_type
    column :approve
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :user_type
  filter :approve

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :user_type
      f.input :approve
    end
    f.actions
  end

end
