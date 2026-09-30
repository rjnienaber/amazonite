private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum Ipv6AddressAttribute
    Public
    Private

    def self.to_json(e : Ipv6AddressAttribute, json : JSON::Builder) : Nil
      value = case e
              when AEC::Ipv6AddressAttribute::Public  then "public"
              when AEC::Ipv6AddressAttribute::Private then "private"
              else
                raise Exception.new("unknown enum value for 'Ipv6AddressAttribute' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::Ipv6AddressAttribute
      value = pull.read_string
      case value
      when "public"  then AEC::Ipv6AddressAttribute::Public
      when "private" then AEC::Ipv6AddressAttribute::Private
      else
        raise Exception.new("unknown enum value for 'Ipv6AddressAttribute' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::Ipv6AddressAttribute::Public  then "public"
      when AEC::Ipv6AddressAttribute::Private then "private"
      else
        raise Exception.new("unknown enum value for 'Ipv6AddressAttribute' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::Ipv6AddressAttribute?
      case key
      when "public"  then AEC::Ipv6AddressAttribute::Public
      when "private" then AEC::Ipv6AddressAttribute::Private
      else
        nil
      end
    end
  end
end
