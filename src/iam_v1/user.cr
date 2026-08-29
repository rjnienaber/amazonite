private alias Core = Amazonite::Core

module Amazonite::IamV1
  class User
    property path : String

    property user_name : String

    property user_id : String

    property arn : String

    property create_date : Time

    property password_last_used : Time | Nil

    property permissions_boundary : AttachedPermissionsBoundary | Nil

    property tags : Array(Tag) | Nil

    def initialize(
      @path : String,
      @user_name : String,
      @user_id : String,
      @arn : String,
      @create_date : Time,
      @password_last_used : Time | Nil = nil,
      @permissions_boundary : AttachedPermissionsBoundary | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Path", @path}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}UserId", @user_id}

      params << {"#{prefix}Arn", @arn}

      params << {"#{prefix}CreateDate", Core::QueryValue.time(@create_date)}

      if value = @password_last_used
        params << {"#{prefix}PasswordLastUsed", Core::QueryValue.time(value)}
      end

      if value = @permissions_boundary
        params.concat(value.to_query_params("#{prefix}PermissionsBoundary."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")).not_nil!,
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UserId']")).not_nil!,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")).not_nil!,
        password_last_used: Core::XMLValue.time(node.xpath_node("*[local-name()='PasswordLastUsed']")),
        permissions_boundary: node.xpath_node("*[local-name()='PermissionsBoundary']").try { |n| AttachedPermissionsBoundary.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
