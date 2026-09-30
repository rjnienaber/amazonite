private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateInstanceConnectEndpointResult
    # Information about the EC2 Instance Connect Endpoint.
    property instance_connect_endpoint : Ec2InstanceConnectEndpoint | Nil

    # Unique, case-sensitive idempotency token provided by the client in the the request.
    property client_token : String | Nil

    def initialize(
      @instance_connect_endpoint : Ec2InstanceConnectEndpoint | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_connect_endpoint
        params.concat(value.to_query_params("#{prefix}InstanceConnectEndpoint."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_connect_endpoint: node.xpath_node("*[local-name()='instanceConnectEndpoint']").try { |n| Ec2InstanceConnectEndpoint.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
      )
    end

    def validate! : Nil
      if value = @instance_connect_endpoint
        value.validate!
      end
    end

    def_equals_and_hash(@instance_connect_endpoint, @client_token)
  end
end
