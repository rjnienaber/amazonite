private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DefaultTargetCapacityType
    Spot
    OnDemand
    CapacityBlock
    ReservedCapacity

    def self.to_json(e : DefaultTargetCapacityType, json : JSON::Builder) : Nil
      value = case e
              when AEC::DefaultTargetCapacityType::Spot             then "spot"
              when AEC::DefaultTargetCapacityType::OnDemand         then "on-demand"
              when AEC::DefaultTargetCapacityType::CapacityBlock    then "capacity-block"
              when AEC::DefaultTargetCapacityType::ReservedCapacity then "reserved-capacity"
              else
                raise Exception.new("unknown enum value for 'DefaultTargetCapacityType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DefaultTargetCapacityType
      value = pull.read_string
      case value
      when "spot"              then AEC::DefaultTargetCapacityType::Spot
      when "on-demand"         then AEC::DefaultTargetCapacityType::OnDemand
      when "capacity-block"    then AEC::DefaultTargetCapacityType::CapacityBlock
      when "reserved-capacity" then AEC::DefaultTargetCapacityType::ReservedCapacity
      else
        raise Exception.new("unknown enum value for 'DefaultTargetCapacityType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DefaultTargetCapacityType::Spot             then "spot"
      when AEC::DefaultTargetCapacityType::OnDemand         then "on-demand"
      when AEC::DefaultTargetCapacityType::CapacityBlock    then "capacity-block"
      when AEC::DefaultTargetCapacityType::ReservedCapacity then "reserved-capacity"
      else
        raise Exception.new("unknown enum value for 'DefaultTargetCapacityType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DefaultTargetCapacityType?
      case key
      when "spot"              then AEC::DefaultTargetCapacityType::Spot
      when "on-demand"         then AEC::DefaultTargetCapacityType::OnDemand
      when "capacity-block"    then AEC::DefaultTargetCapacityType::CapacityBlock
      when "reserved-capacity" then AEC::DefaultTargetCapacityType::ReservedCapacity
      else
        nil
      end
    end
  end
end
