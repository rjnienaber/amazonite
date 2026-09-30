private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a tag key that is being monitored by Capacity Manager, including its activation status
  # and the earliest available data point.
  class CapacityManagerMonitoredTagKey
    # The tag key being monitored.
    property tag_key : String | Nil

    # The current status of the monitored tag key. Valid values are `activating`, `activated`,
    # `deactivating`, and `suspended`.
    property status : CapacityManagerMonitoredTagKeyStatus | Nil

    # A message providing additional details about the current status of the monitored tag key.
    property status_message : String | Nil

    # Indicates whether this tag key is provided by Capacity Manager by default, rather than being
    # user-activated.
    property capacity_manager_provided : Bool | Nil

    # The earliest timestamp from which tag data is available for queries, in UTC ISO 8601 format.
    property earliest_datapoint_timestamp : Time | Nil

    def initialize(
      @tag_key : String | Nil = nil,
      @status : CapacityManagerMonitoredTagKeyStatus | Nil = nil,
      @status_message : String | Nil = nil,
      @capacity_manager_provided : Bool | Nil = nil,
      @earliest_datapoint_timestamp : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @tag_key
        params << {"#{prefix}TagKey", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      if value = @capacity_manager_provided
        params << {"#{prefix}CapacityManagerProvided", Core::QueryValue.bool(value)}
      end

      if value = @earliest_datapoint_timestamp
        params << {"#{prefix}EarliestDatapointTimestamp", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        tag_key: Core::XMLValue.string(node.xpath_node("*[local-name()='tagKey']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::CapacityManagerMonitoredTagKeyStatus.from_json_object_key?(n.content) : nil,
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        capacity_manager_provided: Core::XMLValue.bool(node.xpath_node("*[local-name()='capacityManagerProvided']")),
        earliest_datapoint_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='earliestDatapointTimestamp']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@tag_key, @status, @status_message, @capacity_manager_provided, @earliest_datapoint_timestamp)
  end
end
