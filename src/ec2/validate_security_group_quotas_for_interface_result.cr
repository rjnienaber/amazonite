private alias Core = Amazonite::Core

module Amazonite::EC2
  class ValidateSecurityGroupQuotasForInterfaceResult
    # Specifies whether the specified security groups can be associated with a single network
    # interface without exceeding the quotas. If associating the security groups would exceed a quota,
    # the operation returns an error.
    property valid : Bool | Nil

    def initialize(
      @valid : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @valid
        params << {"#{prefix}Valid", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        valid: Core::XMLValue.bool(node.xpath_node("*[local-name()='valid']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@valid)
  end
end
