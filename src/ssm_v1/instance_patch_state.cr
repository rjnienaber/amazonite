private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class InstancePatchState
    include JSON::Serializable

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String

    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String

    @[JSON::Field(key: "SnapshotId")]
    property snapshot_id : String | Nil

    @[JSON::Field(key: "InstallOverrideList")]
    property install_override_list : String | Nil

    @[JSON::Field(key: "OwnerInformation")]
    property owner_information : String | Nil

    @[JSON::Field(key: "InstalledCount")]
    property installed_count : Int32 | Nil

    @[JSON::Field(key: "InstalledOtherCount")]
    property installed_other_count : Int32 | Nil

    @[JSON::Field(key: "InstalledPendingRebootCount")]
    property installed_pending_reboot_count : Int32 | Nil

    @[JSON::Field(key: "InstalledRejectedCount")]
    property installed_rejected_count : Int32 | Nil

    @[JSON::Field(key: "MissingCount")]
    property missing_count : Int32 | Nil

    @[JSON::Field(key: "FailedCount")]
    property failed_count : Int32 | Nil

    @[JSON::Field(key: "UnreportedNotApplicableCount")]
    property unreported_not_applicable_count : Int32 | Nil

    @[JSON::Field(key: "NotApplicableCount")]
    property not_applicable_count : Int32 | Nil

    @[JSON::Field(key: "OperationStartTime", converter: Core::AWSEpochConverter)]
    property operation_start_time : Time

    @[JSON::Field(key: "OperationEndTime", converter: Core::AWSEpochConverter)]
    property operation_end_time : Time

    @[JSON::Field(key: "Operation", converter: AS::PatchOperationType)]
    property operation : PatchOperationType

    @[JSON::Field(key: "LastNoRebootInstallOperationTime", converter: Core::AWSEpochConverter)]
    property last_no_reboot_install_operation_time : Time | Nil

    @[JSON::Field(key: "RebootOption", converter: AS::RebootOption)]
    property reboot_option : RebootOption | Nil

    @[JSON::Field(key: "CriticalNonCompliantCount")]
    property critical_non_compliant_count : Int32 | Nil

    @[JSON::Field(key: "SecurityNonCompliantCount")]
    property security_non_compliant_count : Int32 | Nil

    @[JSON::Field(key: "OtherNonCompliantCount")]
    property other_non_compliant_count : Int32 | Nil

    def initialize(
      @instance_id : String,
      @patch_group : String,
      @baseline_id : String,
      @operation_start_time : Time,
      @operation_end_time : Time,
      @operation : PatchOperationType,
      @snapshot_id : String | Nil = nil,
      @install_override_list : String | Nil = nil,
      @owner_information : String | Nil = nil,
      @installed_count : Int32 | Nil = nil,
      @installed_other_count : Int32 | Nil = nil,
      @installed_pending_reboot_count : Int32 | Nil = nil,
      @installed_rejected_count : Int32 | Nil = nil,
      @missing_count : Int32 | Nil = nil,
      @failed_count : Int32 | Nil = nil,
      @unreported_not_applicable_count : Int32 | Nil = nil,
      @not_applicable_count : Int32 | Nil = nil,
      @last_no_reboot_install_operation_time : Time | Nil = nil,
      @reboot_option : RebootOption | Nil = nil,
      @critical_non_compliant_count : Int32 | Nil = nil,
      @security_non_compliant_count : Int32 | Nil = nil,
      @other_non_compliant_count : Int32 | Nil = nil
    )
    end
  end
end
