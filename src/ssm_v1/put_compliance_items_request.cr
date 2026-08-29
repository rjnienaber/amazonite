private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class PutComplianceItemsRequest
    include JSON::Serializable

    # Specify an ID for this resource. For a managed node, this is the node ID.
    @[JSON::Field(key: "ResourceId")]
    property resource_id : String

    # Specify the type of resource. `ManagedInstance` is currently the only supported resource type.
    @[JSON::Field(key: "ResourceType")]
    property resource_type : String

    # Specify the compliance type. For example, specify Association (for a State Manager association),
    # Patch, or Custom:`string`.
    @[JSON::Field(key: "ComplianceType")]
    property compliance_type : String

    # A summary of the call execution that includes an execution ID, the type of execution (for
    # example, `Command`), and the date/time of the execution using a datetime object that is saved in
    # the following format: `yyyy-MM-dd'T'HH:mm:ss'Z'`
    @[JSON::Field(key: "ExecutionSummary")]
    property execution_summary : ComplianceExecutionSummary

    # Information about the compliance as defined by the resource type. For example, for a patch
    # compliance type, `Items` includes information about the PatchSeverity, Classification, and so
    # on.
    @[JSON::Field(key: "Items")]
    property items : Array(ComplianceItemEntry) = [] of ComplianceItemEntry

    # MD5 or SHA-256 content hash. The content hash is used to determine if existing information
    # should be overwritten or ignored. If the content hashes match, the request to put compliance
    # information is ignored.
    @[JSON::Field(key: "ItemContentHash")]
    property item_content_hash : String | Nil

    # The mode for uploading compliance items. You can specify `COMPLETE` or `PARTIAL`. In `COMPLETE`
    # mode, the system overwrites all existing compliance information for the resource. You must
    # provide a full list of compliance items each time you send the request.
    #
    # In `PARTIAL` mode, the system overwrites compliance information for a specific association. The
    # association must be configured with `SyncCompliance` set to `MANUAL`. By default, all requests
    # use `COMPLETE` mode.
    #
    # This attribute is only valid for association compliance.
    @[JSON::Field(key: "UploadType", converter: AS::ComplianceUploadType)]
    property upload_type : ComplianceUploadType | Nil

    def initialize(
      @resource_id : String,
      @resource_type : String,
      @compliance_type : String,
      @execution_summary : ComplianceExecutionSummary,
      @items : Array(ComplianceItemEntry),
      @item_content_hash : String | Nil = nil,
      @upload_type : ComplianceUploadType | Nil = nil,
    )
    end
  end
end
