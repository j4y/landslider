
require 'test_helper'

class GetAccountsTest < Test::Unit::TestCase

	def setup
		# uncomment this line to debug
		#Landslider.logger = $stdout
		$sesson_id1 ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end
	
	def test_get_accounts_without_search
	
		result = Landslider.get_accounts($sesson_id1)
	
		assert_not_nil result
		assert_equal false, result[:error]
		assert_kind_of Array, result[:accounts]
		assert_equal 6, result[:accounts].size
		
	end
	
	def test_get_accounts_with_simple_search
	
		simple_search = Landslider::WsSearch.new({:first_result_position => 1, :total_results_requested => 1})
		result = Landslider.get_accounts($sesson_id1, simple_search)
	
		assert_not_nil result
		assert_equal false, result[:error]
		assert_kind_of Array, result[:accounts]
		assert_equal 1, result[:accounts].size
		
	end
	
	def test_get_accounts_with_search_criterion_search
		search = Landslider::WsSearch.new
		search.search_criteria = Landslider::WsSearchCriterion.new('AccountTypeId', 'Equals', '1539484')
		result = Landslider.get_accounts($sesson_id1, search)
		
		assert_not_nil result
		assert_equal false, result[:error]
		assert_kind_of Array, result[:accounts]
		assert_equal 2, result[:accounts].size
	
	end
	
	
end