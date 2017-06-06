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

class Ticket < ApplicationRecord
  validates_presence_of :name, :price
  belongs_to :event

  has_many :registrations
end
