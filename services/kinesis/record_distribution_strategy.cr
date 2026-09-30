private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum RecordDistributionStrategy
    Auto
    UserPartitionKey

    def self.to_json(e : RecordDistributionStrategy, json : JSON::Builder) : Nil
      value = case e
              when AK::RecordDistributionStrategy::Auto             then "AUTO"
              when AK::RecordDistributionStrategy::UserPartitionKey then "USER_PARTITION_KEY"
              else
                raise Exception.new("unknown enum value for 'RecordDistributionStrategy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::RecordDistributionStrategy
      value = pull.read_string
      case value
      when "AUTO"               then AK::RecordDistributionStrategy::Auto
      when "USER_PARTITION_KEY" then AK::RecordDistributionStrategy::UserPartitionKey
      else
        raise Exception.new("unknown enum value for 'RecordDistributionStrategy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::RecordDistributionStrategy::Auto             then "AUTO"
      when AK::RecordDistributionStrategy::UserPartitionKey then "USER_PARTITION_KEY"
      else
        raise Exception.new("unknown enum value for 'RecordDistributionStrategy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::RecordDistributionStrategy?
      case key
      when "AUTO"               then AK::RecordDistributionStrategy::Auto
      when "USER_PARTITION_KEY" then AK::RecordDistributionStrategy::UserPartitionKey
      else
        nil
      end
    end
  end
end
