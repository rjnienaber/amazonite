private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for ModifyNetworkInterfaceAttribute.
  class ModifyNetworkInterfaceAttributeRequest
    # Updates the ENA Express configuration for the network interface that’s attached to the instance.
    property ena_srd_specification : EnaSrdSpecification | Nil

    # If you’re modifying a network interface in a dual-stack or IPv6-only subnet, you have the option
    # to assign a primary IPv6 IP address. A primary IPv6 address is an IPv6 GUA address associated
    # with an ENI that you have enabled to use a primary IPv6 address. Use this option if the instance
    # that this ENI will be attached to relies on its IPv6 address not changing. Amazon Web Services
    # will automatically assign an IPv6 address associated with the ENI attached to your instance to
    # be the primary IPv6 address. Once you enable an IPv6 GUA address to be a primary IPv6, you
    # cannot disable it. When you enable an IPv6 GUA address to be a primary IPv6, the first IPv6 GUA
    # will be made the primary IPv6 address until the instance is terminated or the network interface
    # is detached. If you have multiple IPv6 addresses associated with an ENI attached to your
    # instance and you enable a primary IPv6 address, the first IPv6 GUA address associated with the
    # ENI becomes the primary IPv6 address.
    property enable_primary_ipv_6 : Bool | Nil

    # A connection tracking specification.
    property connection_tracking_specification : ConnectionTrackingSpecificationRequest | Nil

    # Indicates whether to assign a public IPv4 address to a network interface. This option can be
    # enabled for any network interface but will only apply to the primary network interface (eth0).
    property associate_public_ip_address : Bool | Nil

    # A list of subnet IDs to associate with the network interface.
    property associated_subnet_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the network interface.
    property network_interface_id : String

    # A description for the network interface.
    property description : AttributeValue | Nil

    # Enable or disable source/destination checks, which ensure that the instance is either the source
    # or the destination of any traffic that it receives. If the value is `true`, source/destination
    # checks are enabled; otherwise, they are disabled. The default value is `true`. You must disable
    # source/destination checks if the instance runs services such as network address translation,
    # routing, or firewalls.
    property source_dest_check : AttributeBooleanValue | Nil

    # Changes the security groups for the network interface. The new set of groups you specify
    # replaces the current set. You must specify at least one group, even if it's just the default
    # security group in the VPC. You must specify the ID of the security group, not the name.
    property groups : Array(String) | Nil

    # Information about the interface attachment. If modifying the `delete on termination` attribute,
    # you must specify the ID of the interface attachment.
    property attachment : NetworkInterfaceAttachmentChanges | Nil

    def initialize(
      @network_interface_id : String,
      @ena_srd_specification : EnaSrdSpecification | Nil = nil,
      @enable_primary_ipv_6 : Bool | Nil = nil,
      @connection_tracking_specification : ConnectionTrackingSpecificationRequest | Nil = nil,
      @associate_public_ip_address : Bool | Nil = nil,
      @associated_subnet_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @description : AttributeValue | Nil = nil,
      @source_dest_check : AttributeBooleanValue | Nil = nil,
      @groups : Array(String) | Nil = nil,
      @attachment : NetworkInterfaceAttachmentChanges | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ena_srd_specification
        params.concat(value.to_query_params("#{prefix}EnaSrdSpecification."))
      end

      if value = @enable_primary_ipv_6
        params << {"#{prefix}EnablePrimaryIpv6", Core::QueryValue.bool(value)}
      end

      if value = @connection_tracking_specification
        params.concat(value.to_query_params("#{prefix}ConnectionTrackingSpecification."))
      end

      if value = @associate_public_ip_address
        params << {"#{prefix}AssociatePublicIpAddress", Core::QueryValue.bool(value)}
      end

      (@associated_subnet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AssociatedSubnetId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}NetworkInterfaceId", @network_interface_id}

      if value = @description
        params.concat(value.to_query_params("#{prefix}Description."))
      end

      if value = @source_dest_check
        params.concat(value.to_query_params("#{prefix}SourceDestCheck."))
      end

      (@groups || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupId.#{i}", item}
      end

      if value = @attachment
        params.concat(value.to_query_params("#{prefix}Attachment."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ena_srd_specification: node.xpath_node("*[local-name()='EnaSrdSpecification']").try { |n| EnaSrdSpecification.from_xml(n) },
        enable_primary_ipv_6: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnablePrimaryIpv6']")),
        connection_tracking_specification: node.xpath_node("*[local-name()='ConnectionTrackingSpecification']").try { |n| ConnectionTrackingSpecificationRequest.from_xml(n) },
        associate_public_ip_address: Core::XMLValue.bool(node.xpath_node("*[local-name()='AssociatePublicIpAddress']")),
        associated_subnet_ids: node.xpath_nodes("*[local-name()='AssociatedSubnetId']/*[local-name()='AssociatedSubnetId']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")).not_nil!,
        description: node.xpath_node("*[local-name()='description']").try { |n| AttributeValue.from_xml(n) },
        source_dest_check: node.xpath_node("*[local-name()='sourceDestCheck']").try { |n| AttributeBooleanValue.from_xml(n) },
        groups: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='SecurityGroupId']").map { |n| n.content },
        attachment: node.xpath_node("*[local-name()='attachment']").try { |n| NetworkInterfaceAttachmentChanges.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ena_srd_specification
        value.validate!
      end

      if value = @connection_tracking_specification
        value.validate!
      end

      if value = @description
        value.validate!
      end

      if value = @source_dest_check
        value.validate!
      end

      if value = @attachment
        value.validate!
      end
    end

    def_equals_and_hash(@ena_srd_specification, @enable_primary_ipv_6, @connection_tracking_specification, @associate_public_ip_address, @associated_subnet_ids, @dry_run, @network_interface_id, @description, @source_dest_check, @groups, @attachment)
  end
end
