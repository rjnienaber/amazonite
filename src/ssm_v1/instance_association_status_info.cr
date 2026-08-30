private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Status information about the association.
  class InstanceAssociationStatusInfo
    include JSON::Serializable

    # The association ID.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    # The name of the association.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The association document versions.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The version of the association applied to the managed node.
    @[JSON::Field(key: "AssociationVersion")]
    property association_version : String | Nil

    # The managed node ID where the association was created.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    # The date the association ran.
    @[JSON::Field(key: "ExecutionDate", converter: Core::AWSEpochConverter)]
    property execution_date : Time | Nil

    # Status information about the association.
    @[JSON::Field(key: "Status")]
    property status : String | Nil

    # Detailed status information about the association.
    @[JSON::Field(key: "DetailedStatus")]
    property detailed_status : String | Nil

    # Summary information about association execution.
    @[JSON::Field(key: "ExecutionSummary")]
    property execution_summary : String | Nil

    # An error code returned by the request to create the association.
    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    # A URL for an S3 bucket where you want to store the results of this request.
    @[JSON::Field(key: "OutputUrl")]
    property output_url : InstanceAssociationOutputUrl | Nil

    # The name of the association applied to the managed node.
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
      @association_name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@association_id, @name, @document_version, @association_version, @instance_id, @execution_date, @status, @detailed_status, @execution_summary, @error_code, @output_url, @association_name)
  end
end
