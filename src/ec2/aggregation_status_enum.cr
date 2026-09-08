private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AggregationStatusEnum
    Included
    Excluded

    def self.to_json(e : AggregationStatusEnum, json : JSON::Builder) : Nil
      value = case e
              when AEC::AggregationStatusEnum::Included then "included"
              when AEC::AggregationStatusEnum::Excluded then "excluded"
              else
                raise Exception.new("unknown enum value for 'AggregationStatusEnum' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AggregationStatusEnum
      value = pull.read_string
      case value
      when "included" then AEC::AggregationStatusEnum::Included
      when "excluded" then AEC::AggregationStatusEnum::Excluded
      else
        raise Exception.new("unknown enum value for 'AggregationStatusEnum' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AggregationStatusEnum::Included then "included"
      when AEC::AggregationStatusEnum::Excluded then "excluded"
      else
        raise Exception.new("unknown enum value for 'AggregationStatusEnum' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AggregationStatusEnum?
      case key
      when "included" then AEC::AggregationStatusEnum::Included
      when "excluded" then AEC::AggregationStatusEnum::Excluded
      else
        nil
      end
    end
  end
end
