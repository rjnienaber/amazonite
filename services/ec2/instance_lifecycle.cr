private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceLifecycle
    Spot
    OnDemand
    InterruptibleCapacityReservation
    CapacityBlock

    def self.to_json(e : InstanceLifecycle, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceLifecycle::Spot                             then "spot"
              when AEC::InstanceLifecycle::OnDemand                         then "on-demand"
              when AEC::InstanceLifecycle::InterruptibleCapacityReservation then "interruptible-capacity-reservation"
              when AEC::InstanceLifecycle::CapacityBlock                    then "capacity-block"
              else
                raise Exception.new("unknown enum value for 'InstanceLifecycle' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceLifecycle
      value = pull.read_string
      case value
      when "spot"                               then AEC::InstanceLifecycle::Spot
      when "on-demand"                          then AEC::InstanceLifecycle::OnDemand
      when "interruptible-capacity-reservation" then AEC::InstanceLifecycle::InterruptibleCapacityReservation
      when "capacity-block"                     then AEC::InstanceLifecycle::CapacityBlock
      else
        raise Exception.new("unknown enum value for 'InstanceLifecycle' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceLifecycle::Spot                             then "spot"
      when AEC::InstanceLifecycle::OnDemand                         then "on-demand"
      when AEC::InstanceLifecycle::InterruptibleCapacityReservation then "interruptible-capacity-reservation"
      when AEC::InstanceLifecycle::CapacityBlock                    then "capacity-block"
      else
        raise Exception.new("unknown enum value for 'InstanceLifecycle' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceLifecycle?
      case key
      when "spot"                               then AEC::InstanceLifecycle::Spot
      when "on-demand"                          then AEC::InstanceLifecycle::OnDemand
      when "interruptible-capacity-reservation" then AEC::InstanceLifecycle::InterruptibleCapacityReservation
      when "capacity-block"                     then AEC::InstanceLifecycle::CapacityBlock
      else
        nil
      end
    end
  end
end
