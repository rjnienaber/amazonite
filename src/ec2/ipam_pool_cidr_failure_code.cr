private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPoolCidrFailureCode
    CidrNotAvailable
    LimitExceeded

    def self.to_json(e : IpamPoolCidrFailureCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPoolCidrFailureCode::CidrNotAvailable then "cidr-not-available"
              when AEC::IpamPoolCidrFailureCode::LimitExceeded    then "limit-exceeded"
              else
                raise Exception.new("unknown enum value for 'IpamPoolCidrFailureCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPoolCidrFailureCode
      value = pull.read_string
      case value
      when "cidr-not-available" then AEC::IpamPoolCidrFailureCode::CidrNotAvailable
      when "limit-exceeded"     then AEC::IpamPoolCidrFailureCode::LimitExceeded
      else
        raise Exception.new("unknown enum value for 'IpamPoolCidrFailureCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPoolCidrFailureCode::CidrNotAvailable then "cidr-not-available"
      when AEC::IpamPoolCidrFailureCode::LimitExceeded    then "limit-exceeded"
      else
        raise Exception.new("unknown enum value for 'IpamPoolCidrFailureCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPoolCidrFailureCode?
      case key
      when "cidr-not-available" then AEC::IpamPoolCidrFailureCode::CidrNotAvailable
      when "limit-exceeded"     then AEC::IpamPoolCidrFailureCode::LimitExceeded
      else
        nil
      end
    end
  end
end
