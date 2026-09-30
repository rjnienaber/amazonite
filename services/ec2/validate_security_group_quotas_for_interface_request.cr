private alias Core = Amazonite::Core

module Amazonite::EC2
  class ValidateSecurityGroupQuotasForInterfaceRequest
    # The IDs of the security groups to validate for association with a single network interface. You
    # must specify at least one ID, and each ID must be unique. The number of IDs cannot exceed the
    # maximum number of security groups allowed per network interface.
    property security_group_ids : Array(String) = [] of String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @security_group_ids : Array(String),
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @security_group_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        security_group_ids: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@security_group_ids, @dry_run)
  end
end
