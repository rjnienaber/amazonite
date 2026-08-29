private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class CodeSigningPolicies
    include JSON::Serializable

    @[JSON::Field(key: "UntrustedArtifactOnDeployment", converter: AL::CodeSigningPolicy)]
    property untrusted_artifact_on_deployment : CodeSigningPolicy | Nil

    def initialize(
      @untrusted_artifact_on_deployment : CodeSigningPolicy | Nil = nil,
    )
    end
  end
end
