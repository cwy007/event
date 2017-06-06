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

class Ticket < ApplicationRecord
  validates_presence_of :name, :price
  belongs_to :event
end
