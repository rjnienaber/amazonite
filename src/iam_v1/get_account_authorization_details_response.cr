private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains the response to a successful
  # [GetAccountAuthorizationDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html)
  # request.
  class GetAccountAuthorizationDetailsResponse
    # A list containing information about IAM users.
    property user_detail_list : Array(UserDetail) | Nil

    # A list containing information about IAM groups.
    property group_detail_list : Array(GroupDetail) | Nil

    # A list containing information about IAM roles.
    property role_detail_list : Array(RoleDetail) | Nil

    # A list containing information about managed policies.
    property policies : Array(ManagedPolicyDetail) | Nil

    # A flag that indicates whether there are more items to return. If your results were truncated,
    # you can make a subsequent pagination request using the `Marker` request parameter to retrieve
    # more items. Note that IAM might return fewer than the `MaxItems` number of results even when
    # there are more results available. We recommend that you check `IsTruncated` after every call to
    # ensure that you receive all your results.
    property is_truncated : Bool | Nil

    # When `IsTruncated` is `true`, this element is present and contains the value to use for the
    # `Marker` parameter in a subsequent pagination request.
    property marker : String | Nil

    def initialize(
      @user_detail_list : Array(UserDetail) | Nil = nil,
      @group_detail_list : Array(GroupDetail) | Nil = nil,
      @role_detail_list : Array(RoleDetail) | Nil = nil,
      @policies : Array(ManagedPolicyDetail) | Nil = nil,
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@user_detail_list || [] of UserDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}UserDetailList.member.#{i}."))
      end

      (@group_detail_list || [] of GroupDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GroupDetailList.member.#{i}."))
      end

      (@role_detail_list || [] of RoleDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RoleDetailList.member.#{i}."))
      end

      (@policies || [] of ManagedPolicyDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Policies.member.#{i}."))
      end

      if value = @is_truncated
        params << {"#{prefix}IsTruncated", Core::QueryValue.bool(value)}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_detail_list: node.xpath_nodes("*[local-name()='UserDetailList']/*[local-name()='member']").map { |n| UserDetail.from_xml(n) },
        group_detail_list: node.xpath_nodes("*[local-name()='GroupDetailList']/*[local-name()='member']").map { |n| GroupDetail.from_xml(n) },
        role_detail_list: node.xpath_nodes("*[local-name()='RoleDetailList']/*[local-name()='member']").map { |n| RoleDetail.from_xml(n) },
        policies: node.xpath_nodes("*[local-name()='Policies']/*[local-name()='member']").map { |n| ManagedPolicyDetail.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end

    def validate! : Nil
      if value = @user_detail_list
        value.each(&.validate!)
      end

      if value = @group_detail_list
        value.each(&.validate!)
      end

      if value = @role_detail_list
        value.each(&.validate!)
      end

      if value = @policies
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@user_detail_list, @group_detail_list, @role_detail_list, @policies, @is_truncated, @marker)
  end
end
