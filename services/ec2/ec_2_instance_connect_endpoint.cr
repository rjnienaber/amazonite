private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an EC2 Instance Connect Endpoint.
  class Ec2InstanceConnectEndpoint
    # The ID of the Amazon Web Services account that created the EC2 Instance Connect Endpoint.
    property owner_id : String | Nil

    # The ID of the EC2 Instance Connect Endpoint.
    property instance_connect_endpoint_id : String | Nil

    # The Amazon Resource Name (ARN) of the EC2 Instance Connect Endpoint.
    property instance_connect_endpoint_arn : String | Nil

    # The current state of the EC2 Instance Connect Endpoint.
    property state : Ec2InstanceConnectEndpointState | Nil

    # The message for the current state of the EC2 Instance Connect Endpoint. Can include a failure
    # message.
    property state_message : String | Nil

    # The DNS name of the EC2 Instance Connect Endpoint.
    property dns_name : String | Nil

    # The Federal Information Processing Standards (FIPS) compliant DNS name of the EC2 Instance
    # Connect Endpoint.
    property fips_dns_name : String | Nil

    # The ID of the elastic network interface that Amazon EC2 automatically created when creating the
    # EC2 Instance Connect Endpoint.
    property network_interface_ids : Array(String) | Nil

    # The ID of the VPC in which the EC2 Instance Connect Endpoint was created.
    property vpc_id : String | Nil

    # The Availability Zone of the EC2 Instance Connect Endpoint.
    property availability_zone : String | Nil

    # The date and time that the EC2 Instance Connect Endpoint was created.
    property created_at : Time | Nil

    # The ID of the subnet in which the EC2 Instance Connect Endpoint was created.
    property subnet_id : String | Nil

    # Indicates whether your client's IP address is preserved as the source when you connect to a
    # resource. The following are the possible values.
    #
    # - `true` - Use the IP address of the client. Your instance must have an IPv4 address.
    #
    # - `false` - Use the IP address of the network interface.
    #
    # Default: `false`
    property preserve_client_ip : Bool | Nil

    # The security groups associated with the endpoint. If you didn't specify a security group, the
    # default security group for your VPC is associated with the endpoint.
    property security_group_ids : Array(String) | Nil

    # The tags assigned to the EC2 Instance Connect Endpoint.
    property tags : Array(Tag) | Nil

    # The IP address type of the endpoint.
    property ip_address_type : IpAddressType | Nil

    # The public DNS names of the endpoint.
    property public_dns_names : InstanceConnectEndpointPublicDnsNames | Nil

    # The ID of the Availability Zone of the EC2 Instance Connect Endpoint.
    property availability_zone_id : String | Nil

    def initialize(
      @owner_id : String | Nil = nil,
      @instance_connect_endpoint_id : String | Nil = nil,
      @instance_connect_endpoint_arn : String | Nil = nil,
      @state : Ec2InstanceConnectEndpointState | Nil = nil,
      @state_message : String | Nil = nil,
      @dns_name : String | Nil = nil,
      @fips_dns_name : String | Nil = nil,
      @network_interface_ids : Array(String) | Nil = nil,
      @vpc_id : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @created_at : Time | Nil = nil,
      @subnet_id : String | Nil = nil,
      @preserve_client_ip : Bool | Nil = nil,
      @security_group_ids : Array(String) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @ip_address_type : IpAddressType | Nil = nil,
      @public_dns_names : InstanceConnectEndpointPublicDnsNames | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @instance_connect_endpoint_id
        params << {"#{prefix}InstanceConnectEndpointId", value}
      end

      if value = @instance_connect_endpoint_arn
        params << {"#{prefix}InstanceConnectEndpointArn", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_message
        params << {"#{prefix}StateMessage", value}
      end

      if value = @dns_name
        params << {"#{prefix}DnsName", value}
      end

      if value = @fips_dns_name
        params << {"#{prefix}FipsDnsName", value}
      end

      (@network_interface_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkInterfaceIdSet.#{i}", item}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @created_at
        params << {"#{prefix}CreatedAt", Core::QueryValue.time(value)}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @preserve_client_ip
        params << {"#{prefix}PreserveClientIp", Core::QueryValue.bool(value)}
      end

      (@security_group_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupIdSet.#{i}", item}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @ip_address_type
        params << {"#{prefix}IpAddressType", value.to_json_object_key}
      end

      if value = @public_dns_names
        params.concat(value.to_query_params("#{prefix}PublicDnsNames."))
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        instance_connect_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceConnectEndpointId']")),
        instance_connect_endpoint_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceConnectEndpointArn']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::Ec2InstanceConnectEndpointState.from_json_object_key?(n.content) : nil,
        state_message: Core::XMLValue.string(node.xpath_node("*[local-name()='stateMessage']")),
        dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='dnsName']")),
        fips_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='fipsDnsName']")),
        network_interface_ids: node.xpath_nodes("*[local-name()='networkInterfaceIdSet']/*[local-name()='item']").map { |n| n.content },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        created_at: Core::XMLValue.time(node.xpath_node("*[local-name()='createdAt']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        preserve_client_ip: Core::XMLValue.bool(node.xpath_node("*[local-name()='preserveClientIp']")),
        security_group_ids: node.xpath_nodes("*[local-name()='securityGroupIdSet']/*[local-name()='item']").map { |n| n.content },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        ip_address_type: (n = node.xpath_node("*[local-name()='ipAddressType']")) ? AEC::IpAddressType.from_json_object_key?(n.content) : nil,
        public_dns_names: node.xpath_node("*[local-name()='publicDnsNames']").try { |n| InstanceConnectEndpointPublicDnsNames.from_xml(n) },
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
      )
    end

    def validate! : Nil
      if value = @instance_connect_endpoint_arn
        raise Core::ValidationError.new("InstanceConnectEndpointArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("InstanceConnectEndpointArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @public_dns_names
        value.validate!
      end
    end

    def_equals_and_hash(@owner_id, @instance_connect_endpoint_id, @instance_connect_endpoint_arn, @state, @state_message, @dns_name, @fips_dns_name, @network_interface_ids, @vpc_id, @availability_zone, @created_at, @subnet_id, @preserve_client_ip, @security_group_ids, @tags, @ip_address_type, @public_dns_names, @availability_zone_id)
  end
end
