private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum CapacityProviderScalingMode
    Auto
    Manual

    def self.to_json(e : CapacityProviderScalingMode, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::CapacityProviderScalingMode
      value = pull.read_string
      case value
      when "Auto"   then AL::CapacityProviderScalingMode::Auto
      when "Manual" then AL::CapacityProviderScalingMode::Manual
      else
        raise Exception.new("unknown enum value for 'CapacityProviderScalingMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::CapacityProviderScalingMode?
      case key
      when "Auto"   then AL::CapacityProviderScalingMode::Auto
      when "Manual" then AL::CapacityProviderScalingMode::Manual
      else
        nil
      end
    end
  end
end
