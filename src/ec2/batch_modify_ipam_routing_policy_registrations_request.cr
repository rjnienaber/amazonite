private alias Core = Amazonite::Core

module Amazonite::EC2
  class BatchModifyIpamRoutingPolicyRegistrationsRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM internet registry association.
    property ipam_internet_registry_association_id : String

    # The batch modifications to apply, in JSON format.
    property delta_json : String

    # Forces the batch modification even if individual changes conflict with announced routes.
    # Default: `false`.
    property force : Bool | Nil

    # A unique, case-sensitive identifier to ensure that the operation completes no more than one
    # time. If this token matches a previous request, the operation ignores the request, but does not
    # return an error.
    property client_token : String | Nil

    def initialize(
      @ipam_internet_registry_association_id : String,
      @delta_json : String,
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

      params << {"#{prefix}DeltaJson", @delta_json}

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
        delta_json: Core::XMLValue.string(node.xpath_node("*[local-name()='DeltaJson']")).not_nil!,
        force: Core::XMLValue.bool(node.xpath_node("*[local-name()='Force']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @ipam_internet_registry_association_id, @delta_json, @force, @client_token)
  end
end
