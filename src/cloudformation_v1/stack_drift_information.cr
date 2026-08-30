private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Contains information about whether the stack's actual configuration differs, or has *drifted*,
  # from its expected configuration, as defined in the stack template and any values specified as
  # template parameters. A stack is considered to have drifted if one or more of its resources have
  # drifted.
  class StackDriftInformation
    # Status of the stack's actual configuration compared to its expected template configuration.
    #
    # - `DRIFTED`: The stack differs from its expected template configuration. A stack is considered
    # to have drifted if one or more of its resources have drifted.
    #
    # - `NOT_CHECKED`: CloudFormation hasn't checked if the stack differs from its expected template
    # configuration.
    #
    # - `IN_SYNC`: The stack's actual configuration matches its expected template configuration.
    #
    # - `UNKNOWN`: CloudFormation could not run drift detection for a resource in the stack.
    property stack_drift_status : StackDriftStatus

    # Most recent time when a drift detection operation was initiated on the stack, or any of its
    # individual resources that support drift detection.
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

    def_equals_and_hash(@stack_drift_status, @last_check_timestamp)
  end
end
