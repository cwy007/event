# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  legal_name :string
#  birthday   :date
#  location   :string
#  education  :string
#  occupation :string
#  bio        :text
#  specialty  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profile < ApplicationRecord
  belongs_to :user
end
