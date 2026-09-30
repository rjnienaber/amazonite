private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The start day and time and the end day and time of the time range, in UTC.
  class InstanceEventWindowTimeRange
    # The day on which the time range begins.
    property start_week_day : WeekDay | Nil

    # The hour when the time range begins.
    property start_hour : Int32 | Nil

    # The day on which the time range ends.
    property end_week_day : WeekDay | Nil

    # The hour when the time range ends.
    property end_hour : Int32 | Nil

    def initialize(
      @start_week_day : WeekDay | Nil = nil,
      @start_hour : Int32 | Nil = nil,
      @end_week_day : WeekDay | Nil = nil,
      @end_hour : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @start_week_day
        params << {"#{prefix}StartWeekDay", value.to_json_object_key}
      end

      if value = @start_hour
        params << {"#{prefix}StartHour", value.to_s}
      end

      if value = @end_week_day
        params << {"#{prefix}EndWeekDay", value.to_json_object_key}
      end

      if value = @end_hour
        params << {"#{prefix}EndHour", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        start_week_day: (n = node.xpath_node("*[local-name()='startWeekDay']")) ? AEC::WeekDay.from_json_object_key?(n.content) : nil,
        start_hour: Core::XMLValue.i32(node.xpath_node("*[local-name()='startHour']")),
        end_week_day: (n = node.xpath_node("*[local-name()='endWeekDay']")) ? AEC::WeekDay.from_json_object_key?(n.content) : nil,
        end_hour: Core::XMLValue.i32(node.xpath_node("*[local-name()='endHour']")),
      )
    end

    def validate! : Nil
      if value = @start_hour
        raise Core::ValidationError.new("StartHour value must be >= 0") if value < 0
        raise Core::ValidationError.new("StartHour value must be <= 23") if value > 23
      end

      if value = @end_hour
        raise Core::ValidationError.new("EndHour value must be >= 0") if value < 0
        raise Core::ValidationError.new("EndHour value must be <= 23") if value > 23
      end
    end

    def_equals_and_hash(@start_week_day, @start_hour, @end_week_day, @end_hour)
  end
end
