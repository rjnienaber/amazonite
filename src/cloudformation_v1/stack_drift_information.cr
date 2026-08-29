private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class StackDriftInformation
    property stack_drift_status : StackDriftStatus

    property last_check_timestamp : Time | Nil

    def initialize(
      @stack_drift_status : StackDriftStatus,
      @last_check_timestamp : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}StackDriftStatus", @stack_drift_status.to_json_object_key}

      if value = @last_check_timestamp
        params << {"#{prefix}LastCheckTimestamp", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        stack_drift_status: ((n = node.xpath_node("*[local-name()='StackDriftStatus']")) ? ACF::StackDriftStatus.from_json_object_key?(n.content) : nil).not_nil!,
        last_check_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='LastCheckTimestamp']")),
      )
    end
  end
end
