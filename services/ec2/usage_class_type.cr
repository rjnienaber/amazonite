private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum UsageClassType
    Spot
    OnDemand
    CapacityBlock

    def self.to_json(e : UsageClassType, json : JSON::Builder) : Nil
      value = case e
              when AEC::UsageClassType::Spot          then "spot"
              when AEC::UsageClassType::OnDemand      then "on-demand"
              when AEC::UsageClassType::CapacityBlock then "capacity-block"
              else
                raise Exception.new("unknown enum value for 'UsageClassType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::UsageClassType
      value = pull.read_string
      case value
      when "spot"           then AEC::UsageClassType::Spot
      when "on-demand"      then AEC::UsageClassType::OnDemand
      when "capacity-block" then AEC::UsageClassType::CapacityBlock
      else
        raise Exception.new("unknown enum value for 'UsageClassType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::UsageClassType::Spot          then "spot"
      when AEC::UsageClassType::OnDemand      then "on-demand"
      when AEC::UsageClassType::CapacityBlock then "capacity-block"
      else
        raise Exception.new("unknown enum value for 'UsageClassType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::UsageClassType?
      case key
      when "spot"           then AEC::UsageClassType::Spot
      when "on-demand"      then AEC::UsageClassType::OnDemand
      when "capacity-block" then AEC::UsageClassType::CapacityBlock
      else
        nil
      end
    end
  end
end
