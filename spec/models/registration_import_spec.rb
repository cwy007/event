# == Schema Information
#
# Table name: registration_imports
#
#  id             :integer          not null, primary key
#  status         :string
#  csv_file       :string
#  event_id       :integer
#  user_id        :integer
#  total_count    :integer
#  success_count  :integer
#  error_messages :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_registration_imports_on_event_id  (event_id)
#

require 'rails_helper'

RSpec.describe RegistrationImport, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
