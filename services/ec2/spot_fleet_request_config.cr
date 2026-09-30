private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Spot Fleet request.
  class SpotFleetRequestConfig
    # The progress of the Spot Fleet request. If there is an error, the status is `error`. After all
    # requests are placed, the status is `pending_fulfillment`. If the size of the fleet is equal to
    # or greater than its target capacity, the status is `fulfilled`. If the size of the fleet is
    # decreased, the status is `pending_termination` while Spot Instances are terminating.
    property activity_status : ActivityStatus | Nil

    # The creation date and time of the request.
    property create_time : Time | Nil

    # The configuration of the Spot Fleet request.
    property spot_fleet_request_config : SpotFleetRequestConfigData | Nil

    # The ID of the Spot Fleet request.
    property spot_fleet_request_id : String | Nil

    # The state of the Spot Fleet request.
    property spot_fleet_request_state : BatchState | Nil

    # The tags for a Spot Fleet resource.
    property tags : Array(Tag) | Nil

    def initialize(
      @activity_status : ActivityStatus | Nil = nil,
      @create_time : Time | Nil = nil,
      @spot_fleet_request_config : SpotFleetRequestConfigData | Nil = nil,
      @spot_fleet_request_id : String | Nil = nil,
      @spot_fleet_request_state : BatchState | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @activity_status
        params << {"#{prefix}ActivityStatus", value.to_json_object_key}
      end

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      if value = @spot_fleet_request_config
        params.concat(value.to_query_params("#{prefix}SpotFleetRequestConfig."))
      end

      if value = @spot_fleet_request_id
        params << {"#{prefix}SpotFleetRequestId", value}
      end

      if value = @spot_fleet_request_state
        params << {"#{prefix}SpotFleetRequestState", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        activity_status: (n = node.xpath_node("*[local-name()='activityStatus']")) ? AEC::ActivityStatus.from_json_object_key?(n.content) : nil,
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        spot_fleet_request_config: node.xpath_node("*[local-name()='spotFleetRequestConfig']").try { |n| SpotFleetRequestConfigData.from_xml(n) },
        spot_fleet_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='spotFleetRequestId']")),
        spot_fleet_request_state: (n = node.xpath_node("*[local-name()='spotFleetRequestState']")) ? AEC::BatchState.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @spot_fleet_request_config
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@activity_status, @create_time, @spot_fleet_request_config, @spot_fleet_request_id, @spot_fleet_request_state, @tags)
  end
end
