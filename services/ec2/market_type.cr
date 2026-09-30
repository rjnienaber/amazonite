private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum MarketType
    Spot
    CapacityBlock
    InterruptibleCapacityReservation
    OnDemand

    def self.to_json(e : MarketType, json : JSON::Builder) : Nil
      value = case e
              when AEC::MarketType::Spot                             then "spot"
              when AEC::MarketType::CapacityBlock                    then "capacity-block"
              when AEC::MarketType::InterruptibleCapacityReservation then "interruptible-capacity-reservation"
              when AEC::MarketType::OnDemand                         then "on-demand"
              else
                raise Exception.new("unknown enum value for 'MarketType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::MarketType
      value = pull.read_string
      case value
      when "spot"                               then AEC::MarketType::Spot
      when "capacity-block"                     then AEC::MarketType::CapacityBlock
      when "interruptible-capacity-reservation" then AEC::MarketType::InterruptibleCapacityReservation
      when "on-demand"                          then AEC::MarketType::OnDemand
      else
        raise Exception.new("unknown enum value for 'MarketType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::MarketType::Spot                             then "spot"
      when AEC::MarketType::CapacityBlock                    then "capacity-block"
      when AEC::MarketType::InterruptibleCapacityReservation then "interruptible-capacity-reservation"
      when AEC::MarketType::OnDemand                         then "on-demand"
      else
        raise Exception.new("unknown enum value for 'MarketType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::MarketType?
      case key
      when "spot"                               then AEC::MarketType::Spot
      when "capacity-block"                     then AEC::MarketType::CapacityBlock
      when "interruptible-capacity-reservation" then AEC::MarketType::InterruptibleCapacityReservation
      when "on-demand"                          then AEC::MarketType::OnDemand
      else
        nil
      end
    end
  end
end
