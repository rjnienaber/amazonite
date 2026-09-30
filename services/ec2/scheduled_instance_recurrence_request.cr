private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the recurring schedule for a Scheduled Instance.
  class ScheduledInstanceRecurrenceRequest
    # The frequency (`Daily`, `Weekly`, or `Monthly`).
    property frequency : String | Nil

    # The interval quantity. The interval unit depends on the value of `Frequency`. For example, every
    # 2 weeks or every 2 months.
    property interval : Int32 | Nil

    # The days. For a monthly schedule, this is one or more days of the month (1-31). For a weekly
    # schedule, this is one or more days of the week (1-7, where 1 is Sunday). You can't specify this
    # value with a daily schedule. If the occurrence is relative to the end of the month, you can
    # specify only a single day.
    property occurrence_days : Array(Int32) | Nil

    # Indicates whether the occurrence is relative to the end of the specified week or month. You
    # can't specify this value with a daily schedule.
    property occurrence_relative_to_end : Bool | Nil

    # The unit for `OccurrenceDays` (`DayOfWeek` or `DayOfMonth`). This value is required for a
    # monthly schedule. You can't specify `DayOfWeek` with a weekly schedule. You can't specify this
    # value with a daily schedule.
    property occurrence_unit : String | Nil

    def initialize(
      @frequency : String | Nil = nil,
      @interval : Int32 | Nil = nil,
      @occurrence_days : Array(Int32) | Nil = nil,
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

      (@occurrence_days || [] of Int32).each_with_index(1) do |item, i|
        params << {"#{prefix}OccurrenceDay.#{i}", item.to_s}
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
        frequency: Core::XMLValue.string(node.xpath_node("*[local-name()='Frequency']")),
        interval: Core::XMLValue.i32(node.xpath_node("*[local-name()='Interval']")),
        occurrence_days: node.xpath_nodes("*[local-name()='OccurrenceDay']/*[local-name()='OccurenceDay']").map { |n| n.content.to_i32 },
        occurrence_relative_to_end: Core::XMLValue.bool(node.xpath_node("*[local-name()='OccurrenceRelativeToEnd']")),
        occurrence_unit: Core::XMLValue.string(node.xpath_node("*[local-name()='OccurrenceUnit']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@frequency, @interval, @occurrence_days, @occurrence_relative_to_end, @occurrence_unit)
  end
end
