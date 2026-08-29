private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  enum PlacementStrategyType
    Random
    Spread
    Binpack

    def self.to_json(e : PlacementStrategyType, json : JSON::Builder) : Nil
      value = case e
              when AEB::PlacementStrategyType::Random  then "random"
              when AEB::PlacementStrategyType::Spread  then "spread"
              when AEB::PlacementStrategyType::Binpack then "binpack"
              else
                raise Exception.new("unknown enum value for 'PlacementStrategyType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::PlacementStrategyType
      value = pull.read_string
      case value
      when "random"  then AEB::PlacementStrategyType::Random
      when "spread"  then AEB::PlacementStrategyType::Spread
      when "binpack" then AEB::PlacementStrategyType::Binpack
      else
        raise Exception.new("unknown enum value for 'PlacementStrategyType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::PlacementStrategyType::Random  then "random"
      when AEB::PlacementStrategyType::Spread  then "spread"
      when AEB::PlacementStrategyType::Binpack then "binpack"
      else
        raise Exception.new("unknown enum value for 'PlacementStrategyType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::PlacementStrategyType?
      case key
      when "random"  then AEB::PlacementStrategyType::Random
      when "spread"  then AEB::PlacementStrategyType::Spread
      when "binpack" then AEB::PlacementStrategyType::Binpack
      else
        nil
      end
    end
  end
end
