private alias Core = Amazonite::Core

module Amazonite::Iam
  class TagRoleRequest
    # The name of the IAM role to which you want to add tags.
    #
    # This parameter accepts (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string
    # of characters that consist of upper and lowercase alphanumeric characters with no spaces. You
    # can also include any of the following characters: _+=,.@-
    property role_name : String

    # The list of tags that you want to attach to the IAM role. Each tag consists of a key name and an
    # associated value.
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @role_name : String,
      @tags : Array(Tag),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleName", @role_name}

      @tags.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @role_name
        raise Core::ValidationError.new("RoleName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RoleName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("RoleName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@role_name, @tags)
  end
end
