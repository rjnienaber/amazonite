private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AddressFamily
    Ipv4
    Ipv6

    def self.to_json(e : AddressFamily, json : JSON::Builder) : Nil
      value = case e
              when AEC::AddressFamily::Ipv4 then "ipv4"
              when AEC::AddressFamily::Ipv6 then "ipv6"
              else
                raise Exception.new("unknown enum value for 'AddressFamily' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AddressFamily
      value = pull.read_string
      case value
      when "ipv4" then AEC::AddressFamily::Ipv4
      when "ipv6" then AEC::AddressFamily::Ipv6
      else
        raise Exception.new("unknown enum value for 'AddressFamily' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AddressFamily::Ipv4 then "ipv4"
      when AEC::AddressFamily::Ipv6 then "ipv6"
      else
        raise Exception.new("unknown enum value for 'AddressFamily' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AddressFamily?
      case key
      when "ipv4" then AEC::AddressFamily::Ipv4
      when "ipv6" then AEC::AddressFamily::Ipv6
      else
        nil
      end
    end
  end
end
