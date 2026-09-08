private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateInstanceConnectEndpointRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the subnet in which to create the EC2 Instance Connect Endpoint.
    property subnet_id : String

    # One or more security groups to associate with the endpoint. If you don't specify a security
    # group, the default security group for your VPC will be associated with the endpoint.
    property security_group_ids : Array(String) | Nil

    # Indicates whether the client IP address is preserved as the source. The following are the
    # possible values.
    #
    # - `true` - Use the client IP address as the source.
    #
    # - `false` - Use the network interface IP address as the source.
    #
    # `PreserveClientIp` is only supported on IPv4 EC2 Instance Connect Endpoints. To use
    # `PreserveClientIp`, the value for `IpAddressType` must be `ipv4`.
    #
    # Default: `false`
    property preserve_client_ip : Bool | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
    property client_token : String | Nil

    # The tags to apply to the EC2 Instance Connect Endpoint during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    # The IP address type of the endpoint.
    #
    # If no value is specified, the default value is determined by the IP address type of the subnet:
    #
    # - `dualstack` - If the subnet has both IPv4 and IPv6 CIDRs
    #
    # - `ipv4` - If the subnet has only IPv4 CIDRs
    #
    # - `ipv6` - If the subnet has only IPv6 CIDRs
    #
    # `PreserveClientIp` is only supported on IPv4 EC2 Instance Connect Endpoints. To use
    # `PreserveClientIp`, the value for `IpAddressType` must be `ipv4`.
    property ip_address_type : IpAddressType | Nil

    def initialize(
      @subnet_id : String,
      @dry_run : Bool | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @preserve_client_ip : Bool | Nil = nil,
      @client_token : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @ip_address_type : IpAddressType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}SubnetId", @subnet_id}

      (@security_group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupId.#{i}", item}
      end

      if value = @preserve_client_ip
        params << {"#{prefix}PreserveClientIp", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @ip_address_type
        params << {"#{prefix}IpAddressType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetId']")).not_nil!,
        security_group_ids: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='SecurityGroupId']").map { |n| n.content },
        preserve_client_ip: Core::XMLValue.bool(node.xpath_node("*[local-name()='PreserveClientIp']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        ip_address_type: (n = node.xpath_node("*[local-name()='IpAddressType']")) ? AEC::IpAddressType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @security_group_ids
        raise Core::ValidationError.new("SecurityGroupIds must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("SecurityGroupIds must have at most 16 item(s)") if value.size > 16
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @subnet_id, @security_group_ids, @preserve_client_ip, @client_token, @tag_specifications, @ip_address_type)
  end
end
