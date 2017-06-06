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

class Registration < ApplicationRecord
  STATUS = ["pending", "confirmed"]
  validates_inclusion_of :status, :in => STATUS
  validates_presence_of :status, :ticket_id

  belongs_to :event
  belongs_to :ticket
  belongs_to :user, :optional => true

  before_validation :generate_uuid, :on => :create


  def to_param
    self.uuid
  end

  attr_accessor :current_step
  validates_presence_of :name, :email, :cellphone, :if => :should_validate_basic_data?
  validates_presence_of :name, :email, :cellphone, :bio, :if => :should_validate_all_data?

  validate :check_event_status, :on => :create


  protected

  def check_event_status
    if self.event.status == "draft"
      errors.add(:base, "活动尚未开始报名")
    end
  end

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

  def should_validate_basic_data?
    current_step == 2
  end

  def should_validate_all_data?
    current_step == 3 || status == "confirmed"
  end


end
