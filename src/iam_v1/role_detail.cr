private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about an IAM role, including all of the role's policies.
  #
  # This data type is used as a response element in the
  # [GetAccountAuthorizationDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html)
  # operation.
  class RoleDetail
    # The path to the role. For more information about paths, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property path : String | Nil

    # The friendly name that identifies the role.
    property role_name : String | Nil

    # The stable and unique string identifying the role. For more information about IDs, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property role_id : String | Nil

    property arn : String | Nil

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the role
    # was created.
    property create_date : Time | Nil

    # The trust policy that grants permission to assume the role.
    property assume_role_policy_document : String | Nil

    # A list of instance profiles that contain this role.
    property instance_profile_list : Array(InstanceProfile) | Nil

    # A list of inline policies embedded in the role. These policies are the role's access
    # (permissions) policies.
    property role_policy_list : Array(PolicyDetail) | Nil

    # A list of managed policies attached to the role. These policies are the role's access
    # (permissions) policies.
    property attached_managed_policies : Array(AttachedPolicy) | Nil

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
    # in the *IAM User Guide*.
    property role_last_used : RoleLastUsed | Nil

    def initialize(
      @path : String | Nil = nil,
      @role_name : String | Nil = nil,
      @role_id : String | Nil = nil,
      @arn : String | Nil = nil,
      @create_date : Time | Nil = nil,
      @assume_role_policy_document : String | Nil = nil,
      @instance_profile_list : Array(InstanceProfile) | Nil = nil,
      @role_policy_list : Array(PolicyDetail) | Nil = nil,
      @attached_managed_policies : Array(AttachedPolicy) | Nil = nil,
      @permissions_boundary : AttachedPermissionsBoundary | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @role_last_used : RoleLastUsed | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      if value = @role_name
        params << {"#{prefix}RoleName", value}
      end

      if value = @role_id
        params << {"#{prefix}RoleId", value}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      if value = @assume_role_policy_document
        params << {"#{prefix}AssumeRolePolicyDocument", value}
      end

      (@instance_profile_list || [] of InstanceProfile).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}InstanceProfileList.member.#{i}."))
      end

      (@role_policy_list || [] of PolicyDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RolePolicyList.member.#{i}."))
      end

      (@attached_managed_policies || [] of AttachedPolicy).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AttachedManagedPolicies.member.#{i}."))
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")),
        role_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleId']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
        assume_role_policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='AssumeRolePolicyDocument']")),
        instance_profile_list: node.xpath_nodes("*[local-name()='InstanceProfileList']/*[local-name()='member']").map { |n| InstanceProfile.from_xml(n) },
        role_policy_list: node.xpath_nodes("*[local-name()='RolePolicyList']/*[local-name()='member']").map { |n| PolicyDetail.from_xml(n) },
        attached_managed_policies: node.xpath_nodes("*[local-name()='AttachedManagedPolicies']/*[local-name()='member']").map { |n| AttachedPolicy.from_xml(n) },
        permissions_boundary: node.xpath_node("*[local-name()='PermissionsBoundary']").try { |n| AttachedPermissionsBoundary.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        role_last_used: node.xpath_node("*[local-name()='RoleLastUsed']").try { |n| RoleLastUsed.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @path
        raise Core::ValidationError.new("Path length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Path length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Path does not match the required pattern") unless value.matches?(Regex.new("^(/)|(/[!-~]+/)$"))
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
        raise Core::ValidationError.new("AssumeRolePolicyDocument does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end

      if value = @instance_profile_list
        value.each(&.validate!)
      end

      if value = @role_policy_list
        value.each(&.validate!)
      end

      if value = @attached_managed_policies
        value.each(&.validate!)
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
    end

    def_equals_and_hash(@path, @role_name, @role_id, @arn, @create_date, @assume_role_policy_document, @instance_profile_list, @role_policy_list, @attached_managed_policies, @permissions_boundary, @tags, @role_last_used)
  end
end
