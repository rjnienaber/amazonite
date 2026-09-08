private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcEndpointServicePermissionsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the service.
    property service_id : String

    # The Amazon Resource Names (ARN) of the principals. Permissions are granted to the principals in
    # this list. To grant permissions to all principals, specify an asterisk (*).
    property add_allowed_principals : Array(String) | Nil

    # The Amazon Resource Names (ARN) of the principals. Permissions are revoked for principals in
    # this list.
    property remove_allowed_principals : Array(String) | Nil

    def initialize(
      @service_id : String,
      @dry_run : Bool | Nil = nil,
      @add_allowed_principals : Array(String) | Nil = nil,
      @remove_allowed_principals : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}ServiceId", @service_id}

      (@add_allowed_principals || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddAllowedPrincipals.#{i}", item}
      end

      (@remove_allowed_principals || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveAllowedPrincipals.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        service_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceId']")).not_nil!,
        add_allowed_principals: node.xpath_nodes("*[local-name()='AddAllowedPrincipals']/*[local-name()='item']").map { |n| n.content },
        remove_allowed_principals: node.xpath_nodes("*[local-name()='RemoveAllowedPrincipals']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @service_id, @add_allowed_principals, @remove_allowed_principals)
  end
end
