private alias Core = Amazonite::Core

module Amazonite::EC2
  # The IKE version that is permitted for the VPN tunnel.
  class IKEVersionsRequestListValue
    # The IKE version.
    property value : String | Nil

    def initialize(
      @value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @value
        params << {"#{prefix}Value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='Value']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@value)
  end
end
