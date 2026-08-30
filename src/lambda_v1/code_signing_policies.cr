private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # Code signing configuration
  # [policies](https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html#config-codesigning-policies)
  # specify the validation failure action for signature mismatch or expiry.
  class CodeSigningPolicies
    include JSON::Serializable

    # Code signing configuration policy for deployment validation failure. If you set the policy to
    # `Enforce`, Lambda blocks the deployment request if signature validation checks fail. If you set
    # the policy to `Warn`, Lambda allows the deployment and issues a new Amazon CloudWatch metric
    # (`SignatureValidationErrors`) and also stores the warning in the CloudTrail log.
    #
    # Default value: `Warn`
    @[JSON::Field(key: "UntrustedArtifactOnDeployment", converter: AL::CodeSigningPolicy)]
    property untrusted_artifact_on_deployment : CodeSigningPolicy | Nil

    def initialize(
      @untrusted_artifact_on_deployment : CodeSigningPolicy | Nil = nil,
    )
    end

    def_equals_and_hash(@untrusted_artifact_on_deployment)
  end
end
