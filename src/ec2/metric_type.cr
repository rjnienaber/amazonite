private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum MetricType
    AggregateLatency

    def self.to_json(e : MetricType, json : JSON::Builder) : Nil
      value = case e
              when AEC::MetricType::AggregateLatency then "aggregate-latency"
              else
                raise Exception.new("unknown enum value for 'MetricType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::MetricType
      value = pull.read_string
      case value
      when "aggregate-latency" then AEC::MetricType::AggregateLatency
      else
        raise Exception.new("unknown enum value for 'MetricType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::MetricType::AggregateLatency then "aggregate-latency"
      else
        raise Exception.new("unknown enum value for 'MetricType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::MetricType?
      case key
      when "aggregate-latency" then AEC::MetricType::AggregateLatency
      else
        nil
      end
    end
  end
end
