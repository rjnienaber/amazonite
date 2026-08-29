private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum EventSourceMappingSystemLogLevel
    Debug
    Info
    Warn

    def self.to_json(e : EventSourceMappingSystemLogLevel, json : JSON::Builder) : Nil
      value = case e
              when AL::EventSourceMappingSystemLogLevel::Debug then "DEBUG"
              when AL::EventSourceMappingSystemLogLevel::Info  then "INFO"
              when AL::EventSourceMappingSystemLogLevel::Warn  then "WARN"
              else
                raise Exception.new("unknown enum value for 'EventSourceMappingSystemLogLevel' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::EventSourceMappingSystemLogLevel
      value = pull.read_string
      case value
      when "DEBUG" then AL::EventSourceMappingSystemLogLevel::Debug
      when "INFO"  then AL::EventSourceMappingSystemLogLevel::Info
      when "WARN"  then AL::EventSourceMappingSystemLogLevel::Warn
      else
        raise Exception.new("unknown enum value for 'EventSourceMappingSystemLogLevel' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::EventSourceMappingSystemLogLevel::Debug then "DEBUG"
      when AL::EventSourceMappingSystemLogLevel::Info  then "INFO"
      when AL::EventSourceMappingSystemLogLevel::Warn  then "WARN"
      else
        raise Exception.new("unknown enum value for 'EventSourceMappingSystemLogLevel' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::EventSourceMappingSystemLogLevel?
      case key
      when "DEBUG" then AL::EventSourceMappingSystemLogLevel::Debug
      when "INFO"  then AL::EventSourceMappingSystemLogLevel::Info
      when "WARN"  then AL::EventSourceMappingSystemLogLevel::Warn
      else
        nil
      end
    end
  end
end
