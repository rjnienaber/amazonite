private alias Core = Amazonite::Core

module Amazonite::StsV1
  # Identifiers for the federated user that is associated with the credentials.
  class FederatedUser
    # The string that identifies the federated user associated with the credentials, similar to the
    # unique ID of an IAM user.
    property federated_user_id : String

    # The ARN that specifies the federated user that is associated with the credentials. For more
    # information about ARNs and how to use them in policies, see [IAM
    # Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html) in the
    # *IAM User Guide*.
    property arn : String

    def initialize(
      @federated_user_id : String,
      @arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}FederatedUserId", @federated_user_id}

      params << {"#{prefix}Arn", @arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        federated_user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='FederatedUserId']")).not_nil!,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @federated_user_id
        raise Core::ValidationError.new("FederatedUserId length must be >= 2") if value.size < 2
        raise Core::ValidationError.new("FederatedUserId length must be <= 193") if value.size > 193
        raise Core::ValidationError.new("FederatedUserId does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@\\:-]*$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Arn does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~\u0085\u00A0-퟿\uE000-�က0-ჿFF]+$"))
      end
    end

    def_equals_and_hash(@federated_user_id, @arn)
  end
end
