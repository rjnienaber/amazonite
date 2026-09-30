private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceMaintenanceOptionsRequest
    # The ID of the instance.
    property instance_id : String

    # Disables the automatic recovery behavior of your instance or sets it to default.
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

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @instance_id : String,
      @auto_recovery : InstanceAutoRecoveryState | Nil = nil,
      @reboot_migration : InstanceRebootMigrationState | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceId", @instance_id}

      if value = @auto_recovery
        params << {"#{prefix}AutoRecovery", value.to_json_object_key}
      end

      if value = @reboot_migration
        params << {"#{prefix}RebootMigration", value.to_json_object_key}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        auto_recovery: (n = node.xpath_node("*[local-name()='AutoRecovery']")) ? AEC::InstanceAutoRecoveryState.from_json_object_key?(n.content) : nil,
        reboot_migration: (n = node.xpath_node("*[local-name()='RebootMigration']")) ? AEC::InstanceRebootMigrationState.from_json_object_key?(n.content) : nil,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @auto_recovery, @reboot_migration, @dry_run)
  end
end
