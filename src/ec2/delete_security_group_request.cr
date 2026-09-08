private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteSecurityGroupRequest
    # The ID of the security group.
    property group_id : String | Nil

    # [Default VPC] The name of the security group. You can specify either the security group name or
    # the security group ID. For security groups in a nondefault VPC, you must specify the security
    # group ID.
    property group_name : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @group_id : String | Nil = nil,
      @group_name : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupId']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@group_id, @group_name, @dry_run)
  end
end
