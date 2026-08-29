private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Information about the approval status of a patch.
  class PatchStatus
    include JSON::Serializable

    # The approval status of a patch.
    @[JSON::Field(key: "DeploymentStatus", converter: AS::PatchDeploymentStatus)]
    property deployment_status : PatchDeploymentStatus | Nil

    # The compliance severity level for a patch.
    @[JSON::Field(key: "ComplianceLevel", converter: AS::PatchComplianceLevel)]
    property compliance_level : PatchComplianceLevel | Nil

    # The date the patch was approved (or will be approved if the status is `PENDING_APPROVAL`).
    @[JSON::Field(key: "ApprovalDate", converter: Core::AWSEpochConverter)]
    property approval_date : Time | Nil

    def initialize(
      @deployment_status : PatchDeploymentStatus | Nil = nil,
      @compliance_level : PatchComplianceLevel | Nil = nil,
      @approval_date : Time | Nil = nil,
    )
    end
  end
end
