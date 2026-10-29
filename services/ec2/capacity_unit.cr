private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityUnit
    Vcpus
    Instances

    def self.to_json(e : CapacityUnit, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityUnit::Vcpus     then "vcpus"
              when AEC::CapacityUnit::Instances then "instances"
              else
                raise Exception.new("unknown enum value for 'CapacityUnit' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityUnit
      value = pull.read_string
      case value
      when "vcpus"     then AEC::CapacityUnit::Vcpus
      when "instances" then AEC::CapacityUnit::Instances
      else
        raise Exception.new("unknown enum value for 'CapacityUnit' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityUnit::Vcpus     then "vcpus"
      when AEC::CapacityUnit::Instances then "instances"
      else
        raise Exception.new("unknown enum value for 'CapacityUnit' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityUnit?
      case key
      when "vcpus"     then AEC::CapacityUnit::Vcpus
      when "instances" then AEC::CapacityUnit::Instances
      else
        nil
      end
    end
  end
end
