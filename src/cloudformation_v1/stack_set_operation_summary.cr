private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackSetOperationSummary
    property operation_id : String | Nil

    property action : StackSetOperationAction | Nil

    property status : StackSetOperationStatus | Nil

    property creation_timestamp : Time | Nil

    property end_timestamp : Time | Nil

    property status_reason : String | Nil

    property status_details : StackSetOperationStatusDetails | Nil

    property operation_preferences : StackSetOperationPreferences | Nil

    def initialize(
      @operation_id : String | Nil = nil,
      @action : StackSetOperationAction | Nil = nil,
      @status : StackSetOperationStatus | Nil = nil,
      @creation_timestamp : Time | Nil = nil,
      @end_timestamp : Time | Nil = nil,
      @status_reason : String | Nil = nil,
      @status_details : StackSetOperationStatusDetails | Nil = nil,
      @operation_preferences : StackSetOperationPreferences | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @operation_id
        params << {"#{prefix}OperationId", value}
      end

      if value = @action
        params << {"#{prefix}Action", value.to_json_object_key}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @creation_timestamp
        params << {"#{prefix}CreationTimestamp", Core::QueryValue.time(value)}
      end

      if value = @end_timestamp
        params << {"#{prefix}EndTimestamp", Core::QueryValue.time(value)}
      end

      if value = @status_reason
        params << {"#{prefix}StatusReason", value}
      end

      if value = @status_details
        params.concat(value.to_query_params("#{prefix}StatusDetails."))
      end

      if value = @operation_preferences
        params.concat(value.to_query_params("#{prefix}OperationPreferences."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OperationId']")),
        action: (n = node.xpath_node("*[local-name()='Action']")) ? ACF::StackSetOperationAction.from_json_object_key?(n.content) : nil,
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::StackSetOperationStatus.from_json_object_key?(n.content) : nil,
        creation_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='CreationTimestamp']")),
        end_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='EndTimestamp']")),
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
        status_details: node.xpath_node("*[local-name()='StatusDetails']").try { |n| StackSetOperationStatusDetails.from_xml(n) },
        operation_preferences: node.xpath_node("*[local-name()='OperationPreferences']").try { |n| StackSetOperationPreferences.from_xml(n) },
      )
    end
  end
end
