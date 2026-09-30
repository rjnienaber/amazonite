private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DnsRecordIpType
    Ipv4
    Dualstack
    Ipv6
    ServiceDefined

    def self.to_json(e : DnsRecordIpType, json : JSON::Builder) : Nil
      value = case e
              when AEC::DnsRecordIpType::Ipv4           then "ipv4"
              when AEC::DnsRecordIpType::Dualstack      then "dualstack"
              when AEC::DnsRecordIpType::Ipv6           then "ipv6"
              when AEC::DnsRecordIpType::ServiceDefined then "service-defined"
              else
                raise Exception.new("unknown enum value for 'DnsRecordIpType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DnsRecordIpType
      value = pull.read_string
      case value
      when "ipv4"            then AEC::DnsRecordIpType::Ipv4
      when "dualstack"       then AEC::DnsRecordIpType::Dualstack
      when "ipv6"            then AEC::DnsRecordIpType::Ipv6
      when "service-defined" then AEC::DnsRecordIpType::ServiceDefined
      else
        raise Exception.new("unknown enum value for 'DnsRecordIpType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DnsRecordIpType::Ipv4           then "ipv4"
      when AEC::DnsRecordIpType::Dualstack      then "dualstack"
      when AEC::DnsRecordIpType::Ipv6           then "ipv6"
      when AEC::DnsRecordIpType::ServiceDefined then "service-defined"
      else
        raise Exception.new("unknown enum value for 'DnsRecordIpType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DnsRecordIpType?
      case key
      when "ipv4"            then AEC::DnsRecordIpType::Ipv4
      when "dualstack"       then AEC::DnsRecordIpType::Dualstack
      when "ipv6"            then AEC::DnsRecordIpType::Ipv6
      when "service-defined" then AEC::DnsRecordIpType::ServiceDefined
      else
        nil
      end
    end
  end
end
