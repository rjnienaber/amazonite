private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateNetworkInterfaceResult
    # Information about the network interface.
    property network_interface : NetworkInterface | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property client_token : String | Nil

    def initialize(
      @network_interface : NetworkInterface | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_interface
        params.concat(value.to_query_params("#{prefix}NetworkInterface."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_interface: node.xpath_node("*[local-name()='networkInterface']").try { |n| NetworkInterface.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
      )
    end

    def validate! : Nil
      if value = @network_interface
        value.validate!
      end
    end

    def_equals_and_hash(@network_interface, @client_token)
  end
end
