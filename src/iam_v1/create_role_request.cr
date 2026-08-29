private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateRoleRequest
    # The path to the role. For more information about paths, see [IAM
    # Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
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

    # The name of the role to create.
    #
    # IAM user, group, role, and policy names must be unique within the account. Names are not
    # distinguished by case. For example, you cannot create resources named both "MyResource" and
    # "myresource".
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property role_name : String

    # The trust relationship policy document that grants an entity permission to assume the role.
    #
    # In IAM, you must provide a JSON policy that has been converted to a string. However, for
    # CloudFormation templates formatted in YAML, you can provide the policy in JSON or YAML format.
    # CloudFormation always converts a YAML policy to JSON format before submitting it to IAM.
    #
    # The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this parameter is a string
    # of characters consisting of the following:
    #
    # - Any printable ASCII character ranging from the space character (`\u0020`) through the end of
    # the ASCII character range
    #
    # - The printable characters in the Basic Latin and Latin-1 Supplement character set (through
    # `\u00FF`)
    #
    # - The special characters tab (`\u0009`), line feed (`\u000A`), and carriage return (`\u000D`)
    #
    # Upon success, the response includes the same trust policy in JSON format.
    property assume_role_policy_document : String

    # A description of the role.
    property description : String | Nil

    # The maximum session duration (in seconds) that you want to set for the specified role. If you do
    # not specify a value for this setting, the default value of one hour is applied. This setting can
    # have a value from 1 hour to 12 hours.
    #
    # Anyone who assumes the role from the CLI or API can use the `DurationSeconds` API parameter or
    # the `duration-seconds` CLI parameter to request a longer session. The `MaxSessionDuration`
    # setting determines the maximum duration that can be requested using the `DurationSeconds`
    # parameter. If users don't specify a value for the `DurationSeconds` parameter, their security
    # credentials are valid for one hour by default. This applies when you use the `AssumeRole*` API
    # operations or the `assume-role*` CLI operations but does not apply when you use those operations
    # to create a console URL. For more information, see [Using IAM
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html) in the *IAM User
    # Guide*.
    property max_session_duration : Int32 | Nil

    # The ARN of the managed policy that is used to set the permissions boundary for the role.
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

    # A list of tags that you want to attach to the new role. Each tag consists of a key name and an
    # associated value. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    #
    # If any one of the tags is invalid or if you exceed the allowed maximum number of tags, then the
    # entire request fails and the resource is not created.
    property tags : Array(Tag) | Nil

    def initialize(
      @role_name : String,
      @assume_role_policy_document : String,
      @path : String | Nil = nil,
      @description : String | Nil = nil,
      @max_session_duration : Int32 | Nil = nil,
      @permissions_boundary : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      params << {"#{prefix}RoleName", @role_name}

      params << {"#{prefix}AssumeRolePolicyDocument", @assume_role_policy_document}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @max_session_duration
        params << {"#{prefix}MaxSessionDuration", value.to_s}
      end

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
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        assume_role_policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='AssumeRolePolicyDocument']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        max_session_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxSessionDuration']")),
        permissions_boundary: Core::XMLValue.string(node.xpath_node("*[local-name()='PermissionsBoundary']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
