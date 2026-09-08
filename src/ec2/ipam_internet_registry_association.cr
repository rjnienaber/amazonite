private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about an association between an IPAM and a Regional Internet Registry (RIR)
  # for delegated RPKI management.
  class IpamInternetRegistryAssociation
    # The ID of the Amazon Web Services account that owns the internet registry association.
    property owner_id : String | Nil

    # The ID of the internet registry association.
    property ipam_internet_registry_association_id : String | Nil

    # The Amazon Resource Name (ARN) of the internet registry association.
    property ipam_internet_registry_association_arn : String | Nil

    # The ID of the associated IPAM.
    property ipam_id : String | Nil

    # The Amazon Web Services Region of the IPAM.
    property ipam_region : String | Nil

    # The Regional Internet Registry. Possible values:
    #
    # - `ripe` - RIPE NCC (Europe, the Middle East, and Central Asia).
    #
    # - `apnic` - APNIC (Asia Pacific).
    #
    # - `arin` - ARIN (North America).
    #
    # - `lacnic` - LACNIC (Latin America and the Caribbean).
    property rir : Rir | Nil

    # The organization handle at the internet registry.
    property organization_handle : String | Nil

    # The description of the internet registry association.
    property description : String | Nil

    # The state of the internet registry association. Valid values: `pending-activation` |
    # `pending-enable` | `create-in-progress` | `create-failed` | `enable-in-progress` |
    # `enable-complete` | `enable-failed` | `delete-in-progress` | `delete-complete` |
    # `delete-failed`.
    property state : IpamInternetRegistryAssociationState | Nil

    # A message describing the current state of the internet registry association, including
    # additional details such as the reason for a failure.
    property state_message : String | Nil

    # The XML content for the child request to be submitted to the internet registry to complete the
    # BPKI setup.
    property child_request_xml : String | Nil

    # The tags assigned to the internet registry association.
    property tags : Array(Tag) | Nil

    def initialize(
      @owner_id : String | Nil = nil,
      @ipam_internet_registry_association_id : String | Nil = nil,
      @ipam_internet_registry_association_arn : String | Nil = nil,
      @ipam_id : String | Nil = nil,
      @ipam_region : String | Nil = nil,
      @rir : Rir | Nil = nil,
      @organization_handle : String | Nil = nil,
      @description : String | Nil = nil,
      @state : IpamInternetRegistryAssociationState | Nil = nil,
      @state_message : String | Nil = nil,
      @child_request_xml : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @ipam_internet_registry_association_id
        params << {"#{prefix}IpamInternetRegistryAssociationId", value}
      end

      if value = @ipam_internet_registry_association_arn
        params << {"#{prefix}IpamInternetRegistryAssociationArn", value}
      end

      if value = @ipam_id
        params << {"#{prefix}IpamId", value}
      end

      if value = @ipam_region
        params << {"#{prefix}IpamRegion", value}
      end

      if value = @rir
        params << {"#{prefix}Rir", value.to_json_object_key}
      end

      if value = @organization_handle
        params << {"#{prefix}OrganizationHandle", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_message
        params << {"#{prefix}StateMessage", value}
      end

      if value = @child_request_xml
        params << {"#{prefix}ChildRequestXml", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        ipam_internet_registry_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamInternetRegistryAssociationId']")),
        ipam_internet_registry_association_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamInternetRegistryAssociationArn']")),
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamId']")),
        ipam_region: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamRegion']")),
        rir: (n = node.xpath_node("*[local-name()='rir']")) ? AEC::Rir.from_json_object_key?(n.content) : nil,
        organization_handle: Core::XMLValue.string(node.xpath_node("*[local-name()='organizationHandle']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamInternetRegistryAssociationState.from_json_object_key?(n.content) : nil,
        state_message: Core::XMLValue.string(node.xpath_node("*[local-name()='stateMessage']")),
        child_request_xml: Core::XMLValue.string(node.xpath_node("*[local-name()='childRequestXml']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_internet_registry_association_arn
        raise Core::ValidationError.new("IpamInternetRegistryAssociationArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamInternetRegistryAssociationArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@owner_id, @ipam_internet_registry_association_id, @ipam_internet_registry_association_arn, @ipam_id, @ipam_region, @rir, @organization_handle, @description, @state, @state_message, @child_request_xml, @tags)
  end
end
