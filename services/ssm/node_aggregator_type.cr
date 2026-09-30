private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum NodeAggregatorType
    Count

    def self.to_json(e : NodeAggregatorType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::NodeAggregatorType
      value = pull.read_string
      case value
      when "Count" then AS::NodeAggregatorType::Count
      else
        raise Exception.new("unknown enum value for 'NodeAggregatorType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::NodeAggregatorType?
      case key
      when "Count" then AS::NodeAggregatorType::Count
      else
        nil
      end
    end
  end
end
