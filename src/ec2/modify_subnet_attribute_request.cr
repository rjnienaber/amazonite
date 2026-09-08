private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifySubnetAttributeRequest
    # Specify `true` to indicate that network interfaces created in the specified subnet should be
    # assigned an IPv6 address. This includes a network interface that's created when launching an
    # instance into the subnet (the instance therefore receives an IPv6 address).
    #
    # If you enable the IPv6 addressing feature for your subnet, your network interface or instance
    # only receives an IPv6 address if it's created using version `2016-11-15` or later of the Amazon
    # EC2 API.
    property assign_ipv_6_address_on_creation : AttributeBooleanValue | Nil

    # Specify `true` to indicate that network interfaces attached to instances created in the
    # specified subnet should be assigned a public IPv4 address.
    #
    # Amazon Web Services charges for all public IPv4 addresses, including public IPv4 addresses
    # associated with running instances and Elastic IP addresses. For more information, see the
    # *Public IPv4 Address* tab on the [Amazon VPC pricing page](http://aws.amazon.com/vpc/pricing/).
    property map_public_ip_on_launch : AttributeBooleanValue | Nil

    # The ID of the subnet.
    property subnet_id : String

    # Specify `true` to indicate that network interfaces attached to instances created in the
    # specified subnet should be assigned a customer-owned IPv4 address.
    #
    # When this value is `true`, you must specify the customer-owned IP pool using
    # `CustomerOwnedIpv4Pool`.
    property map_customer_owned_ip_on_launch : AttributeBooleanValue | Nil

    # The customer-owned IPv4 address pool associated with the subnet.
    #
    # You must set this value when you specify `true` for `MapCustomerOwnedIpOnLaunch`.
    property customer_owned_ipv_4_pool : String | Nil

    # Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should
    # return synthetic IPv6 addresses for IPv4-only destinations.
    #
    # You must first configure a NAT gateway in a public subnet (separate from the subnet containing
    # the IPv6-only workloads). For example, the subnet containing the NAT gateway should have a
    # `0.0.0.0/0` route pointing to the internet gateway. For more information, see [Configure DNS64
    # and
    # NAT64](https://docs.aws.amazon.com/vpc/latest/userguide/nat-gateway-nat64-dns64.html#nat-gateway-nat64-dns64-walkthrough)
    # in the *Amazon VPC User Guide*.
    property enable_dns_64 : AttributeBooleanValue | Nil

    # The type of hostname to assign to instances in the subnet at launch. For IPv4-only and
    # dual-stack (IPv4 and IPv6) subnets, an instance DNS name can be based on the instance IPv4
    # address (ip-name) or the instance ID (resource-name). For IPv6 only subnets, an instance DNS
    # name must be based on the instance ID (resource-name).
    property private_dns_hostname_type_on_launch : HostnameType | Nil

    # Indicates whether to respond to DNS queries for instance hostnames with DNS A records.
    property enable_resource_name_dns_a_record_on_launch : AttributeBooleanValue | Nil

    # Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records.
    property enable_resource_name_dns_aaaa_record_on_launch : AttributeBooleanValue | Nil

    # Indicates the device position for local network interfaces in this subnet. For example, `1`
    # indicates local network interfaces in this subnet are the secondary network interface (eth1). A
    # local network interface cannot be the primary network interface (eth0).
    property enable_lni_at_device_index : Int32 | Nil

    # Specify `true` to indicate that local network interfaces at the current position should be
    # disabled.
    property disable_lni_at_device_index : AttributeBooleanValue | Nil

    def initialize(
      @subnet_id : String,
      @assign_ipv_6_address_on_creation : AttributeBooleanValue | Nil = nil,
      @map_public_ip_on_launch : AttributeBooleanValue | Nil = nil,
      @map_customer_owned_ip_on_launch : AttributeBooleanValue | Nil = nil,
      @customer_owned_ipv_4_pool : String | Nil = nil,
      @enable_dns_64 : AttributeBooleanValue | Nil = nil,
      @private_dns_hostname_type_on_launch : HostnameType | Nil = nil,
      @enable_resource_name_dns_a_record_on_launch : AttributeBooleanValue | Nil = nil,
      @enable_resource_name_dns_aaaa_record_on_launch : AttributeBooleanValue | Nil = nil,
      @enable_lni_at_device_index : Int32 | Nil = nil,
      @disable_lni_at_device_index : AttributeBooleanValue | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @assign_ipv_6_address_on_creation
        params.concat(value.to_query_params("#{prefix}AssignIpv6AddressOnCreation."))
      end

      if value = @map_public_ip_on_launch
        params.concat(value.to_query_params("#{prefix}MapPublicIpOnLaunch."))
      end

      params << {"#{prefix}SubnetId", @subnet_id}

      if value = @map_customer_owned_ip_on_launch
        params.concat(value.to_query_params("#{prefix}MapCustomerOwnedIpOnLaunch."))
      end

      if value = @customer_owned_ipv_4_pool
        params << {"#{prefix}CustomerOwnedIpv4Pool", value}
      end

      if value = @enable_dns_64
        params.concat(value.to_query_params("#{prefix}EnableDns64."))
      end

      if value = @private_dns_hostname_type_on_launch
        params << {"#{prefix}PrivateDnsHostnameTypeOnLaunch", value.to_json_object_key}
      end

      if value = @enable_resource_name_dns_a_record_on_launch
        params.concat(value.to_query_params("#{prefix}EnableResourceNameDnsARecordOnLaunch."))
      end

      if value = @enable_resource_name_dns_aaaa_record_on_launch
        params.concat(value.to_query_params("#{prefix}EnableResourceNameDnsAAAARecordOnLaunch."))
      end

      if value = @enable_lni_at_device_index
        params << {"#{prefix}EnableLniAtDeviceIndex", value.to_s}
      end

      if value = @disable_lni_at_device_index
        params.concat(value.to_query_params("#{prefix}DisableLniAtDeviceIndex."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        assign_ipv_6_address_on_creation: node.xpath_node("*[local-name()='AssignIpv6AddressOnCreation']").try { |n| AttributeBooleanValue.from_xml(n) },
        map_public_ip_on_launch: node.xpath_node("*[local-name()='MapPublicIpOnLaunch']").try { |n| AttributeBooleanValue.from_xml(n) },
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")).not_nil!,
        map_customer_owned_ip_on_launch: node.xpath_node("*[local-name()='MapCustomerOwnedIpOnLaunch']").try { |n| AttributeBooleanValue.from_xml(n) },
        customer_owned_ipv_4_pool: Core::XMLValue.string(node.xpath_node("*[local-name()='CustomerOwnedIpv4Pool']")),
        enable_dns_64: node.xpath_node("*[local-name()='EnableDns64']").try { |n| AttributeBooleanValue.from_xml(n) },
        private_dns_hostname_type_on_launch: (n = node.xpath_node("*[local-name()='PrivateDnsHostnameTypeOnLaunch']")) ? AEC::HostnameType.from_json_object_key?(n.content) : nil,
        enable_resource_name_dns_a_record_on_launch: node.xpath_node("*[local-name()='EnableResourceNameDnsARecordOnLaunch']").try { |n| AttributeBooleanValue.from_xml(n) },
        enable_resource_name_dns_aaaa_record_on_launch: node.xpath_node("*[local-name()='EnableResourceNameDnsAAAARecordOnLaunch']").try { |n| AttributeBooleanValue.from_xml(n) },
        enable_lni_at_device_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='EnableLniAtDeviceIndex']")),
        disable_lni_at_device_index: node.xpath_node("*[local-name()='DisableLniAtDeviceIndex']").try { |n| AttributeBooleanValue.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @assign_ipv_6_address_on_creation
        value.validate!
      end

      if value = @map_public_ip_on_launch
        value.validate!
      end

      if value = @map_customer_owned_ip_on_launch
        value.validate!
      end

      if value = @enable_dns_64
        value.validate!
      end

      if value = @enable_resource_name_dns_a_record_on_launch
        value.validate!
      end

      if value = @enable_resource_name_dns_aaaa_record_on_launch
        value.validate!
      end

      if value = @disable_lni_at_device_index
        value.validate!
      end
    end

    def_equals_and_hash(@assign_ipv_6_address_on_creation, @map_public_ip_on_launch, @subnet_id, @map_customer_owned_ip_on_launch, @customer_owned_ipv_4_pool, @enable_dns_64, @private_dns_hostname_type_on_launch, @enable_resource_name_dns_a_record_on_launch, @enable_resource_name_dns_aaaa_record_on_launch, @enable_lni_at_device_index, @disable_lni_at_device_index)
  end
end
