# == Schema Information
#
# Table name: event_attachments
#
#  id          :integer          not null, primary key
#  event_id    :integer
#  attachment  :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_event_attachments_on_event_id  (event_id)
#

class EventAttachment < ApplicationRecord
  mount_uploader :attachment, EventAttachmentUploader
  belongs_to :event
end
