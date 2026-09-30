private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class LockSnapshotRequest
    # The ID of the snapshot to lock.
    property snapshot_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The mode in which to lock the snapshot. Specify one of the following:
    #
    # - `governance` - Locks the snapshot in governance mode. Snapshots locked in governance mode
    # can't be deleted until one of the following conditions are met:
    #
    # - The lock duration expires.
    #
    # - The snapshot is unlocked by a user with the appropriate permissions.
    #
    # Users with the appropriate IAM permissions can unlock the snapshot, increase or decrease the
    # lock duration, and change the lock mode to `compliance` at any time.
    #
    # If you lock a snapshot in `governance` mode, omit ** CoolOffPeriod**.
    #
    # - `compliance` - Locks the snapshot in compliance mode. Snapshots locked in compliance mode
    # can't be unlocked by any user. They can be deleted only after the lock duration expires. Users
    # can't decrease the lock duration or change the lock mode to `governance`. However, users with
    # appropriate IAM permissions can increase the lock duration at any time.
    #
    # If you lock a snapshot in `compliance` mode, you can optionally specify **CoolOffPeriod**.
    property lock_mode : LockMode

    # The cooling-off period during which you can unlock the snapshot or modify the lock settings
    # after locking the snapshot in compliance mode, in hours. After the cooling-off period expires,
    # you can't unlock or delete the snapshot, decrease the lock duration, or change the lock mode.
    # You can increase the lock duration after the cooling-off period expires.
    #
    # The cooling-off period is optional when locking a snapshot in compliance mode. If you are
    # locking the snapshot in governance mode, omit this parameter.
    #
    # To lock the snapshot in compliance mode immediately without a cooling-off period, omit this
    # parameter.
    #
    # If you are extending the lock duration for a snapshot that is locked in compliance mode after
    # the cooling-off period has expired, omit this parameter. If you specify a cooling-period in a
    # such a request, the request fails.
    #
    # Allowed values: Min 1, max 72.
    property cool_off_period : Int32 | Nil

    # The period of time for which to lock the snapshot, in days. The snapshot lock will automatically
    # expire after this period lapses.
    #
    # You must specify either this parameter or **ExpirationDate**, but not both.
    #
    # Allowed values: Min: 1, max 36500
    property lock_duration : Int32 | Nil

    # The date and time at which the snapshot lock is to automatically expire, in the UTC time zone
    # (`YYYY-MM-DDThh:mm:ss.sssZ`).
    #
    # You must specify either this parameter or **LockDuration**, but not both.
    property expiration_date : Time | Nil

    def initialize(
      @snapshot_id : String,
      @lock_mode : LockMode,
      @dry_run : Bool | Nil = nil,
      @cool_off_period : Int32 | Nil = nil,
      @lock_duration : Int32 | Nil = nil,
      @expiration_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SnapshotId", @snapshot_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}LockMode", @lock_mode.to_json_object_key}

      if value = @cool_off_period
        params << {"#{prefix}CoolOffPeriod", value.to_s}
      end

      if value = @lock_duration
        params << {"#{prefix}LockDuration", value.to_s}
      end

      if value = @expiration_date
        params << {"#{prefix}ExpirationDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SnapshotId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        lock_mode: ((n = node.xpath_node("*[local-name()='LockMode']")) ? AEC::LockMode.from_json_object_key?(n.content) : nil).not_nil!,
        cool_off_period: Core::XMLValue.i32(node.xpath_node("*[local-name()='CoolOffPeriod']")),
        lock_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='LockDuration']")),
        expiration_date: Core::XMLValue.time(node.xpath_node("*[local-name()='ExpirationDate']")),
      )
    end

    def validate! : Nil
      if value = @cool_off_period
        raise Core::ValidationError.new("CoolOffPeriod value must be >= 1") if value < 1
        raise Core::ValidationError.new("CoolOffPeriod value must be <= 72") if value > 72
      end

      if value = @lock_duration
        raise Core::ValidationError.new("LockDuration value must be >= 1") if value < 1
        raise Core::ValidationError.new("LockDuration value must be <= 36500") if value > 36500
      end
    end

    def_equals_and_hash(@snapshot_id, @dry_run, @lock_mode, @cool_off_period, @lock_duration, @expiration_date)
  end
end
