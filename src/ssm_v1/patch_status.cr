private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class PatchStatus
    include JSON::Serializable

    @[JSON::Field(key: "DeploymentStatus", converter: AS::PatchDeploymentStatus)]
    property deployment_status : PatchDeploymentStatus | Nil

    @[JSON::Field(key: "ComplianceLevel", converter: AS::PatchComplianceLevel)]
    property compliance_level : PatchComplianceLevel | Nil

    @[JSON::Field(key: "ApprovalDate", converter: Core::AWSEpochConverter)]
    property approval_date : Time | Nil

    def initialize(
      @deployment_status : PatchDeploymentStatus | Nil = nil,
      @compliance_level : PatchComplianceLevel | Nil = nil,
      @approval_date : Time | Nil = nil
    )
    end
  end
end
