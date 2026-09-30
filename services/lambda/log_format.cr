private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum LogFormat
    Json
    Text

    def self.to_json(e : LogFormat, json : JSON::Builder) : Nil
      value = case e
              when AL::LogFormat::Json then "JSON"
              when AL::LogFormat::Text then "Text"
              else
                raise Exception.new("unknown enum value for 'LogFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::LogFormat
      value = pull.read_string
      case value
      when "JSON" then AL::LogFormat::Json
      when "Text" then AL::LogFormat::Text
      else
        raise Exception.new("unknown enum value for 'LogFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::LogFormat::Json then "JSON"
      when AL::LogFormat::Text then "Text"
      else
        raise Exception.new("unknown enum value for 'LogFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::LogFormat?
      case key
      when "JSON" then AL::LogFormat::Json
      when "Text" then AL::LogFormat::Text
      else
        nil
      end
    end
  end
end
