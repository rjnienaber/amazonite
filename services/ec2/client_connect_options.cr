private alias Core = Amazonite::Core

module Amazonite::EC2
  # The options for managing connection authorization for new client connections.
  class ClientConnectOptions
    # Indicates whether client connect options are enabled. The default is `false` (not enabled).
    property enabled : Bool | Nil

    # The Amazon Resource Name (ARN) of the Lambda function used for connection authorization.
    property lambda_function_arn : String | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
      @lambda_function_arn : String | Nil = nil,
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")),
        lambda_function_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='LambdaFunctionArn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enabled, @lambda_function_arn)
  end
end
