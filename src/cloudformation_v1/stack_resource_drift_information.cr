private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Contains information about whether the resource's actual configuration differs, or has
  # *drifted*, from its expected configuration.
  class StackResourceDriftInformation
    # Status of the resource's actual configuration compared to its expected configuration
    #
    # - `DELETED`: The resource differs from its expected configuration in that it has been deleted.
    #
    # - `MODIFIED`: The resource differs from its expected configuration.
    #
    # - `NOT_CHECKED`: CloudFormation has not checked if the resource differs from its expected
    # configuration.
    #
    # Any resources that do not currently support drift detection have a status of `NOT_CHECKED`. For
    # more information, see [Resource type support for imports and drift
    # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html).
    #
    # - `IN_SYNC`: The resource's actual configuration matches its expected configuration.
    property stack_resource_drift_status : StackResourceDriftStatus

    # When CloudFormation last checked if the resource had drifted from its expected configuration.
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
