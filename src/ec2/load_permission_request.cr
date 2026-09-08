private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a load permission.
  class LoadPermissionRequest
    # The name of the group.
    property group : PermissionGroup | Nil

    # The Amazon Web Services account ID.
    property user_id : String | Nil

    def initialize(
      @group : PermissionGroup | Nil = nil,
      @user_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group
        params << {"#{prefix}Group", value.to_json_object_key}
      end

      if value = @user_id
        params << {"#{prefix}UserId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group: (n = node.xpath_node("*[local-name()='Group']")) ? AEC::PermissionGroup.from_json_object_key?(n.content) : nil,
        user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UserId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@group, @user_id)
  end
end
