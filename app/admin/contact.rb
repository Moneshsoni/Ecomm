ActiveAdmin.register Contact do
  actions :index, :edit, :update, :create, :destroy

  menu label: "Recent Lead"
  permit_params :name, :surname, :email, :city, :approve, :requirement

  index do
    selectable_column
    id_column
    column :name
    column :surname
    column :email
    column :city
    column :approve
    column :requirement
    actions
  end

  filter :name
  filter :surname
  filter :email
  filter :city
  filter :approve
  filter :requirement

  form do |f|
    f.inputs do
      f.input :name
      f.input :surname
      f.input :email
      f.input :city
      f.input :approve
      f.input :requirement
    end
    f.actions
  end

end
