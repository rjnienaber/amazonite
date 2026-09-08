private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The historical record of a CIDR within an IPAM scope. For more information, see [View the
  # history of IP
  # addresses](https://docs.aws.amazon.com/vpc/latest/ipam/view-history-cidr-ipam.html) in the
  # *Amazon VPC IPAM User Guide*.
  class IpamAddressHistoryRecord
    # The ID of the resource owner.
    property resource_owner_id : String | Nil

    # The Amazon Web Services Region of the resource.
    property resource_region : String | Nil

    # The type of the resource.
    property resource_type : IpamAddressHistoryResourceType | Nil

    # The ID of the resource.
    property resource_id : String | Nil

    # The CIDR of the resource.
    property resource_cidr : String | Nil

    # The name of the resource.
    property resource_name : String | Nil

    # The compliance status of a resource. For more information on compliance statuses, see [Monitor
    # CIDR usage by
    # resource](https://docs.aws.amazon.com/vpc/latest/ipam/monitor-cidr-compliance-ipam.html) in the
    # *Amazon VPC IPAM User Guide*.
    property resource_compliance_status : IpamComplianceStatus | Nil

    # The overlap status of an IPAM resource. The overlap status tells you if the CIDR for a resource
    # overlaps with another CIDR in the scope. For more information on overlap statuses, see [Monitor
    # CIDR usage by
    # resource](https://docs.aws.amazon.com/vpc/latest/ipam/monitor-cidr-compliance-ipam.html) in the
    # *Amazon VPC IPAM User Guide*.
    property resource_overlap_status : IpamOverlapStatus | Nil

    # The VPC ID of the resource.
    property vpc_id : String | Nil

    # Sampled start time of the resource-to-CIDR association within the IPAM scope. Changes are picked
    # up in periodic snapshots, so the start time may have occurred before this specific time.
    property sampled_start_time : Time | Nil

    # Sampled end time of the resource-to-CIDR association within the IPAM scope. Changes are picked
    # up in periodic snapshots, so the end time may have occurred before this specific time.
    property sampled_end_time : Time | Nil

    def initialize(
      @resource_owner_id : String | Nil = nil,
      @resource_region : String | Nil = nil,
      @resource_type : IpamAddressHistoryResourceType | Nil = nil,
      @resource_id : String | Nil = nil,
      @resource_cidr : String | Nil = nil,
      @resource_name : String | Nil = nil,
      @resource_compliance_status : IpamComplianceStatus | Nil = nil,
      @resource_overlap_status : IpamOverlapStatus | Nil = nil,
      @vpc_id : String | Nil = nil,
      @sampled_start_time : Time | Nil = nil,
      @sampled_end_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_owner_id
        params << {"#{prefix}ResourceOwnerId", value}
      end

      if value = @resource_region
        params << {"#{prefix}ResourceRegion", value}
      end

      if value = @resource_type
        params << {"#{prefix}ResourceType", value.to_json_object_key}
      end

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @resource_cidr
        params << {"#{prefix}ResourceCidr", value}
      end

      if value = @resource_name
        params << {"#{prefix}ResourceName", value}
      end

      if value = @resource_compliance_status
        params << {"#{prefix}ResourceComplianceStatus", value.to_json_object_key}
      end

      if value = @resource_overlap_status
        params << {"#{prefix}ResourceOverlapStatus", value.to_json_object_key}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @sampled_start_time
        params << {"#{prefix}SampledStartTime", Core::QueryValue.time(value)}
      end

      if value = @sampled_end_time
        params << {"#{prefix}SampledEndTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceOwnerId']")),
        resource_region: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceRegion']")),
        resource_type: (n = node.xpath_node("*[local-name()='resourceType']")) ? AEC::IpamAddressHistoryResourceType.from_json_object_key?(n.content) : nil,
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        resource_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceCidr']")),
        resource_name: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceName']")),
        resource_compliance_status: (n = node.xpath_node("*[local-name()='resourceComplianceStatus']")) ? AEC::IpamComplianceStatus.from_json_object_key?(n.content) : nil,
        resource_overlap_status: (n = node.xpath_node("*[local-name()='resourceOverlapStatus']")) ? AEC::IpamOverlapStatus.from_json_object_key?(n.content) : nil,
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        sampled_start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='sampledStartTime']")),
        sampled_end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='sampledEndTime']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@resource_owner_id, @resource_region, @resource_type, @resource_id, @resource_cidr, @resource_name, @resource_compliance_status, @resource_overlap_status, @vpc_id, @sampled_start_time, @sampled_end_time)
  end
end
