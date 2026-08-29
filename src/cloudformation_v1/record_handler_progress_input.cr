private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class RecordHandlerProgressInput
    property bearer_token : String

    property operation_status : OperationStatus

    property current_operation_status : OperationStatus | Nil

    property status_message : String | Nil

    property error_code : HandlerErrorCode | Nil

    property resource_model : String | Nil

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
  end
end
