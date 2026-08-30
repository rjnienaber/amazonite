private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class CreateOpsItemRequest
    include JSON::Serializable

    # User-defined text that contains information about the OpsItem, in Markdown format.
    #
    # Provide enough information so that users viewing this OpsItem for the first time understand the
    # issue.
    @[JSON::Field(key: "Description")]
    property description : String

    # The type of OpsItem to create. Systems Manager supports the following types of OpsItems:
    #
    # - `/aws/issue`
    #
    # This type of OpsItem is used for default OpsItems created by OpsCenter.
    #
    # - `/aws/insight`
    #
    # This type of OpsItem is used by OpsCenter for aggregating and reporting on duplicate OpsItems.
    #
    # - `/aws/changerequest`
    #
    # This type of OpsItem is used by Change Manager for reviewing and approving or rejecting change
    # requests.
    #
    # Amazon Web Services Systems Manager Change Manager is no longer open to new customers. Existing
    # customers can continue to use the service as normal. For more information, see [Amazon Web
    # Services Systems Manager Change Manager availability
    # change](https://docs.aws.amazon.com/systems-manager/latest/userguide/change-manager-availability-change.html).
    @[JSON::Field(key: "OpsItemType")]
    property ops_item_type : String | Nil

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
    # OpsItem. To view Amazon Web Services CLI example commands that use these keys, see [Create
    # OpsItems
    # manually](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-manually-create-OpsItems.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "OperationalData")]
    property operational_data : Hash(String, OpsItemDataValue) | Nil

    # The Amazon Resource Name (ARN) of an SNS topic where notifications are sent when this OpsItem is
    # edited or changed.
    @[JSON::Field(key: "Notifications")]
    property notifications : Array(OpsItemNotification) | Nil

    # The importance of this OpsItem in relation to other OpsItems in the system.
    @[JSON::Field(key: "Priority")]
    property priority : Int32 | Nil

    # One or more OpsItems that share something in common with the current OpsItems. For example,
    # related OpsItems can include OpsItems with similar error messages, impacted resources, or
    # statuses for the impacted resource.
    @[JSON::Field(key: "RelatedOpsItems")]
    property related_ops_items : Array(RelatedOpsItem) | Nil

    # The origin of the OpsItem, such as Amazon EC2 or Systems Manager.
    #
    # The source name can't contain the following strings: `aws`, `amazon`, and `amzn`.
    @[JSON::Field(key: "Source")]
    property source : String

    # A short heading that describes the nature of the OpsItem and the impacted resource.
    @[JSON::Field(key: "Title")]
    property title : String

    # Optional metadata that you assign to a resource.
    #
    # Tags use a key-value pair. For example:
    #
    # `Key=Department,Value=Finance`
    #
    # To add tags to a new OpsItem, a user must have IAM permissions for both the `ssm:CreateOpsItems`
    # operation and the `ssm:AddTagsToResource` operation. To add tags to an existing OpsItem, use the
    # AddTagsToResource operation.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # Specify a category to assign to an OpsItem.
    @[JSON::Field(key: "Category")]
    property category : String | Nil

    # Specify a severity to assign to an OpsItem.
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

    # The target Amazon Web Services account where you want to create an OpsItem. To make this call,
    # your account must be configured to work with OpsItems across accounts. For more information, see
    # [Set up
    # OpsCenter](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html) in
    # the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "AccountId")]
    property account_id : String | Nil

    def initialize(
      @description : String,
      @source : String,
      @title : String,
      @ops_item_type : String | Nil = nil,
      @operational_data : Hash(String, OpsItemDataValue) | Nil = nil,
      @notifications : Array(OpsItemNotification) | Nil = nil,
      @priority : Int32 | Nil = nil,
      @related_ops_items : Array(RelatedOpsItem) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @category : String | Nil = nil,
      @severity : String | Nil = nil,
      @actual_start_time : Time | Nil = nil,
      @actual_end_time : Time | Nil = nil,
      @planned_start_time : Time | Nil = nil,
      @planned_end_time : Time | Nil = nil,
      @account_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@description, @ops_item_type, @operational_data, @notifications, @priority, @related_ops_items, @source, @title, @tags, @category, @severity, @actual_start_time, @actual_end_time, @planned_start_time, @planned_end_time, @account_id)
  end
end
