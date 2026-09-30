private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceLifecycleType
    Spot
    Scheduled
    CapacityBlock
    InterruptibleCapacityReservation

    def self.to_json(e : InstanceLifecycleType, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceLifecycleType::Spot                             then "spot"
              when AEC::InstanceLifecycleType::Scheduled                        then "scheduled"
              when AEC::InstanceLifecycleType::CapacityBlock                    then "capacity-block"
              when AEC::InstanceLifecycleType::InterruptibleCapacityReservation then "interruptible-capacity-reservation"
              else
                raise Exception.new("unknown enum value for 'InstanceLifecycleType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceLifecycleType
      value = pull.read_string
      case value
      when "spot"                               then AEC::InstanceLifecycleType::Spot
      when "scheduled"                          then AEC::InstanceLifecycleType::Scheduled
      when "capacity-block"                     then AEC::InstanceLifecycleType::CapacityBlock
      when "interruptible-capacity-reservation" then AEC::InstanceLifecycleType::InterruptibleCapacityReservation
      else
        raise Exception.new("unknown enum value for 'InstanceLifecycleType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceLifecycleType::Spot                             then "spot"
      when AEC::InstanceLifecycleType::Scheduled                        then "scheduled"
      when AEC::InstanceLifecycleType::CapacityBlock                    then "capacity-block"
      when AEC::InstanceLifecycleType::InterruptibleCapacityReservation then "interruptible-capacity-reservation"
      else
        raise Exception.new("unknown enum value for 'InstanceLifecycleType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceLifecycleType?
      case key
      when "spot"                               then AEC::InstanceLifecycleType::Spot
      when "scheduled"                          then AEC::InstanceLifecycleType::Scheduled
      when "capacity-block"                     then AEC::InstanceLifecycleType::CapacityBlock
      when "interruptible-capacity-reservation" then AEC::InstanceLifecycleType::InterruptibleCapacityReservation
      else
        nil
      end
    end
  end
end
