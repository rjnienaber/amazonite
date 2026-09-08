private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityReservationTenancy
    Default
    Dedicated

    def self.to_json(e : CapacityReservationTenancy, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityReservationTenancy::Default   then "default"
              when AEC::CapacityReservationTenancy::Dedicated then "dedicated"
              else
                raise Exception.new("unknown enum value for 'CapacityReservationTenancy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityReservationTenancy
      value = pull.read_string
      case value
      when "default"   then AEC::CapacityReservationTenancy::Default
      when "dedicated" then AEC::CapacityReservationTenancy::Dedicated
      else
        raise Exception.new("unknown enum value for 'CapacityReservationTenancy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityReservationTenancy::Default   then "default"
      when AEC::CapacityReservationTenancy::Dedicated then "dedicated"
      else
        raise Exception.new("unknown enum value for 'CapacityReservationTenancy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityReservationTenancy?
      case key
      when "default"   then AEC::CapacityReservationTenancy::Default
      when "dedicated" then AEC::CapacityReservationTenancy::Dedicated
      else
        nil
      end
    end
  end
end
