private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateUserRequest
    # The path for the user name. For more information about paths, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    #
    # This parameter is optional. If it is not included, it defaults to a slash (/).
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of either a forward slash (/) by itself or a string that must begin and
    # end with forward slashes. In addition, it can contain any ASCII character from the ! (`\u0021`)
    # through the DEL character (`\u007F`), including most punctuation characters, digits, and upper
    # and lowercased letters.
    property path : String | Nil

    # The name of the user to create.
    #
    # IAM user, group, role, and policy names must be unique within the account. Names are not
    # distinguished by case. For example, you cannot create resources named both "MyResource" and
    # "myresource".
    property user_name : String

    # The ARN of the managed policy that is used to set the permissions boundary for the user.
    #
    # A permissions boundary policy defines the maximum permissions that identity-based policies can
    # grant to an entity, but does not grant permissions. Permissions boundaries do not define the
    # maximum permissions that a resource-based policy can grant to an entity. To learn more, see
    # [Permissions boundaries for IAM
    # entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html) in
    # the *IAM User Guide*.
    #
    # For more information about policy types, see [Policy types
    # ](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policy-types) in
    # the *IAM User Guide*.
    property permissions_boundary : String | Nil

    # A list of tags that you want to attach to the new user. Each tag consists of a key name and an
    # associated value. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    #
    # If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the
    # entire request fails and the resource is not created.
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

    def_equals_and_hash(@path, @user_name, @permissions_boundary, @tags)
  end
end
