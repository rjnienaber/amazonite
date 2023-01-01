private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class InstanceAssociationStatusInfo
    include JSON::Serializable

    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    @[JSON::Field(key: "ExecutionDate", converter: Core::AWSEpochConverter)]
    property execution_date : Time | Nil

    @[JSON::Field(key: "Status")]
    property status : String | Nil

    @[JSON::Field(key: "DetailedStatus")]
    property detailed_status : String | Nil

    @[JSON::Field(key: "ExecutionSummary")]
    property execution_summary : String | Nil

    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    @[JSON::Field(key: "OutputUrl")]
    property output_url : InstanceAssociationOutputUrl | Nil

    @[JSON::Field(key: "AssociationName")]
    property association_name : String | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @association_version : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @execution_date : Time | Nil = nil,
      @status : String | Nil = nil,
      @detailed_status : String | Nil = nil,
      @execution_summary : String | Nil = nil,
      @error_code : String | Nil = nil,
      @output_url : InstanceAssociationOutputUrl | Nil = nil,
      @association_name : String | Nil = nil
    )
    end
  end
end
