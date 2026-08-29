private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class RegisterTypeInput
    property type : RegistryType | Nil

    property type_name : String

    property schema_handler_package : String

    property logging_config : LoggingConfig | Nil

    property execution_role_arn : String | Nil

    property client_request_token : String | Nil

    def initialize(
      @type_name : String,
      @schema_handler_package : String,
      @type : RegistryType | Nil = nil,
      @logging_config : LoggingConfig | Nil = nil,
      @execution_role_arn : String | Nil = nil,
      @client_request_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      params << {"#{prefix}TypeName", @type_name}

      params << {"#{prefix}SchemaHandlerPackage", @schema_handler_package}

      if value = @logging_config
        params.concat(value.to_query_params("#{prefix}LoggingConfig."))
      end

      if value = @execution_role_arn
        params << {"#{prefix}ExecutionRoleArn", value}
      end

      if value = @client_request_token
        params << {"#{prefix}ClientRequestToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::RegistryType.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")).not_nil!,
        schema_handler_package: Core::XMLValue.string(node.xpath_node("*[local-name()='SchemaHandlerPackage']")).not_nil!,
        logging_config: node.xpath_node("*[local-name()='LoggingConfig']").try { |n| LoggingConfig.from_xml(n) },
        execution_role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ExecutionRoleArn']")),
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
      )
    end
  end
end
