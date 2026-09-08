private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeFleetHistoryResult
    # Information about the events in the history of the EC2 Fleet.
    property history_records : Array(HistoryRecordEntry) | Nil

    # The last date and time for the events, in UTC format (for example,
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z). All records up to this time were retrieved.
    #
    # If `nextToken` indicates that there are more items, this value is not present.
    property last_evaluated_time : Time | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # The ID of the EC Fleet.
    property fleet_id : String | Nil

    # The start date and time for the events, in UTC format (for example,
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z).
    property start_time : Time | Nil

    def initialize(
      @history_records : Array(HistoryRecordEntry) | Nil = nil,
      @last_evaluated_time : Time | Nil = nil,
      @next_token : String | Nil = nil,
      @fleet_id : String | Nil = nil,
      @start_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@history_records || [] of HistoryRecordEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}HistoryRecordSet.#{i}."))
      end

      if value = @last_evaluated_time
        params << {"#{prefix}LastEvaluatedTime", Core::QueryValue.time(value)}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @fleet_id
        params << {"#{prefix}FleetId", value}
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        history_records: node.xpath_nodes("*[local-name()='historyRecordSet']/*[local-name()='item']").map { |n| HistoryRecordEntry.from_xml(n) },
        last_evaluated_time: Core::XMLValue.time(node.xpath_node("*[local-name()='lastEvaluatedTime']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fleetId']")),
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='startTime']")),
      )
    end

    def validate! : Nil
      if value = @history_records
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@history_records, @last_evaluated_time, @next_token, @fleet_id, @start_time)
  end
end
