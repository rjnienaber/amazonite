private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the time period for a Scheduled Instance to start its first schedule.
  class SlotStartTimeRangeRequest
    # The earliest date and time, in UTC, for the Scheduled Instance to start.
    property earliest_time : Time | Nil

    # The latest date and time, in UTC, for the Scheduled Instance to start.
    property latest_time : Time | Nil

    def initialize(
      @earliest_time : Time | Nil = nil,
      @latest_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @earliest_time
        params << {"#{prefix}EarliestTime", Core::QueryValue.time(value)}
      end

      if value = @latest_time
        params << {"#{prefix}LatestTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        earliest_time: Core::XMLValue.time(node.xpath_node("*[local-name()='EarliestTime']")),
        latest_time: Core::XMLValue.time(node.xpath_node("*[local-name()='LatestTime']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@earliest_time, @latest_time)
  end
end
