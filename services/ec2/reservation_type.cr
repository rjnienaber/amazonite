private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ReservationType
    CapacityBlock
    Odcr

    def self.to_json(e : ReservationType, json : JSON::Builder) : Nil
      value = case e
              when AEC::ReservationType::CapacityBlock then "capacity-block"
              when AEC::ReservationType::Odcr          then "odcr"
              else
                raise Exception.new("unknown enum value for 'ReservationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ReservationType
      value = pull.read_string
      case value
      when "capacity-block" then AEC::ReservationType::CapacityBlock
      when "odcr"           then AEC::ReservationType::Odcr
      else
        raise Exception.new("unknown enum value for 'ReservationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ReservationType::CapacityBlock then "capacity-block"
      when AEC::ReservationType::Odcr          then "odcr"
      else
        raise Exception.new("unknown enum value for 'ReservationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ReservationType?
      case key
      when "capacity-block" then AEC::ReservationType::CapacityBlock
      when "odcr"           then AEC::ReservationType::Odcr
      else
        nil
      end
    end
  end
end
