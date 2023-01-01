private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class AssociationExecutionTarget
    include JSON::Serializable

    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    @[JSON::Field(key: "ExecutionId")]
    property execution_id : String | Nil

    @[JSON::Field(key: "ResourceId")]
    property resource_id : String | Nil

    @[JSON::Field(key: "ResourceType")]
    property resource_type : String | Nil

    @[JSON::Field(key: "Status")]
    property status : String | Nil

    @[JSON::Field(key: "DetailedStatus")]
    property detailed_status : String | Nil

    @[JSON::Field(key: "LastExecutionDate", converter: Core::AWSEpochConverter)]
    property last_execution_date : Time | Nil

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
      @output_source : OutputSource | Nil = nil
    )
    end
  end
end
