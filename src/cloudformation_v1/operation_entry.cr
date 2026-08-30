private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Contains information about a CloudFormation operation.
  class OperationEntry
    # The type of operation.
    property operation_type : OperationType | Nil

    # The unique identifier for the operation.
    property operation_id : String | Nil

    def initialize(
      @operation_type : OperationType | Nil = nil,
      @operation_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @operation_type
        params << {"#{prefix}OperationType", value.to_json_object_key}
      end

      if value = @operation_id
        params << {"#{prefix}OperationId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        operation_type: (n = node.xpath_node("*[local-name()='OperationType']")) ? ACF::OperationType.from_json_object_key?(n.content) : nil,
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
      )
    end

    def_equals_and_hash(@operation_type, @operation_id)
  end
end
