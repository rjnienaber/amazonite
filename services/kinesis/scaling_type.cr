private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum ScalingType
    UniformScaling

    def self.to_json(e : ScalingType, json : JSON::Builder) : Nil
      value = case e
              when AK::ScalingType::UniformScaling then "UNIFORM_SCALING"
              else
                raise Exception.new("unknown enum value for 'ScalingType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::ScalingType
      value = pull.read_string
      case value
      when "UNIFORM_SCALING" then AK::ScalingType::UniformScaling
      else
        raise Exception.new("unknown enum value for 'ScalingType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::ScalingType::UniformScaling then "UNIFORM_SCALING"
      else
        raise Exception.new("unknown enum value for 'ScalingType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::ScalingType?
      case key
      when "UNIFORM_SCALING" then AK::ScalingType::UniformScaling
      else
        nil
      end
    end
  end
end
