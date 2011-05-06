
require 'test_helper'

class WsSearchTest < Test::Unit::TestCase

	def setup
		if $sid2.nil?
			# only get a session once
			result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
			$sid2 = result[:session_id]
		end
	end
	
	def test_ws_search_object
		search = Landslider::WsSearch.new('AccountName', 'Equals', 'Boston')
		assert_equal 'AccountName', search.field_id
		assert_equal 'Equals', search.operator
		assert_equal 'Boston', search.query_value
	end

	def test_get_accounts_without_search_criteria
		result = Landslider.get_accounts($sid2, 1, 25)

		assert_equal false, result[:error]
		assert_equal 6, result[:results_returned]
	end

	def test_get_accounts_with_search_criteria
		search = Landslider::WsSearch.new('AccountName', 'Equals', 'Boston')
		result = Landslider.get_accounts($sid2, 1, 25, search)
		
		assert_equal false, result[:error]
		assert_equal 1, result[:results_returned]
	end

end