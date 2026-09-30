private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a VPC.
  class Vpc
    # The ID of the Amazon Web Services account that owns the VPC.
    property owner_id : String | Nil

    # The allowed tenancy of instances launched into the VPC.
    property instance_tenancy : Tenancy | Nil

    # Information about the IPv6 CIDR blocks associated with the VPC.
    property ipv_6_cidr_block_association_set : Array(VpcIpv6CidrBlockAssociation) | Nil

    # Information about the IPv4 CIDR blocks associated with the VPC.
    property cidr_block_association_set : Array(VpcCidrBlockAssociation) | Nil

    # Indicates whether the VPC is the default VPC.
    property is_default : Bool | Nil

    property encryption_control : VpcEncryptionControl | Nil

    # Any tags assigned to the VPC.
    property tags : Array(Tag) | Nil

    # The state of VPC Block Public Access (BPA).
    property block_public_access_states : BlockPublicAccessStates | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    # The current state of the VPC.
    property state : VpcState | Nil

    # The primary IPv4 CIDR block for the VPC.
    property cidr_block : String | Nil

    # The ID of the set of DHCP options you've associated with the VPC.
    property dhcp_options_id : String | Nil

    def initialize(
      @owner_id : String | Nil = nil,
      @instance_tenancy : Tenancy | Nil = nil,
      @ipv_6_cidr_block_association_set : Array(VpcIpv6CidrBlockAssociation) | Nil = nil,
      @cidr_block_association_set : Array(VpcCidrBlockAssociation) | Nil = nil,
      @is_default : Bool | Nil = nil,
      @encryption_control : VpcEncryptionControl | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @block_public_access_states : BlockPublicAccessStates | Nil = nil,
      @vpc_id : String | Nil = nil,
      @state : VpcState | Nil = nil,
      @cidr_block : String | Nil = nil,
      @dhcp_options_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @instance_tenancy
        params << {"#{prefix}InstanceTenancy", value.to_json_object_key}
      end

      (@ipv_6_cidr_block_association_set || [] of VpcIpv6CidrBlockAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6CidrBlockAssociationSet.#{i}."))
      end

      (@cidr_block_association_set || [] of VpcCidrBlockAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CidrBlockAssociationSet.#{i}."))
      end

      if value = @is_default
        params << {"#{prefix}IsDefault", Core::QueryValue.bool(value)}
      end

      if value = @encryption_control
        params.concat(value.to_query_params("#{prefix}EncryptionControl."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @block_public_access_states
        params.concat(value.to_query_params("#{prefix}BlockPublicAccessStates."))
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @cidr_block
        params << {"#{prefix}CidrBlock", value}
      end

      if value = @dhcp_options_id
        params << {"#{prefix}DhcpOptionsId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        instance_tenancy: (n = node.xpath_node("*[local-name()='instanceTenancy']")) ? AEC::Tenancy.from_json_object_key?(n.content) : nil,
        ipv_6_cidr_block_association_set: node.xpath_nodes("*[local-name()='ipv6CidrBlockAssociationSet']/*[local-name()='item']").map { |n| VpcIpv6CidrBlockAssociation.from_xml(n) },
        cidr_block_association_set: node.xpath_nodes("*[local-name()='cidrBlockAssociationSet']/*[local-name()='item']").map { |n| VpcCidrBlockAssociation.from_xml(n) },
        is_default: Core::XMLValue.bool(node.xpath_node("*[local-name()='isDefault']")),
        encryption_control: node.xpath_node("*[local-name()='encryptionControl']").try { |n| VpcEncryptionControl.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        block_public_access_states: node.xpath_node("*[local-name()='blockPublicAccessStates']").try { |n| BlockPublicAccessStates.from_xml(n) },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::VpcState.from_json_object_key?(n.content) : nil,
        cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrBlock']")),
        dhcp_options_id: Core::XMLValue.string(node.xpath_node("*[local-name()='dhcpOptionsId']")),
      )
    end

    def validate! : Nil
      if value = @ipv_6_cidr_block_association_set
        value.each(&.validate!)
      end

      if value = @cidr_block_association_set
        value.each(&.validate!)
      end

      if value = @encryption_control
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @block_public_access_states
        value.validate!
      end
    end

    def_equals_and_hash(@owner_id, @instance_tenancy, @ipv_6_cidr_block_association_set, @cidr_block_association_set, @is_default, @encryption_control, @tags, @block_public_access_states, @vpc_id, @state, @cidr_block, @dhcp_options_id)
  end
end
