private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVpcEndpointResult
    # Information about the endpoint.
    property vpc_endpoint : VpcEndpoint | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    property client_token : String | Nil

    def initialize(
      @vpc_endpoint : VpcEndpoint | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpc_endpoint
        params.concat(value.to_query_params("#{prefix}VpcEndpoint."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_endpoint: node.xpath_node("*[local-name()='vpcEndpoint']").try { |n| VpcEndpoint.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
      )
    end

    def validate! : Nil
      if value = @vpc_endpoint
        value.validate!
      end
    end

    def_equals_and_hash(@vpc_endpoint, @client_token)
  end
end
