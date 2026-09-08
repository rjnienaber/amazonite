private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FleetReservationType
    OnDemandCapacityReservation
    CapacityBlock
    InterruptibleCapacityReservation

    def self.to_json(e : FleetReservationType, json : JSON::Builder) : Nil
      value = case e
              when AEC::FleetReservationType::OnDemandCapacityReservation      then "on-demand-capacity-reservation"
              when AEC::FleetReservationType::CapacityBlock                    then "capacity-block"
              when AEC::FleetReservationType::InterruptibleCapacityReservation then "interruptible-capacity-reservation"
              else
                raise Exception.new("unknown enum value for 'FleetReservationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FleetReservationType
      value = pull.read_string
      case value
      when "on-demand-capacity-reservation"     then AEC::FleetReservationType::OnDemandCapacityReservation
      when "capacity-block"                     then AEC::FleetReservationType::CapacityBlock
      when "interruptible-capacity-reservation" then AEC::FleetReservationType::InterruptibleCapacityReservation
      else
        raise Exception.new("unknown enum value for 'FleetReservationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FleetReservationType::OnDemandCapacityReservation      then "on-demand-capacity-reservation"
      when AEC::FleetReservationType::CapacityBlock                    then "capacity-block"
      when AEC::FleetReservationType::InterruptibleCapacityReservation then "interruptible-capacity-reservation"
      else
        raise Exception.new("unknown enum value for 'FleetReservationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FleetReservationType?
      case key
      when "on-demand-capacity-reservation"     then AEC::FleetReservationType::OnDemandCapacityReservation
      when "capacity-block"                     then AEC::FleetReservationType::CapacityBlock
      when "interruptible-capacity-reservation" then AEC::FleetReservationType::InterruptibleCapacityReservation
      else
        nil
      end
    end
  end
end
