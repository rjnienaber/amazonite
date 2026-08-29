private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackInstance
    property stack_set_id : String | Nil

    property region : String | Nil

    property account : String | Nil

    property stack_id : String | Nil

    property parameter_overrides : Array(Parameter) | Nil

    property status : StackInstanceStatus | Nil

    property stack_instance_status : StackInstanceComprehensiveStatus | Nil

    property status_reason : String | Nil

    property organizational_unit_id : String | Nil

    property drift_status : StackDriftStatus | Nil

    property last_drift_check_timestamp : Time | Nil

    property last_operation_id : String | Nil

    def initialize(
      @stack_set_id : String | Nil = nil,
      @region : String | Nil = nil,
      @account : String | Nil = nil,
      @stack_id : String | Nil = nil,
      @parameter_overrides : Array(Parameter) | Nil = nil,
      @status : StackInstanceStatus | Nil = nil,
      @stack_instance_status : StackInstanceComprehensiveStatus | Nil = nil,
      @status_reason : String | Nil = nil,
      @organizational_unit_id : String | Nil = nil,
      @drift_status : StackDriftStatus | Nil = nil,
      @last_drift_check_timestamp : Time | Nil = nil,
      @last_operation_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @stack_set_id
        params << {"#{prefix}StackSetId", value}
      end

      if value = @region
        params << {"#{prefix}Region", value}
      end

      if value = @account
        params << {"#{prefix}Account", value}
      end

      if value = @stack_id
        params << {"#{prefix}StackId", value}
      end

      (@parameter_overrides || [] of Parameter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ParameterOverrides.member.#{i}."))
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @stack_instance_status
        params.concat(value.to_query_params("#{prefix}StackInstanceStatus."))
      end

      if value = @status_reason
        params << {"#{prefix}StatusReason", value}
      end

      if value = @organizational_unit_id
        params << {"#{prefix}OrganizationalUnitId", value}
      end

      if value = @drift_status
        params << {"#{prefix}DriftStatus", value.to_json_object_key}
      end

      if value = @last_drift_check_timestamp
        params << {"#{prefix}LastDriftCheckTimestamp", Core::QueryValue.time(value)}
      end

      if value = @last_operation_id
        params << {"#{prefix}LastOperationId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_set_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackSetId']")),
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='Region']")),
        account: Core::XMLValue.string(node.xpath_node("*[local-name()='Account']")),
        stack_id: Core::XMLValue.string(node.xpath_node("*[local-name()='StackId']")),
        parameter_overrides: node.xpath_nodes("*[local-name()='ParameterOverrides']/*[local-name()='member']").map { |n| Parameter.from_xml(n) },
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::StackInstanceStatus.from_json_object_key?(n.content) : nil,
        stack_instance_status: node.xpath_node("*[local-name()='StackInstanceStatus']").try { |n| StackInstanceComprehensiveStatus.from_xml(n) },
        status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusReason']")),
        organizational_unit_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OrganizationalUnitId']")),
        drift_status: (n = node.xpath_node("*[local-name()='DriftStatus']")) ? ACF::StackDriftStatus.from_json_object_key?(n.content) : nil,
        last_drift_check_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='LastDriftCheckTimestamp']")),
        last_operation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='LastOperationId']")),
      )
    end
  end
end
