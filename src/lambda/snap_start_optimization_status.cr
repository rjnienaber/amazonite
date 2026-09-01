private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum SnapStartOptimizationStatus
    On
    Off

    def self.to_json(e : SnapStartOptimizationStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::SnapStartOptimizationStatus
      value = pull.read_string
      case value
      when "On"  then AL::SnapStartOptimizationStatus::On
      when "Off" then AL::SnapStartOptimizationStatus::Off
      else
        raise Exception.new("unknown enum value for 'SnapStartOptimizationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::SnapStartOptimizationStatus?
      case key
      when "On"  then AL::SnapStartOptimizationStatus::On
      when "Off" then AL::SnapStartOptimizationStatus::Off
      else
        nil
      end
    end
  end
end
