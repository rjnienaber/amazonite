private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a load permission.
  class LoadPermission
    # The Amazon Web Services account ID.
    property user_id : String | Nil

    # The name of the group.
    property group : PermissionGroup | Nil

    def initialize(
      @user_id : String | Nil = nil,
      @group : PermissionGroup | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

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
        user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='userId']")),
        group: (n = node.xpath_node("*[local-name()='group']")) ? AEC::PermissionGroup.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@user_id, @group)
  end
end
