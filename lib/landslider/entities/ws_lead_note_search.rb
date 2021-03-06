class Landslider
	
	class WsLeadNoteSearch < WsSearch
		
		# @return [Integer]
		attr_reader :lead_id

		# @param [Integer] lead_id a lead id
		def initialize(lead_id)
			@lead_id = lead_id
		end

		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			msg.add('leadNote') { |crit|
				crit.add 'leadId', @lead_id
				super(crit)
			}
		end
		
	end
	
end
