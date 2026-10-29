private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SupportabilityMarketType
    OnDemand
    Spot

    def self.to_json(e : SupportabilityMarketType, json : JSON::Builder) : Nil
      value = case e
              when AEC::SupportabilityMarketType::OnDemand then "on-demand"
              when AEC::SupportabilityMarketType::Spot     then "spot"
              else
                raise Exception.new("unknown enum value for 'SupportabilityMarketType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SupportabilityMarketType
      value = pull.read_string
      case value
      when "on-demand" then AEC::SupportabilityMarketType::OnDemand
      when "spot"      then AEC::SupportabilityMarketType::Spot
      else
        raise Exception.new("unknown enum value for 'SupportabilityMarketType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SupportabilityMarketType::OnDemand then "on-demand"
      when AEC::SupportabilityMarketType::Spot     then "spot"
      else
        raise Exception.new("unknown enum value for 'SupportabilityMarketType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SupportabilityMarketType?
      case key
      when "on-demand" then AEC::SupportabilityMarketType::OnDemand
      when "spot"      then AEC::SupportabilityMarketType::Spot
      else
        nil
      end
    end
  end
end
