private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum ApplicationLogLevel
    Trace
    Debug
    Info
    Warn
    Error
    Fatal

    def self.to_json(e : ApplicationLogLevel, json : JSON::Builder) : Nil
      value = case e
              when AL::ApplicationLogLevel::Trace then "TRACE"
              when AL::ApplicationLogLevel::Debug then "DEBUG"
              when AL::ApplicationLogLevel::Info  then "INFO"
              when AL::ApplicationLogLevel::Warn  then "WARN"
              when AL::ApplicationLogLevel::Error then "ERROR"
              when AL::ApplicationLogLevel::Fatal then "FATAL"
              else
                raise Exception.new("unknown enum value for 'ApplicationLogLevel' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::ApplicationLogLevel
      value = pull.read_string
      case value
      when "TRACE" then AL::ApplicationLogLevel::Trace
      when "DEBUG" then AL::ApplicationLogLevel::Debug
      when "INFO"  then AL::ApplicationLogLevel::Info
      when "WARN"  then AL::ApplicationLogLevel::Warn
      when "ERROR" then AL::ApplicationLogLevel::Error
      when "FATAL" then AL::ApplicationLogLevel::Fatal
      else
        raise Exception.new("unknown enum value for 'ApplicationLogLevel' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::ApplicationLogLevel::Trace then "TRACE"
      when AL::ApplicationLogLevel::Debug then "DEBUG"
      when AL::ApplicationLogLevel::Info  then "INFO"
      when AL::ApplicationLogLevel::Warn  then "WARN"
      when AL::ApplicationLogLevel::Error then "ERROR"
      when AL::ApplicationLogLevel::Fatal then "FATAL"
      else
        raise Exception.new("unknown enum value for 'ApplicationLogLevel' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::ApplicationLogLevel?
      case key
      when "TRACE" then AL::ApplicationLogLevel::Trace
      when "DEBUG" then AL::ApplicationLogLevel::Debug
      when "INFO"  then AL::ApplicationLogLevel::Info
      when "WARN"  then AL::ApplicationLogLevel::Warn
      when "ERROR" then AL::ApplicationLogLevel::Error
      when "FATAL" then AL::ApplicationLogLevel::Fatal
      else
        nil
      end
    end
  end
end
