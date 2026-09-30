private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes fast snapshot restores that were successfully enabled.
  class EnableFastSnapshotRestoreSuccessItem
    # The ID of the snapshot.
    property snapshot_id : String | Nil

    # The Availability Zone.
    property availability_zone : String | Nil

    # The ID of the Availability Zone.
    property availability_zone_id : String | Nil

    # The state of fast snapshot restores.
    property state : FastSnapshotRestoreStateCode | Nil

    # The reason for the state transition. The possible values are as follows:
    #
    # - `Client.UserInitiated` - The state successfully transitioned to `enabling` or `disabling`.
    #
    # - `Client.UserInitiated - Lifecycle state transition` - The state successfully transitioned to
    # `optimizing`, `enabled`, or `disabled`.
    property state_transition_reason : String | Nil

    # The ID of the Amazon Web Services account that enabled fast snapshot restores on the snapshot.
    property owner_id : String | Nil

    # The Amazon Web Services owner alias that enabled fast snapshot restores on the snapshot. This is
    # intended for future use.
    property owner_alias : String | Nil

    # The time at which fast snapshot restores entered the `enabling` state.
    property enabling_time : Time | Nil

    # The time at which fast snapshot restores entered the `optimizing` state.
    property optimizing_time : Time | Nil

    # The time at which fast snapshot restores entered the `enabled` state.
    property enabled_time : Time | Nil

    # The time at which fast snapshot restores entered the `disabling` state.
    property disabling_time : Time | Nil

    # The time at which fast snapshot restores entered the `disabled` state.
    property disabled_time : Time | Nil

    def initialize(
      @snapshot_id : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @state : FastSnapshotRestoreStateCode | Nil = nil,
      @state_transition_reason : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @owner_alias : String | Nil = nil,
      @enabling_time : Time | Nil = nil,
      @optimizing_time : Time | Nil = nil,
      @enabled_time : Time | Nil = nil,
      @disabling_time : Time | Nil = nil,
      @disabled_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_transition_reason
        params << {"#{prefix}StateTransitionReason", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @owner_alias
        params << {"#{prefix}OwnerAlias", value}
      end

      if value = @enabling_time
        params << {"#{prefix}EnablingTime", Core::QueryValue.time(value)}
      end

      if value = @optimizing_time
        params << {"#{prefix}OptimizingTime", Core::QueryValue.time(value)}
      end

      if value = @enabled_time
        params << {"#{prefix}EnabledTime", Core::QueryValue.time(value)}
      end

      if value = @disabling_time
        params << {"#{prefix}DisablingTime", Core::QueryValue.time(value)}
      end

      if value = @disabled_time
        params << {"#{prefix}DisabledTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::FastSnapshotRestoreStateCode.from_json_object_key?(n.content) : nil,
        state_transition_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='stateTransitionReason']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        owner_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerAlias']")),
        enabling_time: Core::XMLValue.time(node.xpath_node("*[local-name()='enablingTime']")),
        optimizing_time: Core::XMLValue.time(node.xpath_node("*[local-name()='optimizingTime']")),
        enabled_time: Core::XMLValue.time(node.xpath_node("*[local-name()='enabledTime']")),
        disabling_time: Core::XMLValue.time(node.xpath_node("*[local-name()='disablingTime']")),
        disabled_time: Core::XMLValue.time(node.xpath_node("*[local-name()='disabledTime']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@snapshot_id, @availability_zone, @availability_zone_id, @state, @state_transition_reason, @owner_id, @owner_alias, @enabling_time, @optimizing_time, @enabled_time, @disabling_time, @disabled_time)
  end
end
