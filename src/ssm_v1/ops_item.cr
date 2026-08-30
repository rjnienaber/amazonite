private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to
  # view, investigate, and remediate operational work items (OpsItems) impacting the performance and
  # health of their Amazon Web Services resources. OpsCenter is integrated with Amazon EventBridge
  # and Amazon CloudWatch. This means you can configure these services to automatically create an
  # OpsItem in OpsCenter when a CloudWatch alarm enters the ALARM state or when EventBridge
  # processes an event from any Amazon Web Services service that publishes events. Configuring
  # Amazon CloudWatch alarms and EventBridge events to automatically create OpsItems allows you to
  # quickly diagnose and remediate issues with Amazon Web Services resources from a single console.
  #
  # To help you diagnose issues, each OpsItem includes contextually relevant information such as the
  # name and ID of the Amazon Web Services resource that generated the OpsItem, alarm or event
  # details, alarm history, and an alarm timeline graph. For the Amazon Web Services resource,
  # OpsCenter aggregates information from Config, CloudTrail logs, and EventBridge, so you don't
  # have to navigate across multiple console pages during your investigation. For more information,
  # see [Amazon Web Services Systems Manager
  # OpsCenter](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html) in the
  # *Amazon Web Services Systems Manager User Guide*.
  class OpsItem
    include JSON::Serializable

    # The ARN of the Amazon Web Services account that created the OpsItem.
    @[JSON::Field(key: "CreatedBy")]
    property created_by : String | Nil

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

    # The date and time the OpsItem was created.
    @[JSON::Field(key: "CreatedTime", converter: Core::AWSEpochConverter)]
    property created_time : Time | Nil

    # The OpsItem description.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The ARN of the Amazon Web Services account that last updated the OpsItem.
    @[JSON::Field(key: "LastModifiedBy")]
    property last_modified_by : String | Nil

    # The date and time the OpsItem was last updated.
    @[JSON::Field(key: "LastModifiedTime", converter: Core::AWSEpochConverter)]
    property last_modified_time : Time | Nil

    # The Amazon Resource Name (ARN) of an Amazon Simple Notification Service (Amazon SNS) topic where
    # notifications are sent when this OpsItem is edited or changed.
    @[JSON::Field(key: "Notifications")]
    property notifications : Array(OpsItemNotification) | Nil

    # The importance of this OpsItem in relation to other OpsItems in the system.
    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

    # One or more OpsItems that share something in common with the current OpsItem. For example,
    # related OpsItems can include OpsItems with similar error messages, impacted resources, or
    # statuses for the impacted resource.
    @[JSON::Field(key: "RelatedOpsItems")]
    property related_ops_items : Array(RelatedOpsItem) | Nil

    # The OpsItem status. For more information, see [Editing OpsItem
    # details](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-working-with-OpsItems-editing-details.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "Status", converter: AS::OpsItemStatus)]
    property status : OpsItemStatus | Nil

    # The ID of the OpsItem.
    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    # The version of this OpsItem. Each time the OpsItem is edited the version number increments by
    # one.
    @[JSON::Field(key: "Version")]
    property version : String | Nil

    # A short heading that describes the nature of the OpsItem and the impacted resource.
    @[JSON::Field(key: "Title")]
    property title : String | Nil

    # The origin of the OpsItem, such as Amazon EC2 or Systems Manager. The impacted resource is a
    # subset of source.
    @[JSON::Field(key: "Source")]
    property source : String | Nil

    # Operational data is custom data that provides useful reference details about the OpsItem. For
    # example, you can specify log files, error strings, license keys, troubleshooting tips, or other
    # relevant data. You enter operational data as key-value pairs. The key has a maximum length of
    # 128 characters. The value has a maximum size of 20 KB.
    #
    # Operational data keys *can't* begin with the following: `amazon`, `aws`, `amzn`, `ssm`,
    # `/amazon`, `/aws`, `/amzn`, `/ssm`.
    #
    # You can choose to make the data searchable by other users in the account or you can restrict
    # search access. Searchable data means that all users with access to the OpsItem Overview page (as
    # provided by the DescribeOpsItems API operation) can view and search on the specified data.
    # Operational data that isn't searchable is only viewable by users who have access to the OpsItem
    # (as provided by the GetOpsItem API operation).
    #
    # Use the `/aws/resources` key in OperationalData to specify a related resource in the request.
    # Use the `/aws/automations` key in OperationalData to associate an Automation runbook with the
    # OpsItem. To view Amazon Web Services CLI example commands that use these keys, see [Creating
    # OpsItems
    # manually](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-manually-create-OpsItems.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "OperationalData")]
    property operational_data : Hash(String, OpsItemDataValue) | Nil

    # An OpsItem category. Category options include: Availability, Cost, Performance, Recovery,
    # Security.
    @[JSON::Field(key: "Category")]
    property category : String | Nil

    # The severity of the OpsItem. Severity options range from 1 to 4.
    @[JSON::Field(key: "Severity")]
    property severity : String | Nil

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

    # The OpsItem Amazon Resource Name (ARN).
    @[JSON::Field(key: "OpsItemArn")]
    property ops_item_arn : String | Nil

    def initialize(
      @created_by : String | Nil = nil,
      @ops_item_type : String | Nil = nil,
      @created_time : Time | Nil = nil,
      @description : String | Nil = nil,
      @last_modified_by : String | Nil = nil,
      @last_modified_time : Time | Nil = nil,
      @notifications : Array(OpsItemNotification) | Nil = nil,
      @priority : Int32 | Nil = nil,
      @related_ops_items : Array(RelatedOpsItem) | Nil = nil,
      @status : OpsItemStatus | Nil = nil,
      @ops_item_id : String | Nil = nil,
      @version : String | Nil = nil,
      @title : String | Nil = nil,
      @source : String | Nil = nil,
      @operational_data : Hash(String, OpsItemDataValue) | Nil = nil,
      @category : String | Nil = nil,
      @severity : String | Nil = nil,
      @actual_start_time : Time | Nil = nil,
      @actual_end_time : Time | Nil = nil,
      @planned_start_time : Time | Nil = nil,
      @planned_end_time : Time | Nil = nil,
      @ops_item_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new("^[\\s\\S]*\\S[\\s\\S]*$"))
      end

      if value = @notifications
        value.each(&.validate!)
      end

      if value = @priority
        raise Core::ValidationError.new("Priority value must be >= 1") if value < 1
        raise Core::ValidationError.new("Priority value must be <= 5") if value > 5
      end

      if value = @related_ops_items
        value.each(&.validate!)
      end

      if value = @ops_item_id
        raise Core::ValidationError.new("OpsItemId does not match the required pattern") unless value.matches?(Regex.new("^(oi)-[0-9a-f]{12}$"))
      end

      if value = @title
        raise Core::ValidationError.new("Title length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Title length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Title does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end

      if value = @source
        raise Core::ValidationError.new("Source length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Source length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Source does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
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

      if value = @ops_item_arn
        raise Core::ValidationError.new("OpsItemArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("OpsItemArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("OpsItemArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:ssm:[a-z0-9-\\.]{0,63}:[0-9]{12}:opsitem"))
      end
    end

    def_equals_and_hash(@created_by, @ops_item_type, @created_time, @description, @last_modified_by, @last_modified_time, @notifications, @priority, @related_ops_items, @status, @ops_item_id, @version, @title, @source, @operational_data, @category, @severity, @actual_start_time, @actual_end_time, @planned_start_time, @planned_end_time, @ops_item_arn)
  end
end
