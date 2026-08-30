private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about an IAM role. This structure is returned as a response element in
  # several API operations that interact with roles.
  class Role
    # The path to the role. For more information about paths, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property path : String

    # The friendly name that identifies the role.
    property role_name : String

    # The stable and unique string identifying the role. For more information about IDs, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property role_id : String

    # The Amazon Resource Name (ARN) specifying the role. For more information about ARNs and how to
    # use them in policies, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide* guide.
    property arn : String

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the role
    # was created.
    property create_date : Time

    # The policy that grants an entity permission to assume the role.
    property assume_role_policy_document : String | Nil

    # A description of the role that you provide.
    property description : String | Nil

    # The maximum session duration (in seconds) for the specified role. Anyone who uses the CLI, or
    # API to assume the role can specify the duration using the optional `DurationSeconds` API
    # parameter or `duration-seconds` CLI parameter.
    property max_session_duration : Int32 | Nil

    # The ARN of the policy used to set the permissions boundary for the role.
    #
    # For more information about permissions boundaries, see [Permissions boundaries for IAM
    # identities ](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
    # in the *IAM User Guide*.
    property permissions_boundary : AttachedPermissionsBoundary | Nil

    # A list of tags that are attached to the role. For more information about tagging, see [Tagging
    # IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    property tags : Array(Tag) | Nil

    # Contains information about the last time that an IAM role was used. This includes the date and
    # time and the Region in which the role was last used. Activity is only reported for the trailing
    # 400 days. This period can be shorter if your Region began supporting these features within the
    # last year. The role might have been used more than 400 days ago. For more information, see
    # [Regions where data is
    # tracked](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period)
    # in the *IAM user Guide*.
    property role_last_used : RoleLastUsed | Nil

    # Contains information about the role template that this role was created from. This member is
    # present only for roles created with
    # [AcquireRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_AcquireRole.html).
    property source_role_template : SourceRoleTemplate | Nil

    def initialize(
      @path : String,
      @role_name : String,
      @role_id : String,
      @arn : String,
      @create_date : Time,
      @assume_role_policy_document : String | Nil = nil,
      @description : String | Nil = nil,
      @max_session_duration : Int32 | Nil = nil,
      @permissions_boundary : AttachedPermissionsBoundary | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @role_last_used : RoleLastUsed | Nil = nil,
      @source_role_template : SourceRoleTemplate | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Path", @path}

      params << {"#{prefix}RoleName", @role_name}

      params << {"#{prefix}RoleId", @role_id}

      params << {"#{prefix}Arn", @arn}

      params << {"#{prefix}CreateDate", Core::QueryValue.time(@create_date)}

      if value = @assume_role_policy_document
        params << {"#{prefix}AssumeRolePolicyDocument", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @max_session_duration
        params << {"#{prefix}MaxSessionDuration", value.to_s}
      end

      if value = @permissions_boundary
        params.concat(value.to_query_params("#{prefix}PermissionsBoundary."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end

      if value = @role_last_used
        params.concat(value.to_query_params("#{prefix}RoleLastUsed."))
      end

      if value = @source_role_template
        params.concat(value.to_query_params("#{prefix}SourceRoleTemplate."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")).not_nil!,
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        role_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleId']")).not_nil!,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")).not_nil!,
        assume_role_policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='AssumeRolePolicyDocument']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        max_session_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxSessionDuration']")),
        permissions_boundary: node.xpath_node("*[local-name()='PermissionsBoundary']").try { |n| AttachedPermissionsBoundary.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        role_last_used: node.xpath_node("*[local-name()='RoleLastUsed']").try { |n| RoleLastUsed.from_xml(n) },
        source_role_template: node.xpath_node("*[local-name()='SourceRoleTemplate']").try { |n| SourceRoleTemplate.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @path
        raise Core::ValidationError.new("Path length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Path length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Path does not match the required pattern") unless value.matches?(Regex.new("^(\\u002F)|(\\u002F[\\u0021-\\u007E]+\\u002F)$"))
      end

      if value = @role_name
        raise Core::ValidationError.new("RoleName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RoleName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("RoleName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @role_id
        raise Core::ValidationError.new("RoleId length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("RoleId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("RoleId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
      end

      if value = @assume_role_policy_document
        raise Core::ValidationError.new("AssumeRolePolicyDocument length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AssumeRolePolicyDocument length must be <= 131072") if value.size > 131072
        raise Core::ValidationError.new("AssumeRolePolicyDocument does not match the required pattern") unless value.matches?(Regex.new("^[\\u0009\\u000A\\u000D\\u0020-\\u00FF]+$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 1000") if value.size > 1000
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new("^[\\u0009\\u000A\\u000D\\u0020-\\u007E\\u00A1-\\u00FF]*$"))
      end

      if value = @max_session_duration
        raise Core::ValidationError.new("MaxSessionDuration value must be >= 3600") if value < 3600
        raise Core::ValidationError.new("MaxSessionDuration value must be <= 43200") if value > 43200
      end

      if value = @permissions_boundary
        value.validate!
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end

      if value = @role_last_used
        value.validate!
      end

      if value = @source_role_template
        value.validate!
      end
    end

    def_equals_and_hash(@path, @role_name, @role_id, @arn, @create_date, @assume_role_policy_document, @description, @max_session_duration, @permissions_boundary, @tags, @role_last_used, @source_role_template)
  end
end
