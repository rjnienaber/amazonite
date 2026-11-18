private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum QueueStartingPositionType
    TrimHorizon
    Latest
    AtTimestamp

    def self.to_json(e : QueueStartingPositionType, json : JSON::Builder) : Nil
      value = case e
              when AK::QueueStartingPositionType::TrimHorizon then "TRIM_HORIZON"
              when AK::QueueStartingPositionType::Latest      then "LATEST"
              when AK::QueueStartingPositionType::AtTimestamp then "AT_TIMESTAMP"
              else
                raise Exception.new("unknown enum value for 'QueueStartingPositionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::QueueStartingPositionType
      value = pull.read_string
      case value
      when "TRIM_HORIZON" then AK::QueueStartingPositionType::TrimHorizon
      when "LATEST"       then AK::QueueStartingPositionType::Latest
      when "AT_TIMESTAMP" then AK::QueueStartingPositionType::AtTimestamp
      else
        raise Exception.new("unknown enum value for 'QueueStartingPositionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::QueueStartingPositionType::TrimHorizon then "TRIM_HORIZON"
      when AK::QueueStartingPositionType::Latest      then "LATEST"
      when AK::QueueStartingPositionType::AtTimestamp then "AT_TIMESTAMP"
      else
        raise Exception.new("unknown enum value for 'QueueStartingPositionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::QueueStartingPositionType?
      case key
      when "TRIM_HORIZON" then AK::QueueStartingPositionType::TrimHorizon
      when "LATEST"       then AK::QueueStartingPositionType::Latest
      when "AT_TIMESTAMP" then AK::QueueStartingPositionType::AtTimestamp
      else
        nil
      end
    end
  end
end
