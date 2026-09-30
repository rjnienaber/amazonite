private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SubnetCidrReservationType
    Prefix
    Explicit

    def self.to_json(e : SubnetCidrReservationType, json : JSON::Builder) : Nil
      value = case e
              when AEC::SubnetCidrReservationType::Prefix   then "prefix"
              when AEC::SubnetCidrReservationType::Explicit then "explicit"
              else
                raise Exception.new("unknown enum value for 'SubnetCidrReservationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SubnetCidrReservationType
      value = pull.read_string
      case value
      when "prefix"   then AEC::SubnetCidrReservationType::Prefix
      when "explicit" then AEC::SubnetCidrReservationType::Explicit
      else
        raise Exception.new("unknown enum value for 'SubnetCidrReservationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SubnetCidrReservationType::Prefix   then "prefix"
      when AEC::SubnetCidrReservationType::Explicit then "explicit"
      else
        raise Exception.new("unknown enum value for 'SubnetCidrReservationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SubnetCidrReservationType?
      case key
      when "prefix"   then AEC::SubnetCidrReservationType::Prefix
      when "explicit" then AEC::SubnetCidrReservationType::Explicit
      else
        nil
      end
    end
  end
end
