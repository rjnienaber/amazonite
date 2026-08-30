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

    def_equals_and_hash(@arn)
  end
end
