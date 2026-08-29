private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UntagUserRequest
    property user_name : String

    property tag_keys : Array(String) = [] of String

    def initialize(
      @user_name : String,
      @tag_keys : Array(String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      @tag_keys.each_with_index(1) do |item, i|
        params << {"#{prefix}TagKeys.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        tag_keys: node.xpath_nodes("*[local-name()='TagKeys']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
