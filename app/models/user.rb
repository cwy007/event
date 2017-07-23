# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  time_zone              :string
#  role                   :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = ["admin", "editor"]

  def display_name
    self.email.split("@").first
  end

  has_many :memberships
  has_many :groups, :through => "memberships"  # 这里用groups，所以不用指定source

  has_one :profile
  accepts_nested_attributes_for :profile

  has_many :registrations

  def is_admin?
    self.role == "admin"
  end

  def is_editor?
    ["admin", "editor"].include?(self.role)
  end
end
