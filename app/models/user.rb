class User < ApplicationRecord
	has_secure_password
  has_many :patients, foreign_key: :receptionist_id

  def receptionist?
    self.role == 'receptionist'
  end

  # Ensure you have a method to identify if the user is a doctor
  def doctor?
    self.role == 'doctor'
  end
end
