private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteIpamRoutingPolicyRegistrationRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM internet registry association.
    property ipam_internet_registry_association_id : String

    # The IP address prefix in CIDR notation identifying the routing policy registration to delete.
    property cidr : String

    # Forces the deletion even if it conflicts with an announced route. Default: `false`.
    property force : Bool | Nil

    # A unique, case-sensitive identifier to ensure that the operation completes no more than one
    # time. If this token matches a previous request, the operation ignores the request, but does not
    # return an error.
    property client_token : String | Nil

    def initialize(
      @ipam_internet_registry_association_id : String,
      @cidr : String,
      @dry_run : Bool | Nil = nil,
      @force : Bool | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamInternetRegistryAssociationId", @ipam_internet_registry_association_id}

      params << {"#{prefix}Cidr", @cidr}

      if value = @force
        params << {"#{prefix}Force", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_internet_registry_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamInternetRegistryAssociationId']")).not_nil!,
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")).not_nil!,
        force: Core::XMLValue.bool(node.xpath_node("*[local-name()='Force']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @ipam_internet_registry_association_id, @cidr, @force, @client_token)
  end
end
