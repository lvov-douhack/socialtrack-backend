# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  token                  :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stat_records

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :token
  # attr_accessible :title, :body

  def generate_token!
    self.token = Digest::MD5.hexdigest(self.email)
  end

  def stats_for(time = nil)
    case time
    when :hour
      period = 1.hour.ago..Time.now
      period_s = 1.hour.seconds
    when :month
      period = 1.month.ago..Time.now
      period_s = 1.month.seconds
    else
      period = 1.day.ago..Time.now
      period_s = 1.day.seconds
    end
    self.stat_records.where(created_at: period).group(:networkname).select([:networkname, "SUM(seconds) AS seconds", "SUM(seconds) / #{period_s}.0 * 100 as percent"])
    #self.stat_records.for_time(time)
    #[{time: 600, networkname: "vk.com", percent: (600.0 / 1.day * 100).round(2)}, {time: 1230, networkname: "facebook.com", percent: (1230.0 / 1.day * 100).round(2)}]
  end

end
