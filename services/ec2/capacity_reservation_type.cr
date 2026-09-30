private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityReservationType
    Default
    CapacityBlock

    def self.to_json(e : CapacityReservationType, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityReservationType::Default       then "default"
              when AEC::CapacityReservationType::CapacityBlock then "capacity-block"
              else
                raise Exception.new("unknown enum value for 'CapacityReservationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityReservationType
      value = pull.read_string
      case value
      when "default"        then AEC::CapacityReservationType::Default
      when "capacity-block" then AEC::CapacityReservationType::CapacityBlock
      else
        raise Exception.new("unknown enum value for 'CapacityReservationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityReservationType::Default       then "default"
      when AEC::CapacityReservationType::CapacityBlock then "capacity-block"
      else
        raise Exception.new("unknown enum value for 'CapacityReservationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityReservationType?
      case key
      when "default"        then AEC::CapacityReservationType::Default
      when "capacity-block" then AEC::CapacityReservationType::CapacityBlock
      else
        nil
      end
    end
  end
end
