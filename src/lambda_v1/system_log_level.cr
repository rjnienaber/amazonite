private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum SystemLogLevel
    Debug
    Info
    Warn

    def self.to_json(e : SystemLogLevel, json : JSON::Builder) : Nil
      value = case e
              when AL::SystemLogLevel::Debug then "DEBUG"
              when AL::SystemLogLevel::Info  then "INFO"
              when AL::SystemLogLevel::Warn  then "WARN"
              else
                raise Exception.new("unknown enum value for 'SystemLogLevel' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::SystemLogLevel
      value = pull.read_string
      case value
      when "DEBUG" then AL::SystemLogLevel::Debug
      when "INFO"  then AL::SystemLogLevel::Info
      when "WARN"  then AL::SystemLogLevel::Warn
      else
        raise Exception.new("unknown enum value for 'SystemLogLevel' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::SystemLogLevel::Debug then "DEBUG"
      when AL::SystemLogLevel::Info  then "INFO"
      when AL::SystemLogLevel::Warn  then "WARN"
      else
        raise Exception.new("unknown enum value for 'SystemLogLevel' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::SystemLogLevel?
      case key
      when "DEBUG" then AL::SystemLogLevel::Debug
      when "INFO"  then AL::SystemLogLevel::Info
      when "WARN"  then AL::SystemLogLevel::Warn
      else
        nil
      end
    end
  end
end
