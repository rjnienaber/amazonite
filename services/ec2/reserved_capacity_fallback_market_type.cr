private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ReservedCapacityFallbackMarketType
    OnDemand

    def self.to_json(e : ReservedCapacityFallbackMarketType, json : JSON::Builder) : Nil
      value = case e
              when AEC::ReservedCapacityFallbackMarketType::OnDemand then "on-demand"
              else
                raise Exception.new("unknown enum value for 'ReservedCapacityFallbackMarketType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ReservedCapacityFallbackMarketType
      value = pull.read_string
      case value
      when "on-demand" then AEC::ReservedCapacityFallbackMarketType::OnDemand
      else
        raise Exception.new("unknown enum value for 'ReservedCapacityFallbackMarketType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ReservedCapacityFallbackMarketType::OnDemand then "on-demand"
      else
        raise Exception.new("unknown enum value for 'ReservedCapacityFallbackMarketType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ReservedCapacityFallbackMarketType?
      case key
      when "on-demand" then AEC::ReservedCapacityFallbackMarketType::OnDemand
      else
        nil
      end
    end
  end
end
