private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TargetCapacityUnitType
    Vcpu
    MemoryMib
    Units

    def self.to_json(e : TargetCapacityUnitType, json : JSON::Builder) : Nil
      value = case e
              when AEC::TargetCapacityUnitType::Vcpu      then "vcpu"
              when AEC::TargetCapacityUnitType::MemoryMib then "memory-mib"
              when AEC::TargetCapacityUnitType::Units     then "units"
              else
                raise Exception.new("unknown enum value for 'TargetCapacityUnitType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TargetCapacityUnitType
      value = pull.read_string
      case value
      when "vcpu"       then AEC::TargetCapacityUnitType::Vcpu
      when "memory-mib" then AEC::TargetCapacityUnitType::MemoryMib
      when "units"      then AEC::TargetCapacityUnitType::Units
      else
        raise Exception.new("unknown enum value for 'TargetCapacityUnitType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TargetCapacityUnitType::Vcpu      then "vcpu"
      when AEC::TargetCapacityUnitType::MemoryMib then "memory-mib"
      when AEC::TargetCapacityUnitType::Units     then "units"
      else
        raise Exception.new("unknown enum value for 'TargetCapacityUnitType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TargetCapacityUnitType?
      case key
      when "vcpu"       then AEC::TargetCapacityUnitType::Vcpu
      when "memory-mib" then AEC::TargetCapacityUnitType::MemoryMib
      when "units"      then AEC::TargetCapacityUnitType::Units
      else
        nil
      end
    end
  end
end
