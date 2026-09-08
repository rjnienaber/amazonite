private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The advertisement type of a BYOIP route.
  enum IpamByoipAdvertisementType
    Regional
    Global

    def self.to_json(e : IpamByoipAdvertisementType, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamByoipAdvertisementType::Regional then "regional"
              when AEC::IpamByoipAdvertisementType::Global   then "global"
              else
                raise Exception.new("unknown enum value for 'IpamByoipAdvertisementType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamByoipAdvertisementType
      value = pull.read_string
      case value
      when "regional" then AEC::IpamByoipAdvertisementType::Regional
      when "global"   then AEC::IpamByoipAdvertisementType::Global
      else
        raise Exception.new("unknown enum value for 'IpamByoipAdvertisementType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamByoipAdvertisementType::Regional then "regional"
      when AEC::IpamByoipAdvertisementType::Global   then "global"
      else
        raise Exception.new("unknown enum value for 'IpamByoipAdvertisementType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamByoipAdvertisementType?
      case key
      when "regional" then AEC::IpamByoipAdvertisementType::Regional
      when "global"   then AEC::IpamByoipAdvertisementType::Global
      else
        nil
      end
    end
  end
end
