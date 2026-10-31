private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum KafkaEventSourceMappingConsumptionMode
    Stream
    Queue

    def self.to_json(e : KafkaEventSourceMappingConsumptionMode, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::KafkaEventSourceMappingConsumptionMode
      value = pull.read_string
      case value
      when "Stream" then AL::KafkaEventSourceMappingConsumptionMode::Stream
      when "Queue"  then AL::KafkaEventSourceMappingConsumptionMode::Queue
      else
        raise Exception.new("unknown enum value for 'KafkaEventSourceMappingConsumptionMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::KafkaEventSourceMappingConsumptionMode?
      case key
      when "Stream" then AL::KafkaEventSourceMappingConsumptionMode::Stream
      when "Queue"  then AL::KafkaEventSourceMappingConsumptionMode::Queue
      else
        nil
      end
    end
  end
end
