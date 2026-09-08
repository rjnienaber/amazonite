private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityTenancy
    Default
    Dedicated

    def self.to_json(e : CapacityTenancy, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityTenancy::Default   then "default"
              when AEC::CapacityTenancy::Dedicated then "dedicated"
              else
                raise Exception.new("unknown enum value for 'CapacityTenancy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityTenancy
      value = pull.read_string
      case value
      when "default"   then AEC::CapacityTenancy::Default
      when "dedicated" then AEC::CapacityTenancy::Dedicated
      else
        raise Exception.new("unknown enum value for 'CapacityTenancy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityTenancy::Default   then "default"
      when AEC::CapacityTenancy::Dedicated then "dedicated"
      else
        raise Exception.new("unknown enum value for 'CapacityTenancy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityTenancy?
      case key
      when "default"   then AEC::CapacityTenancy::Default
      when "dedicated" then AEC::CapacityTenancy::Dedicated
      else
        nil
      end
    end
  end
end
