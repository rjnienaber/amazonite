private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes logging options for an Amazon Web Services Verified Access instance.
  class VerifiedAccessInstanceLoggingConfiguration
    # The ID of the Amazon Web Services Verified Access instance.
    property verified_access_instance_id : String | Nil

    # Details about the logging options.
    property access_logs : VerifiedAccessLogs | Nil

    def initialize(
      @verified_access_instance_id : String | Nil = nil,
      @access_logs : VerifiedAccessLogs | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @verified_access_instance_id
        params << {"#{prefix}VerifiedAccessInstanceId", value}
      end

      if value = @access_logs
        params.concat(value.to_query_params("#{prefix}AccessLogs."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='verifiedAccessInstanceId']")),
        access_logs: node.xpath_node("*[local-name()='accessLogs']").try { |n| VerifiedAccessLogs.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @access_logs
        value.validate!
      end
    end

    def_equals_and_hash(@verified_access_instance_id, @access_logs)
  end
end
