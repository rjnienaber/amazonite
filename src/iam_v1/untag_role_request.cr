private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UntagRoleRequest
    # The name of the IAM role from which you want to remove tags.
    #
    # This parameter accepts (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string
    # of characters that consist of upper and lowercase alphanumeric characters with no spaces. You
    # can also include any of the following characters: _+=,.@-
    property role_name : String

    # A list of key names as a simple array of strings. The tags with matching keys are removed from
    # the specified role.
    property tag_keys : Array(String) = [] of String

    def initialize(
      @role_name : String,
      @tag_keys : Array(String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleName", @role_name}

      @tag_keys.each_with_index(1) do |item, i|
        params << {"#{prefix}TagKeys.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        tag_keys: node.xpath_nodes("*[local-name()='TagKeys']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
