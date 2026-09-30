private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  enum QuotaPeriodType
    Day
    Week
    Month

    def self.to_json(e : QuotaPeriodType, json : JSON::Builder) : Nil
      value = case e
              when AAG::QuotaPeriodType::Day   then "DAY"
              when AAG::QuotaPeriodType::Week  then "WEEK"
              when AAG::QuotaPeriodType::Month then "MONTH"
              else
                raise Exception.new("unknown enum value for 'QuotaPeriodType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::QuotaPeriodType
      value = pull.read_string
      case value
      when "DAY"   then AAG::QuotaPeriodType::Day
      when "WEEK"  then AAG::QuotaPeriodType::Week
      when "MONTH" then AAG::QuotaPeriodType::Month
      else
        raise Exception.new("unknown enum value for 'QuotaPeriodType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::QuotaPeriodType::Day   then "DAY"
      when AAG::QuotaPeriodType::Week  then "WEEK"
      when AAG::QuotaPeriodType::Month then "MONTH"
      else
        raise Exception.new("unknown enum value for 'QuotaPeriodType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::QuotaPeriodType?
      case key
      when "DAY"   then AAG::QuotaPeriodType::Day
      when "WEEK"  then AAG::QuotaPeriodType::Week
      when "MONTH" then AAG::QuotaPeriodType::Month
      else
        nil
      end
    end
  end
end
