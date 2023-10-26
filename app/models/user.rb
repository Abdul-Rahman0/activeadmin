class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  # Define which attributes are searchable using Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at username]
  end

  # Change the column used for inheritance from "type" to "user_type
  self.inheritance_column = :user_type

  # Define an enum for user types (Student, Teacher, Admin)
  enum user_type: { Student: 'Student', Teacher: 'Teacher', Admin: 'Admin' }

  # Set a default user type if not specified
  after_initialize :set_default_type, if: :new_record?

  def set_default_type
    self.user_type ||= :Admin
  end
end
