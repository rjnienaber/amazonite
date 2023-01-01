private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class PutComplianceItemsRequest
    include JSON::Serializable

    @[JSON::Field(key: "ResourceId")]
    property resource_id : String

    @[JSON::Field(key: "ResourceType")]
    property resource_type : String

    @[JSON::Field(key: "ComplianceType")]
    property compliance_type : String

    @[JSON::Field(key: "ExecutionSummary")]
    property execution_summary : ComplianceExecutionSummary

    @[JSON::Field(key: "Items")]
    property items : Array(ComplianceItemEntry)

    @[JSON::Field(key: "ItemContentHash")]
    property item_content_hash : String | Nil

    @[JSON::Field(key: "UploadType", converter: AS::ComplianceUploadType)]
    property upload_type : ComplianceUploadType | Nil

    def initialize(
      @resource_id : String,
      @resource_type : String,
      @compliance_type : String,
      @execution_summary : ComplianceExecutionSummary,
      @items : Array(ComplianceItemEntry),
      @item_content_hash : String | Nil = nil,
      @upload_type : ComplianceUploadType | Nil = nil
    )
    end
  end
end
