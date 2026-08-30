private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class RegisterPublisherInput
    # Whether you accept the [Terms and
    # Conditions](https://cloudformation-registry-documents.s3.amazonaws.com/Terms_and_Conditions_for_AWS_CloudFormation_Registry_Publishers.pdf)
    # for publishing extensions in the CloudFormation registry. You must accept the terms and
    # conditions in order to register to publish public extensions to the CloudFormation registry.
    #
    # The default is `false`.
    property accept_terms_and_conditions : Bool | Nil

    # If you are using a Bitbucket or GitHub account for identity verification, the Amazon Resource
    # Name (ARN) for your connection to that account.
    #
    # For more information, see [Prerequisite: Registering your account to publish CloudFormation
    # extensions](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html#publish-extension-prereqs)
    # in the *CloudFormation Command Line Interface (CLI) User Guide*.
    property connection_arn : String | Nil

    def initialize(
      @accept_terms_and_conditions : Bool | Nil = nil,
      @connection_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @accept_terms_and_conditions
        params << {"#{prefix}AcceptTermsAndConditions", Core::QueryValue.bool(value)}
      end

      if value = @connection_arn
        params << {"#{prefix}ConnectionArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        accept_terms_and_conditions: Core::XMLValue.bool(node.xpath_node("*[local-name()='AcceptTermsAndConditions']")),
        connection_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ConnectionArn']")),
      )
    end

    def validate! : Nil
      if value = @connection_arn
        raise Core::ValidationError.new("ConnectionArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ConnectionArn length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("ConnectionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws(-[\\w]+)*:.+:.+:[0-9]{12}:.+$"))
      end
    end

    def_equals_and_hash(@accept_terms_and_conditions, @connection_arn)
  end
end
