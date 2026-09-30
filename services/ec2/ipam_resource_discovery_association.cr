private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # An IPAM resource discovery association. An associated resource discovery is a resource discovery
  # that has been associated with an IPAM. IPAM aggregates the resource CIDRs discovered by the
  # associated resource discovery.
  class IpamResourceDiscoveryAssociation
    # The Amazon Web Services account ID of the resource discovery owner.
    property owner_id : String | Nil

    # The resource discovery association ID.
    property ipam_resource_discovery_association_id : String | Nil

    # The resource discovery association Amazon Resource Name (ARN).
    property ipam_resource_discovery_association_arn : String | Nil

    # The resource discovery ID.
    property ipam_resource_discovery_id : String | Nil

    # The IPAM ID.
    property ipam_id : String | Nil

    # The IPAM ARN.
    property ipam_arn : String | Nil

    # The IPAM home Region.
    property ipam_region : String | Nil

    # Defines if the resource discovery is the default. When you create an IPAM, a default resource
    # discovery is created for your IPAM and it's associated with your IPAM.
    property is_default : Bool | Nil

    # The resource discovery status.
    #
    # - `active` - Connection or permissions required to read the results of the resource discovery
    # are intact.
    #
    # - `not-found` - Connection or permissions required to read the results of the resource discovery
    # are broken. This may happen if the owner of the resource discovery stopped sharing it or deleted
    # the resource discovery. Verify the resource discovery still exists and the Amazon Web Services
    # RAM resource share is still intact.
    property resource_discovery_status : IpamAssociatedResourceDiscoveryStatus | Nil

    # The lifecycle state of the association when you associate or disassociate a resource discovery.
    #
    # - `associate-in-progress` - Resource discovery is being associated.
    #
    # - `associate-complete` - Resource discovery association is complete.
    #
    # - `associate-failed` - Resource discovery association has failed.
    #
    # - `disassociate-in-progress` - Resource discovery is being disassociated.
    #
    # - `disassociate-complete` - Resource discovery disassociation is complete.
    #
    # - `disassociate-failed ` - Resource discovery disassociation has failed.
    #
    # - `isolate-in-progress` - Amazon Web Services account that created the resource discovery
    # association has been removed and the resource discovery association is being isolated.
    #
    # - `isolate-complete` - Resource discovery isolation is complete.
    #
    # - `restore-in-progress` - Resource discovery is being restored.
    property state : IpamResourceDiscoveryAssociationState | Nil

    # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key
    # and an optional value. You can use tags to search and filter your resources or track your Amazon
    # Web Services costs.
    property tags : Array(Tag) | Nil

    def initialize(
      @owner_id : String | Nil = nil,
      @ipam_resource_discovery_association_id : String | Nil = nil,
      @ipam_resource_discovery_association_arn : String | Nil = nil,
      @ipam_resource_discovery_id : String | Nil = nil,
      @ipam_id : String | Nil = nil,
      @ipam_arn : String | Nil = nil,
      @ipam_region : String | Nil = nil,
      @is_default : Bool | Nil = nil,
      @resource_discovery_status : IpamAssociatedResourceDiscoveryStatus | Nil = nil,
      @state : IpamResourceDiscoveryAssociationState | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @ipam_resource_discovery_association_id
        params << {"#{prefix}IpamResourceDiscoveryAssociationId", value}
      end

      if value = @ipam_resource_discovery_association_arn
        params << {"#{prefix}IpamResourceDiscoveryAssociationArn", value}
      end

      if value = @ipam_resource_discovery_id
        params << {"#{prefix}IpamResourceDiscoveryId", value}
      end

      if value = @ipam_id
        params << {"#{prefix}IpamId", value}
      end

      if value = @ipam_arn
        params << {"#{prefix}IpamArn", value}
      end

      if value = @ipam_region
        params << {"#{prefix}IpamRegion", value}
      end

      if value = @is_default
        params << {"#{prefix}IsDefault", Core::QueryValue.bool(value)}
      end

      if value = @resource_discovery_status
        params << {"#{prefix}ResourceDiscoveryStatus", value.to_json_object_key}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        ipam_resource_discovery_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamResourceDiscoveryAssociationId']")),
        ipam_resource_discovery_association_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamResourceDiscoveryAssociationArn']")),
        ipam_resource_discovery_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamResourceDiscoveryId']")),
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamId']")),
        ipam_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamArn']")),
        ipam_region: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamRegion']")),
        is_default: Core::XMLValue.bool(node.xpath_node("*[local-name()='isDefault']")),
        resource_discovery_status: (n = node.xpath_node("*[local-name()='resourceDiscoveryStatus']")) ? AEC::IpamAssociatedResourceDiscoveryStatus.from_json_object_key?(n.content) : nil,
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamResourceDiscoveryAssociationState.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_arn
        raise Core::ValidationError.new("IpamArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@owner_id, @ipam_resource_discovery_association_id, @ipam_resource_discovery_association_arn, @ipam_resource_discovery_id, @ipam_id, @ipam_arn, @ipam_region, @is_default, @resource_discovery_status, @state, @tags)
  end
end
