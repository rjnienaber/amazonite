private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum LogType
    None
    Tail

    def self.to_json(e : LogType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::LogType
      value = pull.read_string
      case value
      when "None" then AL::LogType::None
      when "Tail" then AL::LogType::Tail
      else
        raise Exception.new("unknown enum value for 'LogType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::LogType?
      case key
      when "None" then AL::LogType::None
      when "Tail" then AL::LogType::Tail
      else
        nil
      end
    end
  end
end
