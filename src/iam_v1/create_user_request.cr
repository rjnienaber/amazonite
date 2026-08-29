private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateUserRequest
    property path : String | Nil

    property user_name : String

    property permissions_boundary : String | Nil

    property tags : Array(Tag) | Nil

    def initialize(
      @user_name : String,
      @path : String | Nil = nil,
      @permissions_boundary : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      params << {"#{prefix}UserName", @user_name}

      if value = @permissions_boundary
        params << {"#{prefix}PermissionsBoundary", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        permissions_boundary: Core::XMLValue.string(node.xpath_node("*[local-name()='PermissionsBoundary']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
