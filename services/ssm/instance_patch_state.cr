private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Defines the high-level patch compliance state for a managed node, providing information about
  # the number of installed, missing, not applicable, and failed patches along with metadata about
  # the operation when this information was gathered for the managed node.
  class InstancePatchState
    include JSON::Serializable

    # The ID of the managed node the high-level patch compliance information was collected for.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    # The name of the patch group the managed node belongs to.
    @[JSON::Field(key: "PatchGroup")]
    property patch_group : String

    # The ID of the patch baseline used to patch the managed node.
    @[JSON::Field(key: "BaselineId")]
    property baseline_id : String

    # The ID of the patch baseline snapshot used during the patching operation when this compliance
    # data was collected.
    @[JSON::Field(key: "SnapshotId")]
    property snapshot_id : String | Nil

    # An https URL or an Amazon Simple Storage Service (Amazon S3) path-style URL to a list of patches
    # to be installed. This patch installation list, which you maintain in an S3 bucket in YAML format
    # and specify in the SSM document `AWS-RunPatchBaseline`, overrides the patches specified by the
    # default patch baseline.
    #
    # For more information about the `InstallOverrideList` parameter, see [SSM Command document for
    # patching: `AWS-RunPatchBaseline`
    # ](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-about-aws-runpatchbaseline.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "InstallOverrideList")]
    property install_override_list : String | Nil

    # Placeholder information. This field will always be empty in the current release of the service.
    @[JSON::Field(key: "OwnerInformation")]
    property owner_information : String | Nil

    # The number of patches from the patch baseline that are installed on the managed node.
    @[JSON::Field(key: "InstalledCount")]
    property installed_count : Int32 | Nil

    # The number of patches not specified in the patch baseline that are installed on the managed
    # node.
    @[JSON::Field(key: "InstalledOtherCount")]
    property installed_other_count : Int32 | Nil

    # The number of patches installed by Patch Manager since the last time the managed node was
    # rebooted.
    @[JSON::Field(key: "InstalledPendingRebootCount")]
    property installed_pending_reboot_count : Int32 | Nil

    # The number of patches installed on a managed node that are specified in a `RejectedPatches`
    # list. Patches with a status of `InstalledRejected` were typically installed before they were
    # added to a `RejectedPatches` list.
    #
    # If `ALLOW_AS_DEPENDENCY` is the specified option for `RejectedPatchesAction`, the value of
    # `InstalledRejectedCount` will always be `0` (zero).
    @[JSON::Field(key: "InstalledRejectedCount")]
    property installed_rejected_count : Int32 | Nil

    # The number of patches from the patch baseline that are applicable for the managed node but
    # aren't currently installed.
    @[JSON::Field(key: "MissingCount")]
    property missing_count : Int32 | Nil

    # The number of patches from the patch baseline that were attempted to be installed during the
    # last patching operation, but failed to install.
    @[JSON::Field(key: "FailedCount")]
    property failed_count : Int32 | Nil

    # The number of patches beyond the supported limit of `NotApplicableCount` that aren't reported by
    # name to Inventory. Inventory is a tool in Amazon Web Services Systems Manager.
    @[JSON::Field(key: "UnreportedNotApplicableCount")]
    property unreported_not_applicable_count : Int32 | Nil

    # The number of patches from the patch baseline that aren't applicable for the managed node and
    # therefore aren't installed on the node. This number may be truncated if the list of patch names
    # is very large. The number of patches beyond this limit are reported in
    # `UnreportedNotApplicableCount`.
    @[JSON::Field(key: "NotApplicableCount")]
    property not_applicable_count : Int32 | Nil

    # The number of security-related patches that are available but not approved because they didn't
    # meet the patch baseline requirements. For example, an updated version of a patch might have been
    # released before the specified auto-approval period was over.
    #
    # Applies to Windows Server managed nodes only.
    @[JSON::Field(key: "AvailableSecurityUpdateCount")]
    property available_security_update_count : Int32 | Nil

    # The time the most recent patching operation was started on the managed node.
    @[JSON::Field(key: "OperationStartTime", converter: Core::AWSEpochConverter)]
    property operation_start_time : Time

    # The time the most recent patching operation completed on the managed node.
    @[JSON::Field(key: "OperationEndTime", converter: Core::AWSEpochConverter)]
    property operation_end_time : Time

    # The type of patching operation that was performed: or
    #
    # - `SCAN` assesses the patch compliance state.
    #
    # - `INSTALL` installs missing patches.
    @[JSON::Field(key: "Operation", converter: AS::PatchOperationType)]
    property operation : PatchOperationType

    # The time of the last attempt to patch the managed node with `NoReboot` specified as the reboot
    # option.
    @[JSON::Field(key: "LastNoRebootInstallOperationTime", converter: Core::AWSEpochConverter)]
    property last_no_reboot_install_operation_time : Time | Nil

    # Indicates the reboot option specified in the patch baseline.
    #
    # Reboot options apply to `Install` operations only. Reboots aren't attempted for Patch Manager
    # `Scan` operations.
    #
    # - `RebootIfNeeded`: Patch Manager tries to reboot the managed node if it installed any patches,
    # or if any patches are detected with a status of `InstalledPendingReboot`.
    #
    # - `NoReboot`: Patch Manager attempts to install missing packages without trying to reboot the
    # system. Patches installed with this option are assigned a status of `InstalledPendingReboot`.
    # These patches might not be in effect until a reboot is performed.
    @[JSON::Field(key: "RebootOption", converter: AS::RebootOption)]
    property reboot_option : RebootOption | Nil

    # The number of patches per node that are specified as `Critical` for compliance reporting in the
    # patch baseline aren't installed. These patches might be missing, have failed installation, were
    # rejected, or were installed but awaiting a required managed node reboot. The status of these
    # managed nodes is `NON_COMPLIANT`.
    @[JSON::Field(key: "CriticalNonCompliantCount")]
    property critical_non_compliant_count : Int32 | Nil

    # The number of patches per node that are specified as `Security` in a patch advisory aren't
    # installed. These patches might be missing, have failed installation, were rejected, or were
    # installed but awaiting a required managed node reboot. The status of these managed nodes is
    # `NON_COMPLIANT`.
    @[JSON::Field(key: "SecurityNonCompliantCount")]
    property security_non_compliant_count : Int32 | Nil

    # The number of patches per node that are specified as other than `Critical` or `Security` but
    # aren't compliant with the patch baseline. The status of these managed nodes is `NON_COMPLIANT`.
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
      @available_security_update_count : Int32 | Nil = nil,
      @last_no_reboot_install_operation_time : Time | Nil = nil,
      @reboot_option : RebootOption | Nil = nil,
      @critical_non_compliant_count : Int32 | Nil = nil,
      @security_non_compliant_count : Int32 | Nil = nil,
      @other_non_compliant_count : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @instance_id
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @patch_group
        raise Core::ValidationError.new("PatchGroup length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PatchGroup length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("PatchGroup does not match the required pattern") unless value.matches?(Regex.new("^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-@]*)$"))
      end

      if value = @baseline_id
        raise Core::ValidationError.new("BaselineId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("BaselineId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("BaselineId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-:/]{20,128}$"))
      end

      if value = @snapshot_id
        raise Core::ValidationError.new("SnapshotId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("SnapshotId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("SnapshotId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @install_override_list
        raise Core::ValidationError.new("InstallOverrideList length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("InstallOverrideList length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("InstallOverrideList does not match the required pattern") unless value.matches?(Regex.new("^https://.+$|^s3://([^/]+)/(.*?([^/]+))$"))
      end

      if value = @owner_information
        raise Core::ValidationError.new("OwnerInformation length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OwnerInformation length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@instance_id, @patch_group, @baseline_id, @snapshot_id, @install_override_list, @owner_information, @installed_count, @installed_other_count, @installed_pending_reboot_count, @installed_rejected_count, @missing_count, @failed_count, @unreported_not_applicable_count, @not_applicable_count, @available_security_update_count, @operation_start_time, @operation_end_time, @operation, @last_no_reboot_install_operation_time, @reboot_option, @critical_non_compliant_count, @security_non_compliant_count, @other_non_compliant_count)
  end
end
