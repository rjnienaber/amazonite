module Amazonite::SsmV1
  class DescribePatchGroupStateResult
    include JSON::Serializable

    # The number of managed nodes in the patch group.
    @[JSON::Field(key: "Instances")]
    property instances : Int32 | Nil

    # The number of managed nodes with installed patches.
    @[JSON::Field(key: "InstancesWithInstalledPatches")]
    property instances_with_installed_patches : Int32 | Nil

    # The number of managed nodes with patches installed that aren't defined in the patch baseline.
    @[JSON::Field(key: "InstancesWithInstalledOtherPatches")]
    property instances_with_installed_other_patches : Int32 | Nil

    # The number of managed nodes with patches installed by Patch Manager that haven't been rebooted
    # after the patch installation. The status of these managed nodes is `NON_COMPLIANT`.
    @[JSON::Field(key: "InstancesWithInstalledPendingRebootPatches")]
    property instances_with_installed_pending_reboot_patches : Int32 | Nil

    # The number of managed nodes with patches installed that are specified in a `RejectedPatches`
    # list. Patches with a status of `INSTALLED_REJECTED` were typically installed before they were
    # added to a `RejectedPatches` list.
    #
    # If `ALLOW_AS_DEPENDENCY` is the specified option for `RejectedPatchesAction`, the value of
    # `InstancesWithInstalledRejectedPatches` will always be `0` (zero).
    @[JSON::Field(key: "InstancesWithInstalledRejectedPatches")]
    property instances_with_installed_rejected_patches : Int32 | Nil

    # The number of managed nodes with missing patches from the patch baseline.
    @[JSON::Field(key: "InstancesWithMissingPatches")]
    property instances_with_missing_patches : Int32 | Nil

    # The number of managed nodes with patches from the patch baseline that failed to install.
    @[JSON::Field(key: "InstancesWithFailedPatches")]
    property instances_with_failed_patches : Int32 | Nil

    # The number of managed nodes with patches that aren't applicable.
    @[JSON::Field(key: "InstancesWithNotApplicablePatches")]
    property instances_with_not_applicable_patches : Int32 | Nil

    # The number of managed nodes with `NotApplicable` patches beyond the supported limit, which
    # aren't reported by name to Inventory. Inventory is a tool in Amazon Web Services Systems
    # Manager.
    @[JSON::Field(key: "InstancesWithUnreportedNotApplicablePatches")]
    property instances_with_unreported_not_applicable_patches : Int32 | Nil

    # The number of managed nodes where patches that are specified as `Critical` for compliance
    # reporting in the patch baseline aren't installed. These patches might be missing, have failed
    # installation, were rejected, or were installed but awaiting a required managed node reboot. The
    # status of these managed nodes is `NON_COMPLIANT`.
    @[JSON::Field(key: "InstancesWithCriticalNonCompliantPatches")]
    property instances_with_critical_non_compliant_patches : Int32 | Nil

    # The number of managed nodes where patches that are specified as `Security` in a patch advisory
    # aren't installed. These patches might be missing, have failed installation, were rejected, or
    # were installed but awaiting a required managed node reboot. The status of these managed nodes is
    # `NON_COMPLIANT`.
    @[JSON::Field(key: "InstancesWithSecurityNonCompliantPatches")]
    property instances_with_security_non_compliant_patches : Int32 | Nil

    # The number of managed nodes with patches installed that are specified as other than `Critical`
    # or `Security` but aren't compliant with the patch baseline. The status of these managed nodes is
    # `NON_COMPLIANT`.
    @[JSON::Field(key: "InstancesWithOtherNonCompliantPatches")]
    property instances_with_other_non_compliant_patches : Int32 | Nil

    # The number of managed nodes for which security-related patches are available but not approved
    # because because they didn't meet the patch baseline requirements. For example, an updated
    # version of a patch might have been released before the specified auto-approval period was over.
    #
    # Applies to Windows Server managed nodes only.
    @[JSON::Field(key: "InstancesWithAvailableSecurityUpdates")]
    property instances_with_available_security_updates : Int32 | Nil

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
      @instances_with_other_non_compliant_patches : Int32 | Nil = nil,
      @instances_with_available_security_updates : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instances, @instances_with_installed_patches, @instances_with_installed_other_patches, @instances_with_installed_pending_reboot_patches, @instances_with_installed_rejected_patches, @instances_with_missing_patches, @instances_with_failed_patches, @instances_with_not_applicable_patches, @instances_with_unreported_not_applicable_patches, @instances_with_critical_non_compliant_patches, @instances_with_security_non_compliant_patches, @instances_with_other_non_compliant_patches, @instances_with_available_security_updates)
  end
end
