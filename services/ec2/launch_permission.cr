private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a launch permission.
  class LaunchPermission
    # The Amazon Resource Name (ARN) of an organization.
    property organization_arn : String | Nil

    # The Amazon Resource Name (ARN) of an organizational unit (OU).
    property organizational_unit_arn : String | Nil

    # The Amazon Web Services account ID.
    #
    # Constraints: Up to 10 000 account IDs can be specified in a single request.
    property user_id : String | Nil

    # The name of the group.
    property group : PermissionGroup | Nil

    def initialize(
      @organization_arn : String | Nil = nil,
      @organizational_unit_arn : String | Nil = nil,
      @user_id : String | Nil = nil,
      @group : PermissionGroup | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @organization_arn
        params << {"#{prefix}OrganizationArn", value}
      end

      if value = @organizational_unit_arn
        params << {"#{prefix}OrganizationalUnitArn", value}
      end

      if value = @user_id
        params << {"#{prefix}UserId", value}
      end

      if value = @group
        params << {"#{prefix}Group", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        organization_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='organizationArn']")),
        organizational_unit_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='organizationalUnitArn']")),
        user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='userId']")),
        group: (n = node.xpath_node("*[local-name()='group']")) ? AEC::PermissionGroup.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@organization_arn, @organizational_unit_arn, @user_id, @group)
  end
end
