private alias Core = Amazonite::Core

module Amazonite::IamV1
  class AddUserToGroupRequest
    # The name of the group to update.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property group_name : String

    # The name of the user to add.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String

    def initialize(
      @group_name : String,
      @user_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}GroupName", @group_name}

      params << {"#{prefix}UserName", @user_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")).not_nil!,
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
      )
    end

    def_equals_and_hash(@group_name, @user_name)
  end
end
