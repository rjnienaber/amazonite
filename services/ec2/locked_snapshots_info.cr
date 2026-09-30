private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a locked snapshot.
  class LockedSnapshotsInfo
    # The account ID of the Amazon Web Services account that owns the snapshot.
    property owner_id : String | Nil

    # The ID of the snapshot.
    property snapshot_id : String | Nil

    # The state of the snapshot lock. Valid states include:
    #
    # - `compliance-cooloff` - The snapshot has been locked in compliance mode but it is still within
    # the cooling-off period. The snapshot can't be deleted, but it can be unlocked and the lock
    # settings can be modified by users with appropriate permissions.
    #
    # - `governance` - The snapshot is locked in governance mode. The snapshot can't be deleted, but
    # it can be unlocked and the lock settings can be modified by users with appropriate permissions.
    #
    # - `compliance` - The snapshot is locked in compliance mode and the cooling-off period has
    # expired. The snapshot can't be unlocked or deleted. The lock duration can only be increased by
    # users with appropriate permissions.
    #
    # - `expired` - The snapshot was locked in compliance or governance mode but the lock duration has
    # expired. The snapshot is not locked and can be deleted.
    property lock_state : LockState | Nil

    # The period of time for which the snapshot is locked, in days.
    property lock_duration : Int32 | Nil

    # The compliance mode cooling-off period, in hours.
    property cool_off_period : Int32 | Nil

    # The date and time at which the compliance mode cooling-off period expires, in the UTC time zone
    # (`YYYY-MM-DDThh:mm:ss.sssZ`).
    property cool_off_period_expires_on : Time | Nil

    # The date and time at which the snapshot was locked, in the UTC time zone
    # (`YYYY-MM-DDThh:mm:ss.sssZ`).
    property lock_created_on : Time | Nil

    # The date and time at which the lock duration started, in the UTC time zone
    # (`YYYY-MM-DDThh:mm:ss.sssZ`).
    #
    # If you lock a snapshot that is in the `pending` state, the lock duration starts only once the
    # snapshot enters the `completed` state.
    property lock_duration_start_time : Time | Nil

    # The date and time at which the lock will expire, in the UTC time zone
    # (`YYYY-MM-DDThh:mm:ss.sssZ`).
    property lock_expires_on : Time | Nil

    def initialize(
      @owner_id : String | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @lock_state : LockState | Nil = nil,
      @lock_duration : Int32 | Nil = nil,
      @cool_off_period : Int32 | Nil = nil,
      @cool_off_period_expires_on : Time | Nil = nil,
      @lock_created_on : Time | Nil = nil,
      @lock_duration_start_time : Time | Nil = nil,
      @lock_expires_on : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @lock_state
        params << {"#{prefix}LockState", value.to_json_object_key}
      end

      if value = @lock_duration
        params << {"#{prefix}LockDuration", value.to_s}
      end

      if value = @cool_off_period
        params << {"#{prefix}CoolOffPeriod", value.to_s}
      end

      if value = @cool_off_period_expires_on
        params << {"#{prefix}CoolOffPeriodExpiresOn", Core::QueryValue.time(value)}
      end

      if value = @lock_created_on
        params << {"#{prefix}LockCreatedOn", Core::QueryValue.time(value)}
      end

      if value = @lock_duration_start_time
        params << {"#{prefix}LockDurationStartTime", Core::QueryValue.time(value)}
      end

      if value = @lock_expires_on
        params << {"#{prefix}LockExpiresOn", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        lock_state: (n = node.xpath_node("*[local-name()='lockState']")) ? AEC::LockState.from_json_object_key?(n.content) : nil,
        lock_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='lockDuration']")),
        cool_off_period: Core::XMLValue.i32(node.xpath_node("*[local-name()='coolOffPeriod']")),
        cool_off_period_expires_on: Core::XMLValue.time(node.xpath_node("*[local-name()='coolOffPeriodExpiresOn']")),
        lock_created_on: Core::XMLValue.time(node.xpath_node("*[local-name()='lockCreatedOn']")),
        lock_duration_start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='lockDurationStartTime']")),
        lock_expires_on: Core::XMLValue.time(node.xpath_node("*[local-name()='lockExpiresOn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@owner_id, @snapshot_id, @lock_state, @lock_duration, @cool_off_period, @cool_off_period_expires_on, @lock_created_on, @lock_duration_start_time, @lock_expires_on)
  end
end
