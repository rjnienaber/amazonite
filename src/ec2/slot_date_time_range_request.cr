private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the time period for a Scheduled Instance to start its first schedule. The time period
  # must span less than one day.
  class SlotDateTimeRangeRequest
    # The earliest date and time, in UTC, for the Scheduled Instance to start.
    property earliest_time : Time

    # The latest date and time, in UTC, for the Scheduled Instance to start. This value must be later
    # than or equal to the earliest date and at most three months in the future.
    property latest_time : Time

    def initialize(
      @earliest_time : Time,
      @latest_time : Time,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}EarliestTime", Core::QueryValue.time(@earliest_time)}

      params << {"#{prefix}LatestTime", Core::QueryValue.time(@latest_time)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        earliest_time: Core::XMLValue.time(node.xpath_node("*[local-name()='EarliestTime']")).not_nil!,
        latest_time: Core::XMLValue.time(node.xpath_node("*[local-name()='LatestTime']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@earliest_time, @latest_time)
  end
end
