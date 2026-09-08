private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The resource used to provision CIDRs to a resource planning pool.
  class IpamPoolSourceResource
    # The source resource ID.
    property resource_id : String | Nil

    # The source resource type.
    property resource_type : IpamPoolSourceResourceType | Nil

    # The source resource Region.
    property resource_region : String | Nil

    # The source resource owner.
    property resource_owner : String | Nil

    def initialize(
      @resource_id : String | Nil = nil,
      @resource_type : IpamPoolSourceResourceType | Nil = nil,
      @resource_region : String | Nil = nil,
      @resource_owner : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      if value = @resource_region
        params << {"#{prefix}ResourceRegion", value}
      end

      if value = @resource_owner
        params << {"#{prefix}ResourceOwner", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::IpamPoolSourceResourceType.from_json_object_key?(n.content) : nil,
        resource_region: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceRegion']")),
        resource_owner: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceOwner']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@resource_id, @resource_type, @resource_region, @resource_owner)
  end
end
