private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about a managed policy.
  #
  # This data type is used as a response element in the
  # [CreatePolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html),
  # [GetPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicy.html), and
  # [ListPolicies](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicies.html)
  # operations.
  #
  # For more information about managed policies, refer to [Managed policies and inline
  # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
  # the *IAM User Guide*.
  class Policy
    # The friendly name (not ARN) identifying the policy.
    property policy_name : String | Nil

    # The stable and unique string identifying the policy.
    #
    # For more information about IDs, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property policy_id : String | Nil

    property arn : String | Nil

    # The path to the policy.
    #
    # For more information about paths, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property path : String | Nil

    # The identifier for the version of the policy that is set as the default version.
    property default_version_id : String | Nil

    # The number of entities (users, groups, and roles) that the policy is attached to.
    property attachment_count : Int32 | Nil

    # The number of entities (users and roles) for which the policy is used to set the permissions
    # boundary.
    #
    # For more information about permissions boundaries, see [Permissions boundaries for IAM
    # identities ](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
    # in the *IAM User Guide*.
    property permissions_boundary_usage_count : Int32 | Nil

    # Specifies whether the policy can be attached to an IAM user, group, or role.
    property is_attachable : Bool | Nil

    # A friendly description of the policy.
    #
    # This element is included in the response to the
    # [GetPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicy.html) operation.
    # It is not included in the response to the
    # [ListPolicies](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicies.html)
    # operation.
    property description : String | Nil

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the
    # policy was created.
    property create_date : Time | Nil

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the
    # policy was last updated.
    #
    # When a policy has only one version, this field contains the date and time when the policy was
    # created. When a policy has more than one version, this field contains the date and time when the
    # most recent policy version was created.
    property update_date : Time | Nil

    # A list of tags that are attached to the instance profile. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
    property tags : Array(Tag) | Nil

    def initialize(
      @policy_name : String | Nil = nil,
      @policy_id : String | Nil = nil,
      @arn : String | Nil = nil,
      @path : String | Nil = nil,
      @default_version_id : String | Nil = nil,
      @attachment_count : Int32 | Nil = nil,
      @permissions_boundary_usage_count : Int32 | Nil = nil,
      @is_attachable : Bool | Nil = nil,
      @description : String | Nil = nil,
      @create_date : Time | Nil = nil,
      @update_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy_name
        params << {"#{prefix}PolicyName", value}
      end

      if value = @policy_id
        params << {"#{prefix}PolicyId", value}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @path
        params << {"#{prefix}Path", value}
      end

      if value = @default_version_id
        params << {"#{prefix}DefaultVersionId", value}
      end

      if value = @attachment_count
        params << {"#{prefix}AttachmentCount", value.to_s}
      end

      if value = @permissions_boundary_usage_count
        params << {"#{prefix}PermissionsBoundaryUsageCount", value.to_s}
      end

      if value = @is_attachable
        params << {"#{prefix}IsAttachable", Core::QueryValue.bool(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      if value = @update_date
        params << {"#{prefix}UpdateDate", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")),
        policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyId']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        default_version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DefaultVersionId']")),
        attachment_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='AttachmentCount']")),
        permissions_boundary_usage_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='PermissionsBoundaryUsageCount']")),
        is_attachable: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsAttachable']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
        update_date: Core::XMLValue.time(node.xpath_node("*[local-name()='UpdateDate']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def_equals_and_hash(@policy_name, @policy_id, @arn, @path, @default_version_id, @attachment_count, @permissions_boundary_usage_count, @is_attachable, @description, @create_date, @update_date, @tags)
  end
end
