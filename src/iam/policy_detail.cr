private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains information about an IAM policy, including the policy document.
  #
  # This data type is used as a response element in the
  # [GetAccountAuthorizationDetails](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html)
  # operation.
  class PolicyDetail
    # The name of the policy.
    property policy_name : String | Nil

    # The policy document.
    property policy_document : String | Nil

    def initialize(
      @policy_name : String | Nil = nil,
      @policy_document : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy_name
        params << {"#{prefix}PolicyName", value}
      end

      if value = @policy_document
        params << {"#{prefix}PolicyDocument", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")),
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyDocument']")),
      )
    end

    def validate! : Nil
      if value = @policy_name
        raise Core::ValidationError.new("PolicyName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("PolicyName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @policy_document
        raise Core::ValidationError.new("PolicyDocument length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyDocument length must be <= 131072") if value.size > 131072
        raise Core::ValidationError.new("PolicyDocument does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end
    end

    def_equals_and_hash(@policy_name, @policy_document)
  end
end
