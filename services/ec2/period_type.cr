private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PeriodType
    FiveMinutes
    FifteenMinutes
    OneHour
    ThreeHours
    OneDay
    OneWeek

    def self.to_json(e : PeriodType, json : JSON::Builder) : Nil
      value = case e
              when AEC::PeriodType::FiveMinutes    then "five-minutes"
              when AEC::PeriodType::FifteenMinutes then "fifteen-minutes"
              when AEC::PeriodType::OneHour        then "one-hour"
              when AEC::PeriodType::ThreeHours     then "three-hours"
              when AEC::PeriodType::OneDay         then "one-day"
              when AEC::PeriodType::OneWeek        then "one-week"
              else
                raise Exception.new("unknown enum value for 'PeriodType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PeriodType
      value = pull.read_string
      case value
      when "five-minutes"    then AEC::PeriodType::FiveMinutes
      when "fifteen-minutes" then AEC::PeriodType::FifteenMinutes
      when "one-hour"        then AEC::PeriodType::OneHour
      when "three-hours"     then AEC::PeriodType::ThreeHours
      when "one-day"         then AEC::PeriodType::OneDay
      when "one-week"        then AEC::PeriodType::OneWeek
      else
        raise Exception.new("unknown enum value for 'PeriodType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::PeriodType::FiveMinutes    then "five-minutes"
      when AEC::PeriodType::FifteenMinutes then "fifteen-minutes"
      when AEC::PeriodType::OneHour        then "one-hour"
      when AEC::PeriodType::ThreeHours     then "three-hours"
      when AEC::PeriodType::OneDay         then "one-day"
      when AEC::PeriodType::OneWeek        then "one-week"
      else
        raise Exception.new("unknown enum value for 'PeriodType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::PeriodType?
      case key
      when "five-minutes"    then AEC::PeriodType::FiveMinutes
      when "fifteen-minutes" then AEC::PeriodType::FifteenMinutes
      when "one-hour"        then AEC::PeriodType::OneHour
      when "three-hours"     then AEC::PeriodType::ThreeHours
      when "one-day"         then AEC::PeriodType::OneDay
      when "one-week"        then AEC::PeriodType::OneWeek
      else
        nil
      end
    end
  end
end
