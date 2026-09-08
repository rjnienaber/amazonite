private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Details related to why an IPAM pool CIDR failed to be provisioned.
  class IpamPoolCidrFailureReason
    # An error code related to why an IPAM pool CIDR failed to be provisioned.
    property code : IpamPoolCidrFailureCode | Nil

    # A message related to why an IPAM pool CIDR failed to be provisioned.
    property message : String | Nil

    def initialize(
      @code : IpamPoolCidrFailureCode | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @code
        params << {"#{prefix}Code", value.to_json_object_key}
      end

      if value = @message
        params << {"#{prefix}Message", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        code: (n = node.xpath_node("*[local-name()='code']")) ? AEC::IpamPoolCidrFailureCode.from_json_object_key?(n.content) : nil,
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='message']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @message)
  end
end
