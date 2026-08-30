private alias AK = Amazonite::KinesisV1

module Amazonite::KinesisV1
  enum ShardIteratorType
    AtSequenceNumber
    AfterSequenceNumber
    TrimHorizon
    Latest
    AtTimestamp

    def self.to_json(e : ShardIteratorType, json : JSON::Builder) : Nil
      value = case e
              when AK::ShardIteratorType::AtSequenceNumber    then "AT_SEQUENCE_NUMBER"
              when AK::ShardIteratorType::AfterSequenceNumber then "AFTER_SEQUENCE_NUMBER"
              when AK::ShardIteratorType::TrimHorizon         then "TRIM_HORIZON"
              when AK::ShardIteratorType::Latest              then "LATEST"
              when AK::ShardIteratorType::AtTimestamp         then "AT_TIMESTAMP"
              else
                raise Exception.new("unknown enum value for 'ShardIteratorType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::ShardIteratorType
      value = pull.read_string
      case value
      when "AT_SEQUENCE_NUMBER"    then AK::ShardIteratorType::AtSequenceNumber
      when "AFTER_SEQUENCE_NUMBER" then AK::ShardIteratorType::AfterSequenceNumber
      when "TRIM_HORIZON"          then AK::ShardIteratorType::TrimHorizon
      when "LATEST"                then AK::ShardIteratorType::Latest
      when "AT_TIMESTAMP"          then AK::ShardIteratorType::AtTimestamp
      else
        raise Exception.new("unknown enum value for 'ShardIteratorType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::ShardIteratorType::AtSequenceNumber    then "AT_SEQUENCE_NUMBER"
      when AK::ShardIteratorType::AfterSequenceNumber then "AFTER_SEQUENCE_NUMBER"
      when AK::ShardIteratorType::TrimHorizon         then "TRIM_HORIZON"
      when AK::ShardIteratorType::Latest              then "LATEST"
      when AK::ShardIteratorType::AtTimestamp         then "AT_TIMESTAMP"
      else
        raise Exception.new("unknown enum value for 'ShardIteratorType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::ShardIteratorType?
      case key
      when "AT_SEQUENCE_NUMBER"    then AK::ShardIteratorType::AtSequenceNumber
      when "AFTER_SEQUENCE_NUMBER" then AK::ShardIteratorType::AfterSequenceNumber
      when "TRIM_HORIZON"          then AK::ShardIteratorType::TrimHorizon
      when "LATEST"                then AK::ShardIteratorType::Latest
      when "AT_TIMESTAMP"          then AK::ShardIteratorType::AtTimestamp
      else
        nil
      end
    end
  end
end
