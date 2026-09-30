private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateIpamResourceDiscoveryRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # An IPAM ID.
    property ipam_id : String

    # A resource discovery ID.
    property ipam_resource_discovery_id : String

    # Tag specifications.
    property tag_specifications : Array(TagSpecification) | Nil

    # A client token.
    property client_token : String | Nil

    def initialize(
      @ipam_id : String,
      @ipam_resource_discovery_id : String,
      @dry_run : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamId", @ipam_id}

      params << {"#{prefix}IpamResourceDiscoveryId", @ipam_resource_discovery_id}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamId']")).not_nil!,
        ipam_resource_discovery_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamResourceDiscoveryId']")).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @ipam_id, @ipam_resource_discovery_id, @tag_specifications, @client_token)
  end
end
