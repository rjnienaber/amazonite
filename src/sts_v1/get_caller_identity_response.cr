private alias Core = Amazonite::Core

module Amazonite::StsV1
  # Contains the response to a successful GetCallerIdentity request, including information about the
  # entity making the request.
  class GetCallerIdentityResponse
    # The unique identifier of the calling entity. The exact value depends on the type of entity that
    # is making the call. The values returned are those listed in the **aws:userid** column in the
    # [Principal
    # table](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_variables.html#principaltable)
    # found on the **Policy Variables** reference page in the *IAM User Guide*.
    property user_id : String | Nil

    # The Amazon Web Services account ID number of the account that owns or contains the calling
    # entity.
    property account : String | Nil

    # The Amazon Web Services ARN associated with the calling entity.
    property arn : String | Nil

    def initialize(
      @user_id : String | Nil = nil,
      @account : String | Nil = nil,
      @arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_id
        params << {"#{prefix}UserId", value}
      end

      if value = @account
        params << {"#{prefix}Account", value}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UserId']")),
        account: Core::XMLValue.string(node.xpath_node("*[local-name()='Account']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
      )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Arn does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~\u0085\u00A0-퟿\uE000-�က0-ჿFF]+$"))
      end
    end

    def_equals_and_hash(@user_id, @account, @arn)
  end
end
