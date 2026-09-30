private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeFleetHistoryRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The type of events to describe. By default, all events are described.
    property event_type : FleetEventType | Nil

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # The ID of the EC2 Fleet.
    property fleet_id : String

    # The start date and time for the events, in UTC format (for example,
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z).
    property start_time : Time

    def initialize(
      @fleet_id : String,
      @start_time : Time,
      @dry_run : Bool | Nil = nil,
      @event_type : FleetEventType | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @event_type
        params << {"#{prefix}EventType", value.to_json_object_key}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      params << {"#{prefix}FleetId", @fleet_id}

      params << {"#{prefix}StartTime", Core::QueryValue.time(@start_time)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        event_type: (n = node.xpath_node("*[local-name()='EventType']")) ? AEC::FleetEventType.from_json_object_key?(n.content) : nil,
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='FleetId']")).not_nil!,
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='StartTime']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @event_type, @max_results, @next_token, @fleet_id, @start_time)
  end
end
