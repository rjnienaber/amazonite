private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # The target registered with the maintenance window.
  class MaintenanceWindowTarget
    include JSON::Serializable

    # The ID of the maintenance window to register the target with.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The ID of the target.
    @[JSON::Field(key: "WindowTargetId")]
    property window_target_id : String | Nil

    # The type of target that is being registered with the maintenance window.
    @[JSON::Field(key: "ResourceType", converter: AS::MaintenanceWindowResourceType)]
    property resource_type : MaintenanceWindowResourceType | Nil

    # The targets, either managed nodes or tags.
    #
    # Specify managed nodes using the following format:
    #
    # `Key=instanceids,Values=,`
    #
    # Tags are specified using the following format:
    #
    # `Key=,Values=`.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # A user-provided value that will be included in any Amazon CloudWatch Events events that are
    # raised while running tasks for these targets in this maintenance window.
    @[JSON::Field(key: "OwnerInformation")]
    property owner_information : String | Nil

    # The name for the maintenance window target.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # A description for the target.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @window_target_id : String | Nil = nil,
      @resource_type : MaintenanceWindowResourceType | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @owner_information : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @window_id
        raise Core::ValidationError.new("WindowId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("WindowId length must be <= 20") if value.size > 20
        raise Core::ValidationError.new("WindowId does not match the required pattern") unless value.matches?(Regex.new("^mw-[0-9a-f]{17}$"))
      end

      if value = @window_target_id
        raise Core::ValidationError.new("WindowTargetId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("WindowTargetId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("WindowTargetId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{12}$"))
      end

      if value = @targets
        raise Core::ValidationError.new("Targets must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Targets must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @owner_information
        raise Core::ValidationError.new("OwnerInformation length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OwnerInformation length must be <= 128") if value.size > 128
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("Name length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@window_id, @window_target_id, @resource_type, @targets, @owner_information, @name, @description)
  end
end
