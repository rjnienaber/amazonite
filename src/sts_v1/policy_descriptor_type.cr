private alias Core = Amazonite::Core

module Amazonite::StsV1
  # A reference to the IAM managed policy that is passed as a session policy for a role session or a
  # federated user session.
  class PolicyDescriptorType
    # The Amazon Resource Name (ARN) of the IAM managed policy to use as a session policy for the
    # role. For more information about ARNs, see [Amazon Resource Names (ARNs) and Amazon Web Services
    # Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
    # in the *Amazon Web Services General Reference*.
    property arn : String | Nil

    def initialize(
      @arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @arn
        params << {"#{prefix}arn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='arn']")),
      )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("arn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("arn does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~\u0085\u00A0-퟿\uE000-�က0-ჿFF]+$"))
      end
    end

    def_equals_and_hash(@arn)
  end
end
