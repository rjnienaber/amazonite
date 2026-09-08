private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the private DNS name for the service endpoint.
  class PrivateDnsNameConfiguration
    # The verification state of the VPC endpoint service.
    #
    # Consumers of the endpoint service can use the private name only when the state is `verified`.
    property state : DnsNameState | Nil

    # The endpoint service verification type, for example TXT.
    property type : String | Nil

    # The value the service provider adds to the private DNS name domain record before verification.
    property value : String | Nil

    # The name of the record subdomain the service provider needs to create. The service provider adds
    # the `value` text to the `name`.
    property name : String | Nil

    def initialize(
      @state : DnsNameState | Nil = nil,
      @type : String | Nil = nil,
      @value : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @type
        params << {"#{prefix}Type", value}
      end

      if value = @value
        params << {"#{prefix}Value", value}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::DnsNameState.from_json_object_key?(n.content) : nil,
        type: Core::XMLValue.string(node.xpath_node("*[local-name()='type']")),
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='value']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='name']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@state, @type, @value, @name)
  end
end
