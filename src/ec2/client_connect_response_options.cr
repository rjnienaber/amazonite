private alias Core = Amazonite::Core

module Amazonite::EC2
  # The options for managing connection authorization for new client connections.
  class ClientConnectResponseOptions
    # Indicates whether client connect options are enabled.
    property enabled : Bool | Nil

    # The Amazon Resource Name (ARN) of the Lambda function used for connection authorization.
    property lambda_function_arn : String | Nil

    # The status of any updates to the client connect options.
    property status : ClientVpnEndpointAttributeStatus | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
      @lambda_function_arn : String | Nil = nil,
      @status : ClientVpnEndpointAttributeStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enabled
        params << {"#{prefix}Enabled", Core::QueryValue.bool(value)}
      end

      if value = @lambda_function_arn
        params << {"#{prefix}LambdaFunctionArn", value}
      end

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='enabled']")),
        lambda_function_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='lambdaFunctionArn']")),
        status: node.xpath_node("*[local-name()='status']").try { |n| ClientVpnEndpointAttributeStatus.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @status
        value.validate!
      end
    end

    def_equals_and_hash(@enabled, @lambda_function_arn, @status)
  end
end
