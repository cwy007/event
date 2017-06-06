# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  friendly_id :string
#  status      :string           default("draft")
#  category_id :integer
#  row_order   :integer
#

class Event < ApplicationRecord

  include RankedModel
  ranks :row_order

 validates_presence_of :name, :friendly_id
 validates_uniqueness_of :friendly_id
 validates_format_of :friendly_id, :with => /\A[a-z0-9\-]+\z/

 before_validation :generate_friendly_id, :on => :create

 belongs_to :category, :optional => true
 has_many :tickets, :dependent => :destroy
 accepts_nested_attributes_for :tickets, :allow_destroy => true, :reject_if => :all_blank
 has_many :registrations, :dependent => :destroy

 STATUS = ["draft", "public", "private"]
 validates_inclusion_of :status, :in => STATUS

 def to_param
   self.friendly_id
 end

protected

def generate_friendly_id
  self.friendly_id ||= SecureRandom.uuid
end

end
