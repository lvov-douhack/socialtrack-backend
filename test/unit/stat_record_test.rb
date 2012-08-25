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

require 'test_helper'

class StatRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
