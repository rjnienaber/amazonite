module Amazonite::IamV1
  # Contains the response to a successful
  # [CreateGroup](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateGroup.html) request.
  class CreateGroupResponse
    # A structure containing details about the new group.
    property group : Group

    def initialize(
      @group : Group,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@group.to_query_params("#{prefix}Group."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group: node.xpath_node("*[local-name()='Group']").try { |n| Group.from_xml(n) }.not_nil!,
      )
    end

    def_equals_and_hash(@group)
  end
end
