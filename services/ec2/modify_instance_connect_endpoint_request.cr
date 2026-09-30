private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceConnectEndpointRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the EC2 Instance Connect Endpoint to modify.
    property instance_connect_endpoint_id : String

    # The new IP address type for the EC2 Instance Connect Endpoint.
    #
    # `PreserveClientIp` is only supported on IPv4 EC2 Instance Connect Endpoints. To use
    # `PreserveClientIp`, the value for `IpAddressType` must be `ipv4`.
    property ip_address_type : IpAddressType | Nil

    # Changes the security groups for the EC2 Instance Connect Endpoint. The new set of groups you
    # specify replaces the current set. You must specify at least one group, even if it's just the
    # default security group in the VPC. You must specify the ID of the security group, not the name.
    property security_group_ids : Array(String) | Nil

    # Indicates whether the client IP address is preserved as the source when you connect to a
    # resource. The following are the possible values.
    #
    # - `true` - Use the IP address of the client. Your instance must have an IPv4 address.
    #
    # - `false` - Use the IP address of the network interface.
    property preserve_client_ip : Bool | Nil

    def initialize(
      @instance_connect_endpoint_id : String,
      @dry_run : Bool | Nil = nil,
      @ip_address_type : IpAddressType | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @preserve_client_ip : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}InstanceConnectEndpointId", @instance_connect_endpoint_id}

      if value = @ip_address_type
        params << {"#{prefix}IpAddressType", value.to_json_object_key}
      end

      (@security_group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupId.#{i}", item}
      end

      if value = @preserve_client_ip
        params << {"#{prefix}PreserveClientIp", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        instance_connect_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceConnectEndpointId']")).not_nil!,
        ip_address_type: (n = node.xpath_node("*[local-name()='IpAddressType']")) ? AEC::IpAddressType.from_json_object_key?(n.content) : nil,
        security_group_ids: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='SecurityGroupId']").map { |n| n.content },
        preserve_client_ip: Core::XMLValue.bool(node.xpath_node("*[local-name()='PreserveClientIp']")),
      )
    end

    def validate! : Nil
      if value = @security_group_ids
        raise Core::ValidationError.new("SecurityGroupIds must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("SecurityGroupIds must have at most 16 item(s)") if value.size > 16
      end
    end

    def_equals_and_hash(@dry_run, @instance_connect_endpoint_id, @ip_address_type, @security_group_ids, @preserve_client_ip)
  end
end
