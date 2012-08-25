# == Schema Information
#
# Table name: stat_records
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  networkname :string(255)      not null
#  seconds     :integer          not null
#  created_at  :datetime         not null
#

class StatRecord < ActiveRecord::Base

  scope for_time, lambda do |time|
    if time.blank?
      StatRecord.where("created_at >= ?", Time.now.beginning_of_day)
    end

  end

end
