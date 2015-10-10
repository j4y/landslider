
require 'test_helper'

class GetAccountTypesTest < Minitest::Test

	def setup
		# Landslider.logger = $stdout
		$sesson_id ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end
	
	def test_get_account_types
		result = Landslider.get_account_types($sesson_id)

		refute_nil result
		assert_equal false, result[:error]
		assert_kind_of Array, result[:account_types]
	end
	
	
end