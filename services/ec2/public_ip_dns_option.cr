private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PublicIpDnsOption
    PublicDualStackDnsName
    PublicIpv4DnsName
    PublicIpv6DnsName

    def self.to_json(e : PublicIpDnsOption, json : JSON::Builder) : Nil
      value = case e
              when AEC::PublicIpDnsOption::PublicDualStackDnsName then "public-dual-stack-dns-name"
              when AEC::PublicIpDnsOption::PublicIpv4DnsName      then "public-ipv4-dns-name"
              when AEC::PublicIpDnsOption::PublicIpv6DnsName      then "public-ipv6-dns-name"
              else
                raise Exception.new("unknown enum value for 'PublicIpDnsOption' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PublicIpDnsOption
      value = pull.read_string
      case value
      when "public-dual-stack-dns-name" then AEC::PublicIpDnsOption::PublicDualStackDnsName
      when "public-ipv4-dns-name"       then AEC::PublicIpDnsOption::PublicIpv4DnsName
      when "public-ipv6-dns-name"       then AEC::PublicIpDnsOption::PublicIpv6DnsName
      else
        raise Exception.new("unknown enum value for 'PublicIpDnsOption' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::PublicIpDnsOption::PublicDualStackDnsName then "public-dual-stack-dns-name"
      when AEC::PublicIpDnsOption::PublicIpv4DnsName      then "public-ipv4-dns-name"
      when AEC::PublicIpDnsOption::PublicIpv6DnsName      then "public-ipv6-dns-name"
      else
        raise Exception.new("unknown enum value for 'PublicIpDnsOption' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::PublicIpDnsOption?
      case key
      when "public-dual-stack-dns-name" then AEC::PublicIpDnsOption::PublicDualStackDnsName
      when "public-ipv4-dns-name"       then AEC::PublicIpDnsOption::PublicIpv4DnsName
      when "public-ipv6-dns-name"       then AEC::PublicIpDnsOption::PublicIpv6DnsName
      else
        nil
      end
    end
  end
end
