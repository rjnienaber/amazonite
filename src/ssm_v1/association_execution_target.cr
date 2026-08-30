private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Includes information about the specified association execution.
  class AssociationExecutionTarget
    include JSON::Serializable

    # The association ID.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    # The association version.
    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    # The execution ID.
    @[JSON::Field(key: "ExecutionId")]
    property execution_id : String | Nil

    # The resource ID, for example, the managed node ID where the association ran.
    @[JSON::Field(key: "ResourceId")]
    property resource_id : String | Nil

    # The resource type, for example, EC2.
    @[JSON::Field(key: "ResourceType")]
    property resource_type : String | Nil

    # The association execution status.
    @[JSON::Field(key: "Status")]
    property status : String | Nil

    # Detailed information about the execution status.
    @[JSON::Field(key: "DetailedStatus")]
    property detailed_status : String | Nil

    # The date of the last execution.
    @[JSON::Field(key: "LastExecutionDate", converter: Core::AWSEpochConverter)]
    property last_execution_date : Time | Nil

    # The location where the association details are saved.
    @[JSON::Field(key: "OutputSource")]
    property output_source : OutputSource | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @association_version : String | Nil = nil,
      @execution_id : String | Nil = nil,
      @resource_id : String | Nil = nil,
      @resource_type : String | Nil = nil,
      @status : String | Nil = nil,
      @detailed_status : String | Nil = nil,
      @last_execution_date : Time | Nil = nil,
      @output_source : OutputSource | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @association_id
        raise Core::ValidationError.new("AssociationId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @association_version
        raise Core::ValidationError.new("AssociationVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST)|([1-9][0-9]*)$"))
      end

      if value = @execution_id
        raise Core::ValidationError.new("ExecutionId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @resource_id
        raise Core::ValidationError.new("ResourceId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceId length must be <= 100") if value.size > 100
      end

      if value = @resource_type
        raise Core::ValidationError.new("ResourceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceType length must be <= 50") if value.size > 50
      end

      if value = @output_source
        value.validate!
      end
    end

    def_equals_and_hash(@association_id, @association_version, @execution_id, @resource_id, @resource_type, @status, @detailed_status, @last_execution_date, @output_source)
  end
end
