private alias AK = Amazonite::KinesisV1

module Amazonite::KinesisV1
  enum ShardFilterType
    AfterShardId
    AtTrimHorizon
    FromTrimHorizon
    AtLatest
    AtTimestamp
    FromTimestamp

    def self.to_json(e : ShardFilterType, json : JSON::Builder) : Nil
      value = case e
              when AK::ShardFilterType::AfterShardId    then "AFTER_SHARD_ID"
              when AK::ShardFilterType::AtTrimHorizon   then "AT_TRIM_HORIZON"
              when AK::ShardFilterType::FromTrimHorizon then "FROM_TRIM_HORIZON"
              when AK::ShardFilterType::AtLatest        then "AT_LATEST"
              when AK::ShardFilterType::AtTimestamp     then "AT_TIMESTAMP"
              when AK::ShardFilterType::FromTimestamp   then "FROM_TIMESTAMP"
              else
                raise Exception.new("unknown enum value for 'ShardFilterType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::ShardFilterType
      value = pull.read_string
      case value
      when "AFTER_SHARD_ID"    then AK::ShardFilterType::AfterShardId
      when "AT_TRIM_HORIZON"   then AK::ShardFilterType::AtTrimHorizon
      when "FROM_TRIM_HORIZON" then AK::ShardFilterType::FromTrimHorizon
      when "AT_LATEST"         then AK::ShardFilterType::AtLatest
      when "AT_TIMESTAMP"      then AK::ShardFilterType::AtTimestamp
      when "FROM_TIMESTAMP"    then AK::ShardFilterType::FromTimestamp
      else
        raise Exception.new("unknown enum value for 'ShardFilterType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::ShardFilterType::AfterShardId    then "AFTER_SHARD_ID"
      when AK::ShardFilterType::AtTrimHorizon   then "AT_TRIM_HORIZON"
      when AK::ShardFilterType::FromTrimHorizon then "FROM_TRIM_HORIZON"
      when AK::ShardFilterType::AtLatest        then "AT_LATEST"
      when AK::ShardFilterType::AtTimestamp     then "AT_TIMESTAMP"
      when AK::ShardFilterType::FromTimestamp   then "FROM_TIMESTAMP"
      else
        raise Exception.new("unknown enum value for 'ShardFilterType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::ShardFilterType?
      case key
      when "AFTER_SHARD_ID"    then AK::ShardFilterType::AfterShardId
      when "AT_TRIM_HORIZON"   then AK::ShardFilterType::AtTrimHorizon
      when "FROM_TRIM_HORIZON" then AK::ShardFilterType::FromTrimHorizon
      when "AT_LATEST"         then AK::ShardFilterType::AtLatest
      when "AT_TIMESTAMP"      then AK::ShardFilterType::AtTimestamp
      when "FROM_TIMESTAMP"    then AK::ShardFilterType::FromTimestamp
      else
        nil
      end
    end
  end
end
