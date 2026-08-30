private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateGroupRequest
    # Name of the IAM group to update. If you're changing the name of the group, this is the original
    # name.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property group_name : String

    # New path for the IAM group. Only include this if changing the group's path.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of either a forward slash (/) by itself or a string that must begin and
    # end with forward slashes. In addition, it can contain any ASCII character from the ! (`\u0021`)
    # through the DEL character (`\u007F`), including most punctuation characters, digits, and upper
    # and lowercased letters.
    property new_path : String | Nil

    # New name for the IAM group. Only include this if changing the group's name.
    #
    # IAM user, group, role, and policy names must be unique within the account. Names are not
    # distinguished by case. For example, you cannot create resources named both "MyResource" and
    # "myresource".
    property new_group_name : String | Nil

    def initialize(
      @group_name : String,
      @new_path : String | Nil = nil,
      @new_group_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GroupName", @group_name}

      if value = @new_path
        params << {"#{prefix}NewPath", value}
      end

      if value = @new_group_name
        params << {"#{prefix}NewGroupName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")).not_nil!,
        new_path: Core::XMLValue.string(node.xpath_node("*[local-name()='NewPath']")),
        new_group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='NewGroupName']")),
      )
    end

    def_equals_and_hash(@group_name, @new_path, @new_group_name)
  end
end
