private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The maintenance options for the instance.
  class InstanceMaintenanceOptions
    # Provides information on the current automatic recovery behavior of your instance.
    property auto_recovery : InstanceAutoRecoveryState | Nil

    # Specifies whether to attempt reboot migration during a user-initiated reboot of an instance that
    # has a scheduled `system-reboot` event:
    #
    # - `default` - Amazon EC2 attempts to migrate the instance to new hardware (reboot migration). If
    # successful, the `system-reboot` event is cleared. If unsuccessful, an in-place reboot occurs and
    # the event remains scheduled.
    #
    # - `disabled` - Amazon EC2 keeps the instance on the same hardware (in-place reboot). The
    # `system-reboot` event remains scheduled.
    #
    # This setting only applies to supported instances that have a scheduled reboot event. For more
    # information, see [Enable or disable reboot
    # migration](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/schedevents_actions_reboot.html#reboot-migration)
    # in the *Amazon EC2 User Guide*.
    property reboot_migration : InstanceRebootMigrationState | Nil

    def initialize(
      @auto_recovery : InstanceAutoRecoveryState | Nil = nil,
      @reboot_migration : InstanceRebootMigrationState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @auto_recovery
        params << {"#{prefix}AutoRecovery", value.to_json_object_key}
      end

      if value = @reboot_migration
        params << {"#{prefix}RebootMigration", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        auto_recovery: (n = node.xpath_node("*[local-name()='autoRecovery']")) ? AEC::InstanceAutoRecoveryState.from_json_object_key?(n.content) : nil,
        reboot_migration: (n = node.xpath_node("*[local-name()='rebootMigration']")) ? AEC::InstanceRebootMigrationState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@auto_recovery, @reboot_migration)
  end
end
