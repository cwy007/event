# == Schema Information
#
# Table name: tickets
#
#  id          :integer          not null, primary key
#  event_id    :integer
#  name        :string
#  description :text
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tickets_on_event_id  (event_id)
#

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
