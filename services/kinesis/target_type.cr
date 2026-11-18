private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum TargetType
    BuiltIn
    None

    def self.to_json(e : TargetType, json : JSON::Builder) : Nil
      value = case e
              when AK::TargetType::BuiltIn then "BUILT_IN"
              when AK::TargetType::None    then "NONE"
              else
                raise Exception.new("unknown enum value for 'TargetType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::TargetType
      value = pull.read_string
      case value
      when "BUILT_IN" then AK::TargetType::BuiltIn
      when "NONE"     then AK::TargetType::None
      else
        raise Exception.new("unknown enum value for 'TargetType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::TargetType::BuiltIn then "BUILT_IN"
      when AK::TargetType::None    then "NONE"
      else
        raise Exception.new("unknown enum value for 'TargetType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::TargetType?
      case key
      when "BUILT_IN" then AK::TargetType::BuiltIn
      when "NONE"     then AK::TargetType::None
      else
        nil
      end
    end
  end
end
