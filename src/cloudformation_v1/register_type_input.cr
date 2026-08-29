private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class RegisterTypeInput
    # The kind of extension.
    property type : RegistryType | Nil

    # The name of the extension being registered.
    #
    # We suggest that extension names adhere to the following patterns:
    #
    # - For resource types, `company_or_organization::service::type`.
    #
    # - For modules, `company_or_organization::service::type::MODULE`.
    #
    # - For Hooks, `MyCompany::Testing::MyTestHook`.
    #
    # The following organization namespaces are reserved and can't be used in your extension names:
    #
    # - `Alexa`
    #
    # - `AMZN`
    #
    # - `Amazon`
    #
    # - `AWS`
    #
    # - `Custom`
    #
    # - `Dev`
    property type_name : String

    # A URL to the S3 bucket that contains the extension project package that contains the necessary
    # files for the extension you want to register.
    #
    # For information about generating a schema handler package for the extension you want to
    # register, see
    # [submit](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-cli-submit.html)
    # in the *CloudFormation Command Line Interface (CLI) User Guide*.
    #
    # The user registering the extension must be able to access the package in the S3 bucket. That's,
    # the user needs to have
    # [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html) permissions for
    # the schema handler package. For more information, see [Actions, Resources, and Condition Keys
    # for Amazon S3](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazons3.html) in the
    # *Identity and Access Management User Guide*.
    property schema_handler_package : String

    # Specifies logging configuration information for an extension.
    property logging_config : LoggingConfig | Nil

    # The Amazon Resource Name (ARN) of the IAM role for CloudFormation to assume when invoking the
    # extension.
    #
    # For CloudFormation to assume the specified execution role, the role must contain a trust
    # relationship with the CloudFormation service principal
    # (`resources.cloudformation.amazonaws.com`). For more information about adding trust
    # relationships, see [Modifying a role trust
    # policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-managingrole-editing-console.html#roles-managingrole_edit-trust-policy)
    # in the *Identity and Access Management User Guide*.
    #
    # If your extension calls Amazon Web Services APIs in any of its handlers, you must create an *
    # [IAM execution role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html) * that
    # includes the necessary permissions to call those Amazon Web Services APIs, and provision that
    # execution role in your account. When CloudFormation needs to invoke the resource type handler,
    # CloudFormation assumes this execution role to create a temporary session token, which it then
    # passes to the resource type handler, thereby supplying your resource type with the appropriate
    # credentials.
    property execution_role_arn : String | Nil

    # A unique identifier that acts as an idempotency key for this registration request. Specifying a
    # client request token prevents CloudFormation from generating more than one version of an
    # extension from the same registration request, even if the request is submitted multiple times.
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
