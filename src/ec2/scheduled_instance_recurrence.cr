private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the recurring schedule for a Scheduled Instance.
  class ScheduledInstanceRecurrence
    # The frequency (`Daily`, `Weekly`, or `Monthly`).
    property frequency : String | Nil

    # The interval quantity. The interval unit depends on the value of `frequency`. For example, every
    # 2 weeks or every 2 months.
    property interval : Int32 | Nil

    # The days. For a monthly schedule, this is one or more days of the month (1-31). For a weekly
    # schedule, this is one or more days of the week (1-7, where 1 is Sunday).
    property occurrence_day_set : Array(Int32) | Nil

    # Indicates whether the occurrence is relative to the end of the specified week or month.
    property occurrence_relative_to_end : Bool | Nil

    # The unit for `occurrenceDaySet` (`DayOfWeek` or `DayOfMonth`).
    property occurrence_unit : String | Nil

    def initialize(
      @frequency : String | Nil = nil,
      @interval : Int32 | Nil = nil,
      @occurrence_day_set : Array(Int32) | Nil = nil,
      @occurrence_relative_to_end : Bool | Nil = nil,
      @occurrence_unit : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @frequency
        params << {"#{prefix}Frequency", value}
      end

      if value = @interval
        params << {"#{prefix}Interval", value.to_s}
      end

      (@occurrence_day_set || [] of Int32).each_with_index(1) do |item, i|
        params << {"#{prefix}OccurrenceDaySet.#{i}", item.to_s}
      end

      if value = @occurrence_relative_to_end
        params << {"#{prefix}OccurrenceRelativeToEnd", Core::QueryValue.bool(value)}
      end

      if value = @occurrence_unit
        params << {"#{prefix}OccurrenceUnit", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        frequency: Core::XMLValue.string(node.xpath_node("*[local-name()='frequency']")),
        interval: Core::XMLValue.i32(node.xpath_node("*[local-name()='interval']")),
        occurrence_day_set: node.xpath_nodes("*[local-name()='occurrenceDaySet']/*[local-name()='item']").map { |n| n.content.to_i32 },
        occurrence_relative_to_end: Core::XMLValue.bool(node.xpath_node("*[local-name()='occurrenceRelativeToEnd']")),
        occurrence_unit: Core::XMLValue.string(node.xpath_node("*[local-name()='occurrenceUnit']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@frequency, @interval, @occurrence_day_set, @occurrence_relative_to_end, @occurrence_unit)
  end
end
