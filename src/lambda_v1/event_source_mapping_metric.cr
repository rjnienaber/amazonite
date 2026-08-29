private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum EventSourceMappingMetric
    EventCount
    ErrorCount
    KafkaMetrics

    def self.to_json(e : EventSourceMappingMetric, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::EventSourceMappingMetric
      value = pull.read_string
      case value
      when "EventCount"   then AL::EventSourceMappingMetric::EventCount
      when "ErrorCount"   then AL::EventSourceMappingMetric::ErrorCount
      when "KafkaMetrics" then AL::EventSourceMappingMetric::KafkaMetrics
      else
        raise Exception.new("unknown enum value for 'EventSourceMappingMetric' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::EventSourceMappingMetric?
      case key
      when "EventCount"   then AL::EventSourceMappingMetric::EventCount
      when "ErrorCount"   then AL::EventSourceMappingMetric::ErrorCount
      when "KafkaMetrics" then AL::EventSourceMappingMetric::KafkaMetrics
      else
        nil
      end
    end
  end
end
