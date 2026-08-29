private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackResourceDriftInformationSummary
    property stack_resource_drift_status : StackResourceDriftStatus

    property last_check_timestamp : Time | Nil

    def initialize(
      @stack_resource_drift_status : StackResourceDriftStatus,
      @last_check_timestamp : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackResourceDriftStatus", @stack_resource_drift_status.to_json_object_key}

      if value = @last_check_timestamp
        params << {"#{prefix}LastCheckTimestamp", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_resource_drift_status: ((n = node.xpath_node("*[local-name()='StackResourceDriftStatus']")) ? ACF::StackResourceDriftStatus.from_json_object_key?(n.content) : nil).not_nil!,
        last_check_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='LastCheckTimestamp']")),
      )
    end
  end
end
