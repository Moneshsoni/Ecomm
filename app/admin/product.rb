ActiveAdmin.register Product do
  permit_params :name, :user_id, :created_at, :updated_at, :catogery, :company, :description, :price


  menu label: "All Products"
  index do
    selectable_column
    id_column
    column :name
    column :user_id
    column :created_at
    column :updated_at
    column :catogery
    column :company
    column :description
    column :price
    actions
  end

  filter :name
  filter :user_id
  filter :created_at
  filter :updated_at
  filter :catogery
  filter :company
  filter :description
  filter :price

  form do |f|
    f.inputs do
      f.input :name
      f.input :user_id
      f.input :created_at
      f.input :updated_at
      f.input :catogery
      f.input :description
      f.input :price
    end
    f.actions
  end

end