private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyPrivateDnsNameOptionsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the instance.
    property instance_id : String

    # The type of hostname for EC2 instances. For IPv4 only subnets, an instance DNS name must be
    # based on the instance IPv4 address. For IPv6 only subnets, an instance DNS name must be based on
    # the instance ID. For dual-stack subnets, you can specify whether DNS names use the instance IPv4
    # address or the instance ID.
    property private_dns_hostname_type : HostnameType | Nil

    # Indicates whether to respond to DNS queries for instance hostnames with DNS A records.
    property enable_resource_name_dns_a_record : Bool | Nil

    # Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records.
    property enable_resource_name_dns_aaaa_record : Bool | Nil

    def initialize(
      @instance_id : String,
      @dry_run : Bool | Nil = nil,
      @private_dns_hostname_type : HostnameType | Nil = nil,
      @enable_resource_name_dns_a_record : Bool | Nil = nil,
      @enable_resource_name_dns_aaaa_record : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}InstanceId", @instance_id}

      if value = @private_dns_hostname_type
        params << {"#{prefix}PrivateDnsHostnameType", value.to_json_object_key}
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
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        private_dns_hostname_type: (n = node.xpath_node("*[local-name()='PrivateDnsHostnameType']")) ? AEC::HostnameType.from_json_object_key?(n.content) : nil,
        enable_resource_name_dns_a_record: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnableResourceNameDnsARecord']")),
        enable_resource_name_dns_aaaa_record: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnableResourceNameDnsAAAARecord']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @instance_id, @private_dns_hostname_type, @enable_resource_name_dns_a_record, @enable_resource_name_dns_aaaa_record)
  end
end
