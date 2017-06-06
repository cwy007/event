# == Schema Information
#
# Table name: registrations
#
#  id         :integer          not null, primary key
#  status     :string           default("pending")
#  uuid       :string
#  event_id   :integer
#  ticket_id  :integer
#  user_id    :integer
#  name       :string
#  email      :string
#  cellphone  :string
#  website    :string
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_registrations_on_event_id   (event_id)
#  index_registrations_on_ticket_id  (ticket_id)
#  index_registrations_on_user_id    (user_id)
#  index_registrations_on_uuid       (uuid) UNIQUE
#

require 'rails_helper'

RSpec.describe Registration, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
