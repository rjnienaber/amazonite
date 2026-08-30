private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about an IAM user, including all the user's policies and all the IAM groups
  # the user is in.
  #
  # This data type is used as a response element in the
  # [GetAccountAuthorizationDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html)
  # operation.
  class UserDetail
    # The path to the user. For more information about paths, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property path : String | Nil

    # The friendly name identifying the user.
    property user_name : String | Nil

    # The stable and unique string identifying the user. For more information about IDs, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property user_id : String | Nil

    property arn : String | Nil

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the user
    # was created.
    property create_date : Time | Nil

    # A list of the inline policies embedded in the user.
    property user_policy_list : Array(PolicyDetail) | Nil

    # A list of IAM groups that the user is in.
    property group_list : Array(String) | Nil

    # A list of the managed policies attached to the user.
    property attached_managed_policies : Array(AttachedPolicy) | Nil

    # The ARN of the policy used to set the permissions boundary for the user.
    #
    # For more information about permissions boundaries, see [Permissions boundaries for IAM
    # identities ](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
    # in the *IAM User Guide*.
    property permissions_boundary : AttachedPermissionsBoundary | Nil

    # A list of tags that are associated with the user. For more information about tagging, see
    # [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the
    # *IAM User Guide*.
    property tags : Array(Tag) | Nil

    def initialize(
      @path : String | Nil = nil,
      @user_name : String | Nil = nil,
      @user_id : String | Nil = nil,
      @arn : String | Nil = nil,
      @create_date : Time | Nil = nil,
      @user_policy_list : Array(PolicyDetail) | Nil = nil,
      @group_list : Array(String) | Nil = nil,
      @attached_managed_policies : Array(AttachedPolicy) | Nil = nil,
      @permissions_boundary : AttachedPermissionsBoundary | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      if value = @user_id
        params << {"#{prefix}UserId", value}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      (@user_policy_list || [] of PolicyDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}UserPolicyList.member.#{i}."))
      end

      (@group_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}GroupList.member.#{i}", item}
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UserId']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
        user_policy_list: node.xpath_nodes("*[local-name()='UserPolicyList']/*[local-name()='member']").map { |n| PolicyDetail.from_xml(n) },
        group_list: node.xpath_nodes("*[local-name()='GroupList']/*[local-name()='member']").map { |n| n.content },
        attached_managed_policies: node.xpath_nodes("*[local-name()='AttachedManagedPolicies']/*[local-name()='member']").map { |n| AttachedPolicy.from_xml(n) },
        permissions_boundary: node.xpath_node("*[local-name()='PermissionsBoundary']").try { |n| AttachedPermissionsBoundary.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def_equals_and_hash(@path, @user_name, @user_id, @arn, @create_date, @user_policy_list, @group_list, @attached_managed_policies, @permissions_boundary, @tags)
  end
end
