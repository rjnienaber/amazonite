private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum StatusType
    Passed
    Failed
    InsufficientData
    Initializing

    def self.to_json(e : StatusType, json : JSON::Builder) : Nil
      value = case e
              when AEC::StatusType::Passed           then "passed"
              when AEC::StatusType::Failed           then "failed"
              when AEC::StatusType::InsufficientData then "insufficient-data"
              when AEC::StatusType::Initializing     then "initializing"
              else
                raise Exception.new("unknown enum value for 'StatusType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::StatusType
      value = pull.read_string
      case value
      when "passed"            then AEC::StatusType::Passed
      when "failed"            then AEC::StatusType::Failed
      when "insufficient-data" then AEC::StatusType::InsufficientData
      when "initializing"      then AEC::StatusType::Initializing
      else
        raise Exception.new("unknown enum value for 'StatusType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::StatusType::Passed           then "passed"
      when AEC::StatusType::Failed           then "failed"
      when AEC::StatusType::InsufficientData then "insufficient-data"
      when AEC::StatusType::Initializing     then "initializing"
      else
        raise Exception.new("unknown enum value for 'StatusType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::StatusType?
      case key
      when "passed"            then AEC::StatusType::Passed
      when "failed"            then AEC::StatusType::Failed
      when "insufficient-data" then AEC::StatusType::InsufficientData
      when "initializing"      then AEC::StatusType::Initializing
      else
        nil
      end
    end
  end
end
