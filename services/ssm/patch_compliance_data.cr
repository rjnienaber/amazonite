private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Information about the state of a patch on a particular managed node as it relates to the patch
  # baseline used to patch the node.
  class PatchComplianceData
    include JSON::Serializable

    # The title of the patch.
    @[JSON::Field(key: "Title")]
    property title : String

    # The operating system-specific ID of the patch.
    @[JSON::Field(key: "KBId")]
    property kb_id : String

    # The classification of the patch, such as `SecurityUpdates`, `Updates`, and `CriticalUpdates`.
    @[JSON::Field(key: "Classification")]
    property classification : String

    # The severity of the patch such as `Critical`, `Important`, and `Moderate`.
    @[JSON::Field(key: "Severity")]
    property severity : String

    # The state of the patch on the managed node, such as INSTALLED or FAILED.
    #
    # For descriptions of each patch state, see [About patch
    # compliance](https://docs.aws.amazon.com/systems-manager/latest/userguide/compliance-about.html#compliance-monitor-patch)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "State", converter: AS::PatchComplianceDataState)]
    property state : PatchComplianceDataState

    # The date/time the patch was installed on the managed node. Not all operating systems provide
    # this level of information.
    @[JSON::Field(key: "InstalledTime", converter: Core::AWSEpochConverter)]
    property installed_time : Time

    # The IDs of one or more Common Vulnerabilities and Exposure (CVE) issues that are resolved by the
    # patch.
    #
    # Currently, CVE ID values are reported only for patches with a status of `Missing` or `Failed`.
    @[JSON::Field(key: "CVEIds")]
    property cve_ids : String | Nil

    def initialize(
      @title : String,
      @kb_id : String,
      @classification : String,
      @severity : String,
      @state : PatchComplianceDataState,
      @installed_time : Time,
      @cve_ids : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@title, @kb_id, @classification, @severity, @state, @installed_time, @cve_ids)
  end
end
