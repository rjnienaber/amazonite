private alias Core = Amazonite::Core

module Amazonite::Iam
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

    def validate! : Nil
      if value = @role_name
        raise Core::ValidationError.new("RoleName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RoleName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("RoleName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @tag_keys
        raise Core::ValidationError.new("TagKeys must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("TagKeys must have at most 50 item(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@role_name, @tag_keys)
  end
end
