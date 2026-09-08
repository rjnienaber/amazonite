private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum StatisticType
    P50

    def self.to_json(e : StatisticType, json : JSON::Builder) : Nil
      value = case e
              when AEC::StatisticType::P50 then "p50"
              else
                raise Exception.new("unknown enum value for 'StatisticType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::StatisticType
      value = pull.read_string
      case value
      when "p50" then AEC::StatisticType::P50
      else
        raise Exception.new("unknown enum value for 'StatisticType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::StatisticType::P50 then "p50"
      else
        raise Exception.new("unknown enum value for 'StatisticType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::StatisticType?
      case key
      when "p50" then AEC::StatisticType::P50
      else
        nil
      end
    end
  end
end
