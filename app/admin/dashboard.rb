# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
  
    columns do
      column do
        panel "Unapproved List of Customers" do
          ul do
            # binding.pry
            User.last(5).map do |user|
              if !user.approve?
                li link_to(user.approve, edit_admin_user_path(user))
                li user.approve="Unapproved Please click Above link"
                li user.email
              else
                puts "All User Approved"
              end

            end
          end
        end
      end
    end
  end # content
end
