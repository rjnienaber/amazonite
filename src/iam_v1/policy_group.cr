private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about a group that a managed policy is attached to.
  #
  # This data type is used as a response element in the
  # [ListEntitiesForPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html)
  # operation.
  #
  # For more information about managed policies, refer to [Managed policies and inline
  # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
  # the *IAM User Guide*.
  class PolicyGroup
    # The name (friendly name, not ARN) identifying the group.
    property group_name : String | Nil

    # The stable and unique string identifying the group. For more information about IDs, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html) in the
    # *IAM User Guide*.
    property group_id : String | Nil

    def initialize(
      @group_name : String | Nil = nil,
      @group_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupId']")),
      )
    end

    def validate! : Nil
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
    end

    def_equals_and_hash(@group_name, @group_id)
  end
end
