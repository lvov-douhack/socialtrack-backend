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
  # attr_accessible :title, :body
end
