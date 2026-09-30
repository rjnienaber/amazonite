private alias Core = Amazonite::Core

module Amazonite::EC2
  class RestoreSnapshotTierRequest
    # The ID of the snapshot to restore.
    property snapshot_id : String

    # Specifies the number of days for which to temporarily restore an archived snapshot. Required for
    # temporary restores only. The snapshot will be automatically re-archived after this period.
    #
    # To temporarily restore an archived snapshot, specify the number of days and omit the
    # **PermanentRestore** parameter or set it to `false`.
    property temporary_restore_days : Int32 | Nil

    # Indicates whether to permanently restore an archived snapshot. To permanently restore an
    # archived snapshot, specify `true` and omit the
    # **RestoreSnapshotTierRequest$TemporaryRestoreDays** parameter.
    property permanent_restore : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @snapshot_id : String,
      @temporary_restore_days : Int32 | Nil = nil,
      @permanent_restore : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SnapshotId", @snapshot_id}

      if value = @temporary_restore_days
        params << {"#{prefix}TemporaryRestoreDays", value.to_s}
      end

      if value = @permanent_restore
        params << {"#{prefix}PermanentRestore", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SnapshotId']")).not_nil!,
        temporary_restore_days: Core::XMLValue.i32(node.xpath_node("*[local-name()='TemporaryRestoreDays']")),
        permanent_restore: Core::XMLValue.bool(node.xpath_node("*[local-name()='PermanentRestore']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@snapshot_id, @temporary_restore_days, @permanent_restore, @dry_run)
  end
end
