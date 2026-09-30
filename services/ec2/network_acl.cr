private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a network ACL.
  class NetworkAcl
    # Any associations between the network ACL and your subnets
    property associations : Array(NetworkAclAssociation) | Nil

    # The entries (rules) in the network ACL.
    property entries : Array(NetworkAclEntry) | Nil

    # Indicates whether this is the default network ACL for the VPC.
    property is_default : Bool | Nil

    # The ID of the network ACL.
    property network_acl_id : String | Nil

    # Any tags assigned to the network ACL.
    property tags : Array(Tag) | Nil

    # The ID of the VPC for the network ACL.
    property vpc_id : String | Nil

    # The ID of the Amazon Web Services account that owns the network ACL.
    property owner_id : String | Nil

    def initialize(
      @associations : Array(NetworkAclAssociation) | Nil = nil,
      @entries : Array(NetworkAclEntry) | Nil = nil,
      @is_default : Bool | Nil = nil,
      @network_acl_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @vpc_id : String | Nil = nil,
      @owner_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@associations || [] of NetworkAclAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AssociationSet.#{i}."))
      end

      (@entries || [] of NetworkAclEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}EntrySet.#{i}."))
      end

      if value = @is_default
        params << {"#{prefix}Default", Core::QueryValue.bool(value)}
      end

      if value = @network_acl_id
        params << {"#{prefix}NetworkAclId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        associations: node.xpath_nodes("*[local-name()='associationSet']/*[local-name()='item']").map { |n| NetworkAclAssociation.from_xml(n) },
        entries: node.xpath_nodes("*[local-name()='entrySet']/*[local-name()='item']").map { |n| NetworkAclEntry.from_xml(n) },
        is_default: Core::XMLValue.bool(node.xpath_node("*[local-name()='default']")),
        network_acl_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkAclId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
      )
    end

    def validate! : Nil
      if value = @associations
        value.each(&.validate!)
      end

      if value = @entries
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@associations, @entries, @is_default, @network_acl_id, @tags, @vpc_id, @owner_id)
  end
end
