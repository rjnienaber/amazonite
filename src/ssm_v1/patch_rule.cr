private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # Defines an approval rule for a patch baseline.
  class PatchRule
    include JSON::Serializable

    # The patch filter group that defines the criteria for the rule.
    @[JSON::Field(key: "PatchFilterGroup")]
    property patch_filter_group : PatchFilterGroup

    # A compliance severity level for all approved patches in a patch baseline.
    @[JSON::Field(key: "ComplianceLevel", converter: AS::PatchComplianceLevel)]
    property compliance_level : PatchComplianceLevel | Nil

    # The number of days after the release date of each patch matched by the rule that the patch is
    # marked as approved in the patch baseline. For example, a value of `7` means that patches are
    # approved seven days after they are released.
    #
    # Patch Manager evaluates patch release dates using Coordinated Universal Time (UTC). If a patch
    # is released at `2025-11-09T18:00:00Z` and `ApproveAfterDays` is set to `7`, the patch will be
    # approved after `2025-11-16T18:00:00Z`.
    #
    # This parameter is marked as `Required: No`, but your request must include a value for either
    # `ApproveAfterDays` or `ApproveUntilDate`.
    #
    # Not supported for Debian Server or Ubuntu Server.
    #
    # Use caution when setting this value for Windows Server patch baselines. Because patch updates
    # that are replaced by later updates are removed, setting too broad a value for this parameter can
    # result in crucial patches not being installed. For more information, see the **Windows Server**
    # tab in the topic [How security patches are
    # selected](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-selecting-patches.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "ApproveAfterDays")]
    property approve_after_days : Int32 | Nil

    # The cutoff date for auto approval of released patches. Any patches released on or before this
    # date are installed automatically.
    #
    # Enter dates in the format `YYYY-MM-DD`. For example, `2025-11-16`.
    #
    # Patch Manager evaluates patch release dates using Coordinated Universal Time (UTC). If you enter
    # the date `2025-11-16`, patches released between `2025-11-16T00:00:00Z` and
    # `2025-11-16T23:59:59Z` will be included in the approval.
    #
    # This parameter is marked as `Required: No`, but your request must include a value for either
    # `ApproveUntilDate` or `ApproveAfterDays`.
    #
    # Not supported for Debian Server or Ubuntu Server.
    #
    # Use caution when setting this value for Windows Server patch baselines. Because patch updates
    # that are replaced by later updates are removed, setting too broad a value for this parameter can
    # result in crucial patches not being installed. For more information, see the **Windows Server**
    # tab in the topic [How security patches are
    # selected](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-selecting-patches.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "ApproveUntilDate")]
    property approve_until_date : String | Nil

    # For managed nodes identified by the approval rule filters, enables a patch baseline to apply
    # non-security updates available in the specified repository. The default value is `false`.
    # Applies to Linux managed nodes only.
    @[JSON::Field(key: "EnableNonSecurity")]
    property enable_non_security : Bool | Nil

    def initialize(
      @patch_filter_group : PatchFilterGroup,
      @compliance_level : PatchComplianceLevel | Nil = nil,
      @approve_after_days : Int32 | Nil = nil,
      @approve_until_date : String | Nil = nil,
      @enable_non_security : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@patch_filter_group, @compliance_level, @approve_after_days, @approve_until_date, @enable_non_security)
  end
end
