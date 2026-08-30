private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Describes an association of a Amazon Web Services Systems Manager document (SSM document) and a
  # managed node.
  class Association
    include JSON::Serializable

    # The name of the SSM document.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The managed node ID.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    # The ID created by the system when you create an association. An association is a binding between
    # a document and a set of targets with a schedule.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    # The association version.
    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    # The version of the document used in the association. If you change a document version for a
    # State Manager association, Systems Manager immediately runs the association unless you
    # previously specifed the `apply-only-at-cron-interval` parameter.
    #
    # State Manager doesn't support running associations that use a new version of a document if that
    # document is shared from another account. State Manager always runs the `default` version of a
    # document if shared from another account, even though the Systems Manager console shows that a
    # new version was processed. If you want to run an association using a new version of a document
    # shared form another account, you must set the document version to `default`.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The managed nodes targeted by the request to create an association. You can target all managed
    # nodes in an Amazon Web Services account by specifying the `InstanceIds` key with a value of `*`.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) | Nil

    # The date on which the association was last run.
    @[JSON::Field(key: "LastExecutionDate", converter: Core::AWSEpochConverter)]
    property last_execution_date : Time | Nil

    # Information about the association.
    @[JSON::Field(key: "Overview")]
    property overview : AssociationOverview | Nil

    # A cron expression that specifies a schedule when the association runs. The schedule runs in
    # Coordinated Universal Time (UTC).
    @[JSON::Field(key: "ScheduleExpression")]
    property schedule_expression : String | Nil

    # The association name.
    @[JSON::Field(key: "AssociationName")]
    property association_name : String | Nil

    # Number of days to wait after the scheduled day to run an association.
    @[JSON::Field(key: "ScheduleOffset")]
    property schedule_offset : Int32 | Nil

    # The number of hours that an association can run on specified targets. After the resulting cutoff
    # time passes, associations that are currently running are cancelled, and no pending executions
    # are started on remaining targets.
    @[JSON::Field(key: "Duration")]
    property duration : Int32 | Nil

    # A key-value mapping of document parameters to target resources. Both Targets and TargetMaps
    # can't be specified together.
    @[JSON::Field(key: "TargetMaps")]
    property target_maps : Array(Hash(String, Array(String))) | Nil

    def initialize(
      @name : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @association_id : String | Nil = nil,
      @association_version : String | Nil = nil,
      @document_version : String | Nil = nil,
      @targets : Array(Target) | Nil = nil,
      @last_execution_date : Time | Nil = nil,
      @overview : AssociationOverview | Nil = nil,
      @schedule_expression : String | Nil = nil,
      @association_name : String | Nil = nil,
      @schedule_offset : Int32 | Nil = nil,
      @duration : Int32 | Nil = nil,
      @target_maps : Array(Hash(String, Array(String))) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.:/]{3,128}$"))
      end

      if value = @instance_id
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @association_id
        raise Core::ValidationError.new("AssociationId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @association_version
        raise Core::ValidationError.new("AssociationVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST)|([1-9][0-9]*)$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @targets
        raise Core::ValidationError.new("Targets must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Targets must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @overview
        value.validate!
      end

      if value = @schedule_expression
        raise Core::ValidationError.new("ScheduleExpression length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ScheduleExpression length must be <= 256") if value.size > 256
      end

      if value = @association_name
        raise Core::ValidationError.new("AssociationName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @schedule_offset
        raise Core::ValidationError.new("ScheduleOffset value must be >= 1") if value < 1
        raise Core::ValidationError.new("ScheduleOffset value must be <= 6") if value > 6
      end

      if value = @duration
        raise Core::ValidationError.new("Duration value must be >= 1") if value < 1
        raise Core::ValidationError.new("Duration value must be <= 24") if value > 24
      end

      if value = @target_maps
        raise Core::ValidationError.new("TargetMaps must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("TargetMaps must have at most 300 item(s)") if value.size > 300
      end
    end

    def_equals_and_hash(@name, @instance_id, @association_id, @association_version, @document_version, @targets, @last_execution_date, @overview, @schedule_expression, @association_name, @schedule_offset, @duration, @target_maps)
  end
end
