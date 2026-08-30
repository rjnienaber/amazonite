private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @resource_id
        raise Core::ValidationError.new("ResourceId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceId length must be <= 100") if value.size > 100
      end

      if value = @resource_type
        raise Core::ValidationError.new("ResourceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceType length must be <= 50") if value.size > 50
      end

      if value = @compliance_type
        raise Core::ValidationError.new("ComplianceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ComplianceType length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("ComplianceType does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9_\\-]\\w+|Custom:[a-zA-Z0-9_\\-]\\w+$"))
      end

      if value = @execution_summary
        value.validate!
      end

      if value = @items
        raise Core::ValidationError.new("Items must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Items must have at most 10000 item(s)") if value.size > 10000
        value.each(&.validate!)
      end

      if value = @item_content_hash
        raise Core::ValidationError.new("ItemContentHash length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ItemContentHash length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@resource_id, @resource_type, @compliance_type, @execution_summary, @items, @item_content_hash, @upload_type)
  end
end
