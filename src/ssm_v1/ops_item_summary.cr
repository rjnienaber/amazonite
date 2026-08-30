private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # A count of OpsItems.
  class OpsItemSummary
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.
    @[JSON::Field(key: "CreatedBy")]
    property created_by : String | Nil

    # The date and time the OpsItem was created.
    @[JSON::Field(key: "CreatedTime", converter: Core::AWSEpochConverter)]
    property created_time : Time | Nil

    # The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.
    @[JSON::Field(key: "LastModifiedBy")]
    property last_modified_by : String | Nil

    # The date and time the OpsItem was last updated.
    @[JSON::Field(key: "LastModifiedTime", converter: Core::AWSEpochConverter)]
    property last_modified_time : Time | Nil

    # The importance of this OpsItem in relation to other OpsItems in the system.
    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

    # The impacted Amazon Web Services resource.
    @[JSON::Field(key: "Source")]
    property source : String | Nil

    # The OpsItem status.
    @[JSON::Field(key: "Status", converter: AS::OpsItemStatus)]
    property status : OpsItemStatus | Nil

    # The ID of the OpsItem.
    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    # A short heading that describes the nature of the OpsItem and the impacted resource.
    @[JSON::Field(key: "Title")]
    property title : String | Nil

    # Operational data is custom data that provides useful reference details about the OpsItem.
    @[JSON::Field(key: "OperationalData")]
    property operational_data : Hash(String, OpsItemDataValue) | Nil

    # A list of OpsItems by category.
    @[JSON::Field(key: "Category")]
    property category : String | Nil

    # A list of OpsItems by severity.
    @[JSON::Field(key: "Severity")]
    property severity : String | Nil

    # The type of OpsItem. Systems Manager supports the following types of OpsItems:
    #
    # - `/aws/issue`
    #
    # This type of OpsItem is used for default OpsItems created by OpsCenter.
    #
    # - `/aws/changerequest`
    #
    # This type of OpsItem is used by Change Manager for reviewing and approving or rejecting change
    # requests.
    #
    # - `/aws/insight`
    #
    # This type of OpsItem is used by OpsCenter for aggregating and reporting on duplicate OpsItems.
    @[JSON::Field(key: "OpsItemType")]
    property ops_item_type : String | Nil

    # The time a runbook workflow started. Currently reported only for the OpsItem type
    # `/aws/changerequest`.
    @[JSON::Field(key: "ActualStartTime", converter: Core::AWSEpochConverter)]
    property actual_start_time : Time | Nil

    # The time a runbook workflow ended. Currently reported only for the OpsItem type
    # `/aws/changerequest`.
    @[JSON::Field(key: "ActualEndTime", converter: Core::AWSEpochConverter)]
    property actual_end_time : Time | Nil

    # The time specified in a change request for a runbook workflow to start. Currently supported only
    # for the OpsItem type `/aws/changerequest`.
    @[JSON::Field(key: "PlannedStartTime", converter: Core::AWSEpochConverter)]
    property planned_start_time : Time | Nil

    # The time specified in a change request for a runbook workflow to end. Currently supported only
    # for the OpsItem type `/aws/changerequest`.
    @[JSON::Field(key: "PlannedEndTime", converter: Core::AWSEpochConverter)]
    property planned_end_time : Time | Nil

    def initialize(
      @created_by : String | Nil = nil,
      @created_time : Time | Nil = nil,
      @last_modified_by : String | Nil = nil,
      @last_modified_time : Time | Nil = nil,
      @priority : Int32 | Nil = nil,
      @source : String | Nil = nil,
      @status : OpsItemStatus | Nil = nil,
      @ops_item_id : String | Nil = nil,
      @title : String | Nil = nil,
      @operational_data : Hash(String, OpsItemDataValue) | Nil = nil,
      @category : String | Nil = nil,
      @severity : String | Nil = nil,
      @ops_item_type : String | Nil = nil,
      @actual_start_time : Time | Nil = nil,
      @actual_end_time : Time | Nil = nil,
      @planned_start_time : Time | Nil = nil,
      @planned_end_time : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @priority
        raise Core::ValidationError.new("Priority value must be >= 1") if value < 1
        raise Core::ValidationError.new("Priority value must be <= 5") if value > 5
      end

      if value = @source
        raise Core::ValidationError.new("Source length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Source length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Source does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end

      if value = @ops_item_id
        raise Core::ValidationError.new("OpsItemId does not match the required pattern") unless value.matches?(Regex.new("^(oi)-[0-9a-f]{12}$"))
      end

      if value = @title
        raise Core::ValidationError.new("Title length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Title length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Title does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end

      if value = @operational_data
        value.each_value(&.validate!)
      end

      if value = @category
        raise Core::ValidationError.new("Category length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Category length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Category does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end

      if value = @severity
        raise Core::ValidationError.new("Severity length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Severity length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Severity does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end
    end

    def_equals_and_hash(@created_by, @created_time, @last_modified_by, @last_modified_time, @priority, @source, @status, @ops_item_id, @title, @operational_data, @category, @severity, @ops_item_type, @actual_start_time, @actual_end_time, @planned_start_time, @planned_end_time)
  end
end
