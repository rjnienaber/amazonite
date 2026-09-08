private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyIpamScopeRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the scope you want to modify.
    property ipam_scope_id : String

    # The description of the scope you want to modify.
    property description : String | Nil

    # The configuration that links an Amazon VPC IPAM scope to an external authority system. It
    # specifies the type of external system and the external resource identifier that identifies your
    # account or instance in that system.
    #
    # In IPAM, an external authority is a third-party IP address management system that provides CIDR
    # blocks when you provision address space for top-level IPAM pools. This allows you to use your
    # existing IP management system to control which address ranges are allocated to Amazon Web
    # Services while using Amazon VPC IPAM to manage subnets within those ranges.
    property external_authority_configuration : ExternalAuthorityConfiguration | Nil

    # Remove the external authority configuration. `true` to remove.
    property remove_external_authority_configuration : Bool | Nil

    def initialize(
      @ipam_scope_id : String,
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @external_authority_configuration : ExternalAuthorityConfiguration | Nil = nil,
      @remove_external_authority_configuration : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamScopeId", @ipam_scope_id}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @external_authority_configuration
        params.concat(value.to_query_params("#{prefix}ExternalAuthorityConfiguration."))
      end

      if value = @remove_external_authority_configuration
        params << {"#{prefix}RemoveExternalAuthorityConfiguration", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamScopeId']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        external_authority_configuration: node.xpath_node("*[local-name()='ExternalAuthorityConfiguration']").try { |n| ExternalAuthorityConfiguration.from_xml(n) },
        remove_external_authority_configuration: Core::XMLValue.bool(node.xpath_node("*[local-name()='RemoveExternalAuthorityConfiguration']")),
      )
    end

    def validate! : Nil
      if value = @external_authority_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @ipam_scope_id, @description, @external_authority_configuration, @remove_external_authority_configuration)
  end
end
