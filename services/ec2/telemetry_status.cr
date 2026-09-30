private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TelemetryStatus
    Up
    Down

    def self.to_json(e : TelemetryStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::TelemetryStatus::Up   then "UP"
              when AEC::TelemetryStatus::Down then "DOWN"
              else
                raise Exception.new("unknown enum value for 'TelemetryStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TelemetryStatus
      value = pull.read_string
      case value
      when "UP"   then AEC::TelemetryStatus::Up
      when "DOWN" then AEC::TelemetryStatus::Down
      else
        raise Exception.new("unknown enum value for 'TelemetryStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TelemetryStatus::Up   then "UP"
      when AEC::TelemetryStatus::Down then "DOWN"
      else
        raise Exception.new("unknown enum value for 'TelemetryStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TelemetryStatus?
      case key
      when "UP"   then AEC::TelemetryStatus::Up
      when "DOWN" then AEC::TelemetryStatus::Down
      else
        nil
      end
    end
  end
end
