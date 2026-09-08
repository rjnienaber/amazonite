private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVpcEndpointServiceConfigurationResult
    # Information about the service configuration.
    property service_configuration : ServiceConfiguration | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    property client_token : String | Nil

    def initialize(
      @service_configuration : ServiceConfiguration | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @service_configuration
        params.concat(value.to_query_params("#{prefix}ServiceConfiguration."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_configuration: node.xpath_node("*[local-name()='serviceConfiguration']").try { |n| ServiceConfiguration.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
      )
    end

    def validate! : Nil
      if value = @service_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@service_configuration, @client_token)
  end
end
