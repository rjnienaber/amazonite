private alias AEB = Amazonite::EventBridge

module Amazonite::EventBridge
  enum Level
    Off
    Error
    Info
    Trace

    def self.to_json(e : Level, json : JSON::Builder) : Nil
      value = case e
              when AEB::Level::Off   then "OFF"
              when AEB::Level::Error then "ERROR"
              when AEB::Level::Info  then "INFO"
              when AEB::Level::Trace then "TRACE"
              else
                raise Exception.new("unknown enum value for 'Level' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::Level
      value = pull.read_string
      case value
      when "OFF"   then AEB::Level::Off
      when "ERROR" then AEB::Level::Error
      when "INFO"  then AEB::Level::Info
      when "TRACE" then AEB::Level::Trace
      else
        raise Exception.new("unknown enum value for 'Level' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::Level::Off   then "OFF"
      when AEB::Level::Error then "ERROR"
      when AEB::Level::Info  then "INFO"
      when AEB::Level::Trace then "TRACE"
      else
        raise Exception.new("unknown enum value for 'Level' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::Level?
      case key
      when "OFF"   then AEB::Level::Off
      when "ERROR" then AEB::Level::Error
      when "INFO"  then AEB::Level::Info
      when "TRACE" then AEB::Level::Trace
      else
        nil
      end
    end
  end
end
