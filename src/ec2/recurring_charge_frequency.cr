private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RecurringChargeFrequency
    Hourly

    def self.to_json(e : RecurringChargeFrequency, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RecurringChargeFrequency
      value = pull.read_string
      case value
      when "Hourly" then AEC::RecurringChargeFrequency::Hourly
      else
        raise Exception.new("unknown enum value for 'RecurringChargeFrequency' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::RecurringChargeFrequency?
      case key
      when "Hourly" then AEC::RecurringChargeFrequency::Hourly
      else
        nil
      end
    end
  end
end
