private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class RestoreAddressToClassicResult
    # The Elastic IP address.
    property public_ip : String | Nil

    # The move status for the IP address.
    property status : Status | Nil

    def initialize(
      @public_ip : String | Nil = nil,
      @status : Status | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @public_ip
        params << {"#{prefix}PublicIp", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        public_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIp']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::Status.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@public_ip, @status)
  end
end
