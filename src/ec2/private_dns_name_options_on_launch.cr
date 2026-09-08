private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the options for instance hostnames.
  class PrivateDnsNameOptionsOnLaunch
    # The type of hostname for EC2 instances. For IPv4 only subnets, an instance DNS name must be
    # based on the instance IPv4 address. For IPv6 only subnets, an instance DNS name must be based on
    # the instance ID. For dual-stack subnets, you can specify whether DNS names use the instance IPv4
    # address or the instance ID.
    property hostname_type : HostnameType | Nil

    # Indicates whether to respond to DNS queries for instance hostnames with DNS A records.
    property enable_resource_name_dns_a_record : Bool | Nil

    # Indicates whether to respond to DNS queries for instance hostname with DNS AAAA records.
    property enable_resource_name_dns_aaaa_record : Bool | Nil

    def initialize(
      @hostname_type : HostnameType | Nil = nil,
      @enable_resource_name_dns_a_record : Bool | Nil = nil,
      @enable_resource_name_dns_aaaa_record : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @hostname_type
        params << {"#{prefix}HostnameType", value.to_json_object_key}
      end

      if value = @enable_resource_name_dns_a_record
        params << {"#{prefix}EnableResourceNameDnsARecord", Core::QueryValue.bool(value)}
      end

      if value = @enable_resource_name_dns_aaaa_record
        params << {"#{prefix}EnableResourceNameDnsAAAARecord", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        hostname_type: (n = node.xpath_node("*[local-name()='hostnameType']")) ? AEC::HostnameType.from_json_object_key?(n.content) : nil,
        enable_resource_name_dns_a_record: Core::XMLValue.bool(node.xpath_node("*[local-name()='enableResourceNameDnsARecord']")),
        enable_resource_name_dns_aaaa_record: Core::XMLValue.bool(node.xpath_node("*[local-name()='enableResourceNameDnsAAAARecord']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@hostname_type, @enable_resource_name_dns_a_record, @enable_resource_name_dns_aaaa_record)
  end
end
