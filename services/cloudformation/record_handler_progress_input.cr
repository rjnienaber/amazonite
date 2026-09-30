private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class RecordHandlerProgressInput
    # Reserved for use by the [CloudFormation
    # CLI](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html).
    property bearer_token : String

    # Reserved for use by the [CloudFormation
    # CLI](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html).
    property operation_status : OperationStatus

    # Reserved for use by the [CloudFormation
    # CLI](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html).
    property current_operation_status : OperationStatus | Nil

    # Reserved for use by the [CloudFormation
    # CLI](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html).
    property status_message : String | Nil

    # Reserved for use by the [CloudFormation
    # CLI](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html).
    property error_code : HandlerErrorCode | Nil

    # Reserved for use by the [CloudFormation
    # CLI](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html).
    property resource_model : String | Nil

    # Reserved for use by the [CloudFormation
    # CLI](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html).
    property client_request_token : String | Nil

    def initialize(
      @bearer_token : String,
      @operation_status : OperationStatus,
      @current_operation_status : OperationStatus | Nil = nil,
      @status_message : String | Nil = nil,
      @error_code : HandlerErrorCode | Nil = nil,
      @resource_model : String | Nil = nil,
      @client_request_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}BearerToken", @bearer_token}

      params << {"#{prefix}OperationStatus", @operation_status.to_json_object_key}

      if value = @current_operation_status
        params << {"#{prefix}CurrentOperationStatus", value.to_json_object_key}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      if value = @error_code
        params << {"#{prefix}ErrorCode", value.to_json_object_key}
      end

      if value = @resource_model
        params << {"#{prefix}ResourceModel", value}
      end

      if value = @client_request_token
        params << {"#{prefix}ClientRequestToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        bearer_token: Core::XMLValue.string(node.xpath_node("*[local-name()='BearerToken']")).not_nil!,
        operation_status: ((n = node.xpath_node("*[local-name()='OperationStatus']")) ? ACF::OperationStatus.from_json_object_key?(n.content) : nil).not_nil!,
        current_operation_status: (n = node.xpath_node("*[local-name()='CurrentOperationStatus']")) ? ACF::OperationStatus.from_json_object_key?(n.content) : nil,
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusMessage']")),
        error_code: (n = node.xpath_node("*[local-name()='ErrorCode']")) ? ACF::HandlerErrorCode.from_json_object_key?(n.content) : nil,
        resource_model: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceModel']")),
        client_request_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRequestToken']")),
      )
    end

    def validate! : Nil
      if value = @bearer_token
        raise Core::ValidationError.new("BearerToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("BearerToken length must be <= 128") if value.size > 128
      end

      if value = @status_message
        raise Core::ValidationError.new("StatusMessage length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StatusMessage length must be <= 1024") if value.size > 1024
      end

      if value = @resource_model
        raise Core::ValidationError.new("ResourceModel length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceModel length must be <= 16384") if value.size > 16384
      end

      if value = @client_request_token
        raise Core::ValidationError.new("ClientRequestToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientRequestToken length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ClientRequestToken does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9][-a-zA-Z0-9]*$"))
      end
    end

    def_equals_and_hash(@bearer_token, @operation_status, @current_operation_status, @status_message, @error_code, @resource_model, @client_request_token)
  end
end
