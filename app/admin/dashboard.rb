# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }
  sidebar :custom do
    "Need help? Email us at help@example.com"
  end
  content title: proc { I18n.t("active_admin.dashboard") } do
    
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
       
        
      end
    end
    columns do
      column do
        panel "All users" do
          ul do
            User.all.each do |user|
              li link_to(user.username, admin_user_path(user))
            end
          end
        end
        panel "Admin" do
          ul do
            User.where(type: 'Admin').each do |teacher|
              li link_to(teacher.username, admin_user_path(teacher))
            end
          end
        end
        panel "Teachers" do
          ul do
            User.where(type: 'Teacher').each do |teacher|
              li link_to(teacher.username, admin_user_path(teacher))
            end
          end
        end
        panel "Students" do
          ul do
            User.where(type: 'Student').each do |teacher|
              li link_to(teacher.username, admin_user_path(teacher))
            end
          end
        end
      
        
      end

    end
  end # content
end
