private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains information about a user that a managed policy is attached to.
  #
  # This data type is used as a response element in the
  # [ListEntitiesForPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html)
  # operation.
  #
  # For more information about managed policies, refer to [Managed policies and inline
  # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html) in
  # the *IAM User Guide*.
  class PolicyUser
    # The name (friendly name, not ARN) identifying the user.
    property user_name : String | Nil

    # The stable and unique string identifying the user. For more information about IDs, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html) in the
    # *IAM User Guide*.
    property user_id : String | Nil

    def initialize(
      @user_name : String | Nil = nil,
      @user_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      if value = @user_id
        params << {"#{prefix}UserId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UserId']")),
      )
    end

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @user_id
        raise Core::ValidationError.new("UserId length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("UserId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("UserId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end
    end

    def_equals_and_hash(@user_name, @user_id)
  end
end
