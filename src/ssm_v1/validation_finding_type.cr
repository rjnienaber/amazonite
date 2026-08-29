private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ValidationFindingType
    Info
    Warn
    Error

    def self.to_json(e : ValidationFindingType, json : JSON::Builder) : Nil
      value = case e
              when AS::ValidationFindingType::Info  then "INFO"
              when AS::ValidationFindingType::Warn  then "WARN"
              when AS::ValidationFindingType::Error then "ERROR"
              else
                raise Exception.new("unknown enum value for 'ValidationFindingType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ValidationFindingType
      value = pull.read_string
      case value
      when "INFO"  then AS::ValidationFindingType::Info
      when "WARN"  then AS::ValidationFindingType::Warn
      when "ERROR" then AS::ValidationFindingType::Error
      else
        raise Exception.new("unknown enum value for 'ValidationFindingType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ValidationFindingType::Info  then "INFO"
      when AS::ValidationFindingType::Warn  then "WARN"
      when AS::ValidationFindingType::Error then "ERROR"
      else
        raise Exception.new("unknown enum value for 'ValidationFindingType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ValidationFindingType?
      case key
      when "INFO"  then AS::ValidationFindingType::Info
      when "WARN"  then AS::ValidationFindingType::Warn
      when "ERROR" then AS::ValidationFindingType::Error
      else
        nil
      end
    end
  end
end
