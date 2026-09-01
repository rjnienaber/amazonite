private alias Core = Amazonite::Core

module Amazonite::Iam
  class SetDefaultPolicyVersionRequest
    # The Amazon Resource Name (ARN) of the IAM policy whose default version you want to set.
    #
    # For more information about ARNs, see [Amazon Resource Names
    # (ARNs)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) in the
    # *Amazon Web Services General Reference*.
    property policy_arn : String

    # The version of the policy to set as the default (operative) version.
    #
    # For more information about managed policy versions, see [Versioning for managed
    # policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html) in
    # the *IAM User Guide*.
    property version_id : String

    def initialize(
      @policy_arn : String,
      @version_id : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyArn", @policy_arn}

      params << {"#{prefix}VersionId", @version_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")).not_nil!,
        version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionId']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @policy_arn
        raise Core::ValidationError.new("PolicyArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("PolicyArn length must be <= 2048") if value.size > 2048
      end

      if value = @version_id
        raise Core::ValidationError.new("VersionId does not match the required pattern") unless value.matches?(Regex.new("^v[1-9][0-9]*(\\.[A-Za-z0-9-]*)?$"))
      end
    end

    def_equals_and_hash(@policy_arn, @version_id)
  end
end
