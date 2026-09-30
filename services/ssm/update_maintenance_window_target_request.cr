private alias Core = Amazonite::Core

module Amazonite::Ssm
  class UpdateMaintenanceWindowTargetRequest
    include JSON::Serializable

    # The maintenance window ID with which to modify the target.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    # The target ID to modify.
    @[JSON::Field(key: "WindowTargetId")]
    property window_target_id : String

    # The targets to add or replace.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # User-provided value that will be included in any Amazon CloudWatch Events events raised while
    # running tasks for these targets in this maintenance window.
    @[JSON::Field(key: "OwnerInformation")]
    property owner_information : String | Nil

    # A name for the update.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # An optional description for the update.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # If `True`, then all fields that are required by the RegisterTargetWithMaintenanceWindow
    # operation are also required for this API request. Optional fields that aren't specified are set
    # to null.
    @[JSON::Field(key: "Replace")]
    property replace : Bool | Nil

    def initialize(
      @window_id : String,
      @window_target_id : String,
      @targets : Array(Target) | Nil = nil,
      @owner_information : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @replace : Bool | Nil = nil,
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

    def_equals_and_hash(@window_id, @window_target_id, @targets, @owner_information, @name, @description, @replace)
  end
end
