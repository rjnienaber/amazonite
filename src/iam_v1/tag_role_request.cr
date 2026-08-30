private alias Core = Amazonite::Core

module Amazonite::IamV1
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

    def_equals_and_hash(@role_name, @tags)
  end
end
