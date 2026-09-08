private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyIpamResourceCidrRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the resource you want to modify.
    property resource_id : String

    # The CIDR of the resource you want to modify.
    property resource_cidr : String

    # The Amazon Web Services Region of the resource you want to modify.
    property resource_region : String

    # The ID of the current scope that the resource CIDR is in.
    property current_ipam_scope_id : String

    # The ID of the scope you want to transfer the resource CIDR to.
    property destination_ipam_scope_id : String | Nil

    # Determines if the resource is monitored by IPAM. If a resource is monitored, the resource is
    # discovered by IPAM and you can view details about the resource’s CIDR.
    property monitored : Bool

    def initialize(
      @resource_id : String,
      @resource_cidr : String,
      @resource_region : String,
      @current_ipam_scope_id : String,
      @monitored : Bool,
      @dry_run : Bool | Nil = nil,
      @destination_ipam_scope_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}ResourceId", @resource_id}

      params << {"#{prefix}ResourceCidr", @resource_cidr}

      params << {"#{prefix}ResourceRegion", @resource_region}

      params << {"#{prefix}CurrentIpamScopeId", @current_ipam_scope_id}

      if value = @destination_ipam_scope_id
        params << {"#{prefix}DestinationIpamScopeId", value}
      end

      params << {"#{prefix}Monitored", Core::QueryValue.bool(@monitored)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceId']")).not_nil!,
        resource_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceCidr']")).not_nil!,
        resource_region: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceRegion']")).not_nil!,
        current_ipam_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CurrentIpamScopeId']")).not_nil!,
        destination_ipam_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationIpamScopeId']")),
        monitored: Core::XMLValue.bool(node.xpath_node("*[local-name()='Monitored']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @resource_id, @resource_cidr, @resource_region, @current_ipam_scope_id, @destination_ipam_scope_id, @monitored)
  end
end
