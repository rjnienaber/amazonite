module Amazonite::SsmV1
  class DescribePatchGroupStateResult
    include JSON::Serializable

    @[JSON::Field(key: "Instances")]
    property instances : Int32 | Nil

    @[JSON::Field(key: "InstancesWithInstalledPatches")]
    property instances_with_installed_patches : Int32 | Nil

    @[JSON::Field(key: "InstancesWithInstalledOtherPatches")]
    property instances_with_installed_other_patches : Int32 | Nil

    @[JSON::Field(key: "InstancesWithInstalledPendingRebootPatches")]
    property instances_with_installed_pending_reboot_patches : Int32 | Nil

    @[JSON::Field(key: "InstancesWithInstalledRejectedPatches")]
    property instances_with_installed_rejected_patches : Int32 | Nil

    @[JSON::Field(key: "InstancesWithMissingPatches")]
    property instances_with_missing_patches : Int32 | Nil

    @[JSON::Field(key: "InstancesWithFailedPatches")]
    property instances_with_failed_patches : Int32 | Nil

    @[JSON::Field(key: "InstancesWithNotApplicablePatches")]
    property instances_with_not_applicable_patches : Int32 | Nil

    @[JSON::Field(key: "InstancesWithUnreportedNotApplicablePatches")]
    property instances_with_unreported_not_applicable_patches : Int32 | Nil

    @[JSON::Field(key: "InstancesWithCriticalNonCompliantPatches")]
    property instances_with_critical_non_compliant_patches : Int32 | Nil

    @[JSON::Field(key: "InstancesWithSecurityNonCompliantPatches")]
    property instances_with_security_non_compliant_patches : Int32 | Nil

    @[JSON::Field(key: "InstancesWithOtherNonCompliantPatches")]
    property instances_with_other_non_compliant_patches : Int32 | Nil

    def initialize(
      @instances : Int32 | Nil = nil,
      @instances_with_installed_patches : Int32 | Nil = nil,
      @instances_with_installed_other_patches : Int32 | Nil = nil,
      @instances_with_installed_pending_reboot_patches : Int32 | Nil = nil,
      @instances_with_installed_rejected_patches : Int32 | Nil = nil,
      @instances_with_missing_patches : Int32 | Nil = nil,
      @instances_with_failed_patches : Int32 | Nil = nil,
      @instances_with_not_applicable_patches : Int32 | Nil = nil,
      @instances_with_unreported_not_applicable_patches : Int32 | Nil = nil,
      @instances_with_critical_non_compliant_patches : Int32 | Nil = nil,
      @instances_with_security_non_compliant_patches : Int32 | Nil = nil,
      @instances_with_other_non_compliant_patches : Int32 | Nil = nil
    )
    end
  end
end
