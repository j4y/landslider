
require 'test_helper'

class LandsliderTest < Minitest::Test

	JAYTEST_ACCOUNT_ID = 55647822
	
	def setup
		$sid ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end

	def test_landslider_login
		# other tests should use $sid for authentication
		result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
		
		refute_nil result
		assert_equal false, result[:error]
		refute_nil result[:session_id]
	end
	
  # def test_landslider_get_api_version
  #   result = Landslider.get_api_version($sid)
  #   
  #   refute_nil result
  #   assert_operator result[:major_version], :>=, 2
  #   assert_operator result[:minor_version], :>=, 0
  #   assert_operator result[:revision_version], :>=, 0
  # end
	
	
  # def test_landslider_get_account_by_id
  #   result = Landslider.get_account_by_id($sid, JAYTEST_ACCOUNT_ID)
  #   
  #   refute_nil result
  #   assert_equal false, result[:error]
  #   refute_nil result[:account]
  #   refute_nil result[:account][:fax]
  #   
  # end
  # 
  # def test_landslider_account_custom_fields
  #   result = Landslider.get_account_by_id($sid, JAYTEST_ACCOUNT_ID)
  #   
  #   refute_nil result
  #   assert_equal false, result[:error]
  #   refute_nil result[:account]
  #   
  #   refute_nil result[:account][:custom_fields]
  #   assert_kind_of Array, result[:account][:custom_fields]
  #   assert_operator result[:account][:custom_fields].length, :>=, 2
  #   
  # end
  # 
  # def test_landslider_get_account_contacts
  #   result = Landslider.get_account_contacts($sid, 55647822)
  # 
  #   validate_standard_api_result result
  #   assert_kind_of Array, result[:contacts]
  #   refute_nil result[:contacts].first[:contact_id]
  #   assert result[:contacts].all? { |con| !con[:last_name].nil? }, "last name required"
  # end
	
  # def test_landslider_get_account_contacts_primary
  #   result = Landslider.get_account_contacts($sid, 55647822, true)
  # 
  #   assert_equal 1, result[:results_returned]
  #   assert_equal 'Primary', result[:contacts].first[:first_name]
  #   assert_equal 'Contact', result[:contacts].first[:last_name]
  # 
  # end
		
  # def test_landslider_get_account_opportunities
  #   # exists on jaytest
  #   result = Landslider.get_account_opportunities($sid, 51858821)
  # 
  #   assert_equal false, result[:error]
  #   assert_kind_of Array, result[:opportunities]
  #   
  #   assert result[:opportunities].all? { |opp| 
  #     !opp[:account_name].nil? && 
  #     !opp[:name].nil? && 
  #     !opp[:deal_value].nil? && 
  #     !opp[:selling_process].nil?
  #   }, "opportunities require a name, account, deal value and selling process"
  # end
  # 
  # def test_landslider_get_contacts
  #   result = Landslider.get_contacts($sid)
  #   refute_nil result
  #   refute_nil result[:contacts]
  #   refute_nil result[:contacts].first[:custom_fields]
  # end
  # 
  # def test_landslider_get_contact_custom_fields
  #   result = Landslider.get_contact_custom_fields($sid)
  #   refute_nil result[:custom_fields]
  #   refute_nil result[:custom_fields].first[:custom_field_id]
  # end
	
  # def test_landslider_get_instance_information
  #   # Landslide API doc bug..  integer user_id doesn't work
  #   result = Landslider.get_instance_information($sid, LS_API_USERNAME)
  #   
  #   refute_nil result
  #   assert_equal false, result[:error]
  #   refute_nil result[:address]
  #   refute_nil result[:company_name]
  #   refute_nil result[:instance_url]
  # end
  # 
  # def test_landslider_get_opportunity_custom_fields
  #   result = Landslider.get_opportunity_custom_fields($sid)
  #   refute_nil result[:custom_fields]
  #   refute_nil result[:custom_fields].first[:custom_field_id]
  # end
	
  # def test_landslider_get_leads
  #   result = Landslider.get_leads($sid)
  #   
  #   validate_standard_api_result result
  #   refute_nil result[:leads]
  #   assert_kind_of Array, result[:leads]
  # end
  # 
  # def test_landslider_get_lead_custom_fields
  #   result = Landslider.get_lead_custom_fields($sid)
  #   refute_nil result[:custom_fields]
  #   refute_nil result[:custom_fields].first[:custom_field_id]
  # end
		
  # def test_landslider_get_user_information
  #   result = Landslider.get_user_information($sid, LS_API_USERNAME)
  #   refute_nil result
  #   assert_equal false, result[:error]
  #   refute_nil result[:employee]
  #   refute_nil result[:employee][:user_id]
  # end
  # 
  # def test_landslider_get_user_information_by_id
  # 
  #   result = Landslider.get_user_information_by_id($sid, 12640894)
  #   
  #   refute_nil result
  #   assert_equal false, result[:error]
  #   refute_nil result[:employee]
  #   refute_nil result[:employee][:user_id]
  # end
	
	private
	
	def validate_standard_api_result(result) 
		assert_kind_of Hash, result
		refute_nil result[:results_returned], ":results_returned missing"
		assert_operator result[:results_returned], :>=, 0
		refute_nil result[:total_results_available], ":total_results_available missing"
		assert_operator result[:total_results_available], :>=, 0
		refute_nil result[:error]
		assert_equal false, result[:error], "error should be false"
	end
	
	def validate_at_least_one_note_returned(result)
		assert_operator result[:results_returned], :>=, 1
		refute_nil result[:notes], "at least one note should be returned"
		assert_kind_of Array, result[:notes]
	end

end

