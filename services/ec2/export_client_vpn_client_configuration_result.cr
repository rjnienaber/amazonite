private alias Core = Amazonite::Core

module Amazonite::EC2
  class ExportClientVpnClientConfigurationResult
    # The contents of the Client VPN endpoint configuration file.
    property client_configuration : String | Nil

    def initialize(
      @client_configuration : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_configuration
        params << {"#{prefix}ClientConfiguration", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_configuration: Core::XMLValue.string(node.xpath_node("*[local-name()='clientConfiguration']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_configuration)
  end
end
