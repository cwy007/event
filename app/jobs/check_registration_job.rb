class CheckRegistrationJob < ApplicationJob
  queue_as :default

  def perform(registration_id)
    # Do something later
    registration = Registration.find(registration_id)

    unless registration.status == "confirmed"
      registratio.status == "cancelled"
      registration.save!
    end
    
  end
end
