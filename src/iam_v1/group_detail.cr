private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about an IAM group, including all of the group's policies.
  #
  # This data type is used as a response element in the
  # [GetAccountAuthorizationDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html)
  # operation.
  class GroupDetail
    # The path to the group. For more information about paths, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property path : String | Nil

    # The friendly name that identifies the group.
    property group_name : String | Nil

    # The stable and unique string identifying the group. For more information about IDs, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property group_id : String | Nil

    property arn : String | Nil

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the
    # group was created.
    property create_date : Time | Nil

    # A list of the inline policies embedded in the group.
    property group_policy_list : Array(PolicyDetail) | Nil

    # A list of the managed policies attached to the group.
    property attached_managed_policies : Array(AttachedPolicy) | Nil

    def initialize(
      @path : String | Nil = nil,
      @group_name : String | Nil = nil,
      @group_id : String | Nil = nil,
      @arn : String | Nil = nil,
      @create_date : Time | Nil = nil,
      @group_policy_list : Array(PolicyDetail) | Nil = nil,
      @attached_managed_policies : Array(AttachedPolicy) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      (@group_policy_list || [] of PolicyDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GroupPolicyList.member.#{i}."))
      end

      (@attached_managed_policies || [] of AttachedPolicy).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AttachedManagedPolicies.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupId']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
        group_policy_list: node.xpath_nodes("*[local-name()='GroupPolicyList']/*[local-name()='member']").map { |n| PolicyDetail.from_xml(n) },
        attached_managed_policies: node.xpath_nodes("*[local-name()='AttachedManagedPolicies']/*[local-name()='member']").map { |n| AttachedPolicy.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @path
        raise Core::ValidationError.new("Path length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Path length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Path does not match the required pattern") unless value.matches?(Regex.new("^(/)|(/[!-~]+/)$"))
      end

      if value = @group_name
        raise Core::ValidationError.new("GroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("GroupName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("GroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @group_id
        raise Core::ValidationError.new("GroupId length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("GroupId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("GroupId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
      end

      if value = @group_policy_list
        value.each(&.validate!)
      end

      if value = @attached_managed_policies
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@path, @group_name, @group_id, @arn, @create_date, @group_policy_list, @attached_managed_policies)
  end
end
