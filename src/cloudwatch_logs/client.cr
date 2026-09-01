private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class Client < Core::Client
    Log               = ::Log.for("amazonite.cloudwatch_logs.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("Logs_20140328", "logs", "1.1", EXCEPTION_FACTORY, config)
    end

    # Associates the specified KMS key with either one log group in the account, or with all stored
    # CloudWatch Logs query insights results in the account.
    #
    # When you use `AssociateKmsKey`, you specify either the `logGroupName` parameter or the
    # `resourceIdentifier` parameter. You can't specify both of those parameters in the same
    # operation.
    #
    # - Specify the `logGroupName` parameter to cause log events ingested into that log group to be
    # encrypted with that key. Only the log events ingested after the key is associated are encrypted
    # with that key.
    #
    # Associating a KMS key with a log group overrides any existing associations between the log group
    # and a KMS key. After a KMS key is associated with a log group, all newly ingested data for the
    # log group is encrypted using the KMS key. This association is stored as long as the data
    # encrypted with the KMS key is still within CloudWatch Logs. This enables CloudWatch Logs to
    # decrypt this data whenever it is requested.
    #
    # Associating a key with a log group does not cause the results of queries of that log group to be
    # encrypted with that key. To have query results encrypted with a KMS key, you must use an
    # `AssociateKmsKey` operation with the `resourceIdentifier` parameter that specifies a
    # `query-result` resource.
    #
    # - Specify the `resourceIdentifier` parameter with a `query-result` resource, to use that key to
    # encrypt the stored results of all future
    # [StartQuery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html)
    # operations in the account. The response from a
    # [GetQueryResults](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html)
    # operation will still return the query results in plain text.
    #
    # Even if you have not associated a key with your query results, the query results are encrypted
    # when stored, using the default CloudWatch Logs method.
    #
    # If you run a query from a monitoring account that queries logs in a source account, the query
    # results key from the monitoring account, if any, is used.
    #
    # If you delete the key that is used to encrypt log events or log group query results, then all
    # the associated stored log events or query results that were encrypted with that key will be
    # unencryptable and unusable.
    #
    # CloudWatch Logs supports only symmetric KMS keys. Do not associate an asymmetric KMS key with
    # your log group or query results. For more information, see [Using Symmetric and Asymmetric
    # Keys](https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html).
    #
    # It can take up to 5 minutes for this operation to take effect.
    #
    # If you attempt to associate a KMS key with a log group but the KMS key does not exist or the KMS
    # key is disabled, you receive an `InvalidParameterException` error.
    def associate_kms_key(input : ACWL::AssociateKmsKeyRequest) : Core::Response
      Log.info { "performing 'AssociateKmsKey' operation" }
      input.validate! if config.validate_input?
      response = post("AssociateKmsKey", "/", input.to_json)
      Core::Response.new(response)
    end

    # Associates a data source with an S3 Table Integration for query access in the 'logs' namespace.
    # This enables querying log data using analytics engines that support Iceberg such as Amazon
    # Athena, Amazon Redshift, and Apache Spark.
    def associate_source_to_s3_table_integration(input : ACWL::AssociateSourceToS3TableIntegrationRequest) : Core::ParsedResponse(ACWL::AssociateSourceToS3TableIntegrationResponse)
      Log.info { "performing 'AssociateSourceToS3TableIntegration' operation" }
      input.validate! if config.validate_input?
      response = post("AssociateSourceToS3TableIntegration", "/", input.to_json)
      Core::ParsedResponse(ACWL::AssociateSourceToS3TableIntegrationResponse).new(response)
    end

    # Cancels the specified export task.
    #
    # The task must be in the `PENDING` or `RUNNING` state.
    def cancel_export_task(input : ACWL::CancelExportTaskRequest) : Core::Response
      Log.info { "performing 'CancelExportTask' operation" }
      input.validate! if config.validate_input?
      response = post("CancelExportTask", "/", input.to_json)
      Core::Response.new(response)
    end

    # Cancels an active import task and stops importing data from the CloudTrail Lake Event Data
    # Store.
    def cancel_import_task(input : ACWL::CancelImportTaskRequest) : Core::ParsedResponse(ACWL::CancelImportTaskResponse)
      Log.info { "performing 'CancelImportTask' operation" }
      input.validate! if config.validate_input?
      response = post("CancelImportTask", "/", input.to_json)
      Core::ParsedResponse(ACWL::CancelImportTaskResponse).new(response)
    end

    # Creates a *delivery*. A delivery is a connection between a logical *delivery source* and a
    # logical *delivery destination* that you have already created.
    #
    # Only some Amazon Web Services services support being configured as a delivery source using this
    # operation. These services are listed as **Supported [V2 Permissions]** in the table at [Enabling
    # logging from Amazon Web Services
    # services.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html)
    #
    # A delivery destination can represent a log group in CloudWatch Logs, an Amazon S3 bucket, a
    # delivery stream in Firehose, or X-Ray.
    #
    # To configure logs delivery between a supported Amazon Web Services service and a destination,
    # you must do the following:
    #
    # - Create a delivery source, which is a logical object that represents the resource that is
    # actually sending the logs. For more information, see
    # [PutDeliverySource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html).
    #
    # - Create a *delivery destination*, which is a logical object that represents the actual delivery
    # destination. For more information, see
    # [PutDeliveryDestination](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html).
    #
    # - If you are delivering logs cross-account, you must use
    # [PutDeliveryDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html)
    # in the destination account to assign an IAM policy to the destination. This policy allows
    # delivery to that destination.
    #
    # - Use `CreateDelivery` to create a *delivery* by pairing exactly one delivery source and one
    # delivery destination.
    #
    # You can configure a single delivery source to send logs to multiple destinations by creating
    # multiple deliveries. You can also create multiple deliveries to configure multiple delivery
    # sources to send logs to the same delivery destination.
    #
    # To update an existing delivery configuration, use
    # [UpdateDeliveryConfiguration](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html).
    def create_delivery(input : ACWL::CreateDeliveryRequest) : Core::ParsedResponse(ACWL::CreateDeliveryResponse)
      Log.info { "performing 'CreateDelivery' operation" }
      input.validate! if config.validate_input?
      response = post("CreateDelivery", "/", input.to_json)
      Core::ParsedResponse(ACWL::CreateDeliveryResponse).new(response)
    end

    # Creates an export task so that you can efficiently export data from a log group to an Amazon S3
    # bucket. When you perform a `CreateExportTask` operation, you must use credentials that have
    # permission to write to the S3 bucket that you specify as the destination.
    #
    # Exporting log data to S3 buckets that are encrypted by KMS is supported. Exporting log data to
    # Amazon S3 buckets that have S3 Object Lock enabled with a retention period is also supported.
    #
    # Exporting to S3 buckets that are encrypted with AES-256 is supported.
    #
    # This is an asynchronous call. If all the required information is provided, this operation
    # initiates an export task and responds with the ID of the task. After the task has started, you
    # can use
    # [DescribeExportTasks](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeExportTasks.html)
    # to get the status of the export task. Each account can only have one active (`RUNNING` or
    # `PENDING`) export task at a time. To cancel an export task, use
    # [CancelExportTask](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CancelExportTask.html).
    #
    # You can export logs from multiple log groups or multiple time ranges to the same S3 bucket. To
    # separate log data for each export task, specify a prefix to be used as the Amazon S3 key prefix
    # for all exported objects.
    #
    # We recommend that you don't regularly export to Amazon S3 as a way to continuously archive your
    # logs. For that use case, we instead recommend that you use subscriptions. For more information
    # about subscriptions, see [Real-time processing of log data with
    # subscriptions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Subscriptions.html).
    #
    # Time-based sorting on chunks of log data inside an exported file is not guaranteed. You can sort
    # the exported log field data by using Linux utilities.
    def create_export_task(input : ACWL::CreateExportTaskRequest) : Core::ParsedResponse(ACWL::CreateExportTaskResponse)
      Log.info { "performing 'CreateExportTask' operation" }
      input.validate! if config.validate_input?
      response = post("CreateExportTask", "/", input.to_json)
      Core::ParsedResponse(ACWL::CreateExportTaskResponse).new(response)
    end

    # Starts an import from a data source to CloudWatch Log and creates a managed log group as the
    # destination for the imported data. Currently, [CloudTrail Event Data
    # Store](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-event-data-store.html)
    # is the only supported data source.
    #
    # The import task must satisfy the following constraints:
    #
    # - The specified source must be in an ACTIVE state.
    #
    # - The API caller must have permissions to access the data in the provided source and to perform
    # iam:PassRole on the provided import role which has the same permissions, as described below.
    #
    # - The provided IAM role must trust the "cloudtrail.amazonaws.com" principal and have the
    # following permissions:
    #
    # - cloudtrail:GetEventDataStoreData
    #
    # - logs:CreateLogGroup
    #
    # - logs:CreateLogStream
    #
    # - logs:PutResourcePolicy
    #
    # - (If source has an associated Amazon Web Services KMS Key) kms:Decrypt
    #
    # - (If source has an associated Amazon Web Services KMS Key) kms:GenerateDataKey
    #
    # Example IAM policy for provided import role:
    #
    # `[ { "Effect": "Allow", "Action": "iam:PassRole", "Resource":
    # "arn:aws:iam::123456789012:role/apiCallerCredentials", "Condition": { "StringLike": {
    # "iam:AssociatedResourceARN":
    # "arn:aws:logs:us-east-1:123456789012:log-group:aws/cloudtrail/f1d45bff-d0e3-4868-b5d9-2eb678aa32fb:*"
    # } } }, { "Effect": "Allow", "Action": [ "cloudtrail:GetEventDataStoreData" ], "Resource": [
    # "arn:aws:cloudtrail:us-east-1:123456789012:eventdatastore/f1d45bff-d0e3-4868-b5d9-2eb678aa32fb"
    # ] }, { "Effect": "Allow", "Action": [ "logs:CreateImportTask", "logs:CreateLogGroup",
    # "logs:CreateLogStream", "logs:PutResourcePolicy" ], "Resource": [
    # "arn:aws:logs:us-east-1:123456789012:log-group:/aws/cloudtrail/*" ] }, { "Effect": "Allow",
    # "Action": [ "kms:Decrypt", "kms:GenerateDataKey" ], "Resource": [
    # "arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012" ] } ]`
    #
    # - If the import source has a customer managed key, the "cloudtrail.amazonaws.com" principal
    # needs permissions to perform kms:Decrypt and kms:GenerateDataKey.
    #
    # - There can be no more than 3 active imports per account at a given time.
    #
    # - The startEventTime must be less than or equal to endEventTime.
    #
    # - The data being imported must be within the specified source's retention period.
    def create_import_task(input : ACWL::CreateImportTaskRequest) : Core::ParsedResponse(ACWL::CreateImportTaskResponse)
      Log.info { "performing 'CreateImportTask' operation" }
      input.validate! if config.validate_input?
      response = post("CreateImportTask", "/", input.to_json)
      Core::ParsedResponse(ACWL::CreateImportTaskResponse).new(response)
    end

    # Creates an *anomaly detector* that regularly scans one or more log groups and look for patterns
    # and anomalies in the logs.
    #
    # An anomaly detector can help surface issues by automatically discovering anomalies in your log
    # event traffic. An anomaly detector uses machine learning algorithms to scan log events and find
    # *patterns*. A pattern is a shared text structure that recurs among your log fields. Patterns
    # provide a useful tool for analyzing large sets of logs because a large number of log events can
    # often be compressed into a few patterns.
    #
    # The anomaly detector uses pattern recognition to find `anomalies`, which are unusual log events.
    # It uses the `evaluationFrequency` to compare current log events and patterns with trained
    # baselines.
    #
    # Fields within a pattern are called *tokens*. Fields that vary within a pattern, such as a
    # request ID or timestamp, are referred to as *dynamic tokens* and represented by ``.
    #
    # The following is an example of a pattern:
    #
    # `[INFO] Request time: ms`
    #
    # This pattern represents log events like `[INFO] Request time: 327 ms` and other similar log
    # events that differ only by the number, in this csse 327. When the pattern is displayed, the
    # different numbers are replaced by ``
    #
    # Any parts of log events that are masked as sensitive data are not scanned for anomalies. For
    # more information about masking sensitive data, see [Help protect sensitive log data with
    # masking](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html).
    def create_log_anomaly_detector(input : ACWL::CreateLogAnomalyDetectorRequest) : Core::ParsedResponse(ACWL::CreateLogAnomalyDetectorResponse)
      Log.info { "performing 'CreateLogAnomalyDetector' operation" }
      input.validate! if config.validate_input?
      response = post("CreateLogAnomalyDetector", "/", input.to_json)
      Core::ParsedResponse(ACWL::CreateLogAnomalyDetectorResponse).new(response)
    end

    # Creates a log group with the specified name. You can create up to 1,000,000 log groups per
    # Region per account.
    #
    # You must use the following guidelines when naming a log group:
    #
    # - Log group names must be unique within a Region for an Amazon Web Services account.
    #
    # - Log group names can be between 1 and 512 characters long.
    #
    # - Log group names consist of the following characters: a-z, A-Z, 0-9, '_' (underscore), '-'
    # (hyphen), '/' (forward slash), '.' (period), and '#' (number sign)
    #
    # - Log group names can't start with the string `aws/`
    #
    # When you create a log group, by default the log events in the log group do not expire. To set a
    # retention policy so that events expire and are deleted after a specified time, use
    # [PutRetentionPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutRetentionPolicy.html).
    #
    # If you associate an KMS key with the log group, ingested data is encrypted using the KMS key.
    # This association is stored as long as the data encrypted with the KMS key is still within
    # CloudWatch Logs. This enables CloudWatch Logs to decrypt this data whenever it is requested.
    #
    # If you attempt to associate a KMS key with the log group but the KMS key does not exist or the
    # KMS key is disabled, you receive an `InvalidParameterException` error.
    #
    # CloudWatch Logs supports only symmetric KMS keys. Do not associate an asymmetric KMS key with
    # your log group. For more information, see [Using Symmetric and Asymmetric
    # Keys](https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html).
    def create_log_group(input : ACWL::CreateLogGroupRequest) : Core::Response
      Log.info { "performing 'CreateLogGroup' operation" }
      input.validate! if config.validate_input?
      response = post("CreateLogGroup", "/", input.to_json)
      Core::Response.new(response)
    end

    # Creates a log stream for the specified log group. A log stream is a sequence of log events that
    # originate from a single source, such as an application instance or a resource that is being
    # monitored.
    #
    # There is no limit on the number of log streams that you can create for a log group. There is a
    # limit of 50 TPS on `CreateLogStream` operations, after which transactions are throttled.
    #
    # You must use the following guidelines when naming a log stream:
    #
    # - Log stream names must be unique within the log group.
    #
    # - Log stream names can be between 1 and 512 characters long.
    #
    # - Don't use ':' (colon) or '*' (asterisk) characters.
    def create_log_stream(input : ACWL::CreateLogStreamRequest) : Core::Response
      Log.info { "performing 'CreateLogStream' operation" }
      input.validate! if config.validate_input?
      response = post("CreateLogStream", "/", input.to_json)
      Core::Response.new(response)
    end

    # Creates a lookup table by uploading CSV data or from CloudWatch Logs query results. You can use
    # lookup tables to enrich log data in CloudWatch Logs queries with reference data such as user
    # details, application names, or error descriptions.
    #
    # The table name must be unique within your account and Region. You must specify either
    # `tableBody` or `queryId`, but not both. If you use `tableBody`, the CSV content must include a
    # header row with column names, use UTF-8 encoding, and not exceed 10 MB.
    def create_lookup_table(input : ACWL::CreateLookupTableRequest) : Core::ParsedResponse(ACWL::CreateLookupTableResponse)
      Log.info { "performing 'CreateLookupTable' operation" }
      input.validate! if config.validate_input?
      response = post("CreateLookupTable", "/", input.to_json)
      Core::ParsedResponse(ACWL::CreateLookupTableResponse).new(response)
    end

    # Creates a scheduled query that runs CloudWatch Logs Insights queries at regular intervals.
    # Scheduled queries enable proactive monitoring by automatically executing queries to detect
    # patterns and anomalies in your log data. Query results can be delivered to Amazon S3 for
    # analysis or further processing.
    def create_scheduled_query(input : ACWL::CreateScheduledQueryRequest) : Core::ParsedResponse(ACWL::CreateScheduledQueryResponse)
      Log.info { "performing 'CreateScheduledQuery' operation" }
      input.validate! if config.validate_input?
      response = post("CreateScheduledQuery", "/", input.to_json)
      Core::ParsedResponse(ACWL::CreateScheduledQueryResponse).new(response)
    end

    # Deletes a CloudWatch Logs account policy. This stops the account-wide policy from applying to
    # log groups or data sources in the account. If you delete a data protection policy or
    # subscription filter policy, any log-group level policies of those types remain in effect. This
    # operation supports deletion of data source-based field index policies, including facet
    # configurations, in addition to log group-based policies.
    #
    # To use this operation, you must be signed on with the correct permissions depending on the type
    # of policy that you are deleting.
    #
    # - To delete a data protection policy, you must have the `logs:DeleteDataProtectionPolicy` and
    # `logs:DeleteAccountPolicy` permissions.
    #
    # - To delete a subscription filter policy, you must have the `logs:DeleteSubscriptionFilter` and
    # `logs:DeleteAccountPolicy` permissions.
    #
    # - To delete a transformer policy, you must have the `logs:DeleteTransformer` and
    # `logs:DeleteAccountPolicy` permissions.
    #
    # - To delete a field index policy, you must have the `logs:DeleteIndexPolicy` and
    # `logs:DeleteAccountPolicy` permissions.
    #
    # If you delete a field index policy that included facet configurations, those facets will no
    # longer be available for interactive exploration in the CloudWatch Logs Insights console.
    # However, facet data is retained for up to 30 days.
    #
    # If you delete a field index policy, the indexing of the log events that happened before you
    # deleted the policy will still be used for up to 30 days to improve CloudWatch Logs Insights
    # queries.
    def delete_account_policy(input : ACWL::DeleteAccountPolicyRequest) : Core::Response
      Log.info { "performing 'DeleteAccountPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteAccountPolicy", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes the data protection policy from the specified log group.
    #
    # For more information about data protection policies, see
    # [PutDataProtectionPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html).
    def delete_data_protection_policy(input : ACWL::DeleteDataProtectionPolicyRequest) : Core::Response
      Log.info { "performing 'DeleteDataProtectionPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteDataProtectionPolicy", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes a *delivery*. A delivery is a connection between a logical *delivery source* and a
    # logical *delivery destination*. Deleting a delivery only deletes the connection between the
    # delivery source and delivery destination. It does not delete the delivery destination or the
    # delivery source.
    def delete_delivery(input : ACWL::DeleteDeliveryRequest) : Core::Response
      Log.info { "performing 'DeleteDelivery' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteDelivery", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes a *delivery destination*. A delivery is a connection between a logical *delivery source*
    # and a logical *delivery destination*.
    #
    # You can't delete a delivery destination if any current deliveries are associated with it. To
    # find whether any deliveries are associated with this delivery destination, use the
    # [DescribeDeliveries](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html)
    # operation and check the `deliveryDestinationArn` field in the results.
    def delete_delivery_destination(input : ACWL::DeleteDeliveryDestinationRequest) : Core::Response
      Log.info { "performing 'DeleteDeliveryDestination' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteDeliveryDestination", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes a delivery destination policy. For more information about these policies, see
    # [PutDeliveryDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html).
    def delete_delivery_destination_policy(input : ACWL::DeleteDeliveryDestinationPolicyRequest) : Core::Response
      Log.info { "performing 'DeleteDeliveryDestinationPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteDeliveryDestinationPolicy", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes a *delivery source*. A delivery is a connection between a logical *delivery source* and
    # a logical *delivery destination*.
    #
    # You can't delete a delivery source if any current deliveries are associated with it. To find
    # whether any deliveries are associated with this delivery source, use the
    # [DescribeDeliveries](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html)
    # operation and check the `deliverySourceName` field in the results.
    def delete_delivery_source(input : ACWL::DeleteDeliverySourceRequest) : Core::Response
      Log.info { "performing 'DeleteDeliverySource' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteDeliverySource", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes the specified destination, and eventually disables all the subscription filters that
    # publish to it. This operation does not delete the physical resource encapsulated by the
    # destination.
    def delete_destination(input : ACWL::DeleteDestinationRequest) : Core::Response
      Log.info { "performing 'DeleteDestination' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteDestination", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes a log-group level field index policy that was applied to a single log group. The
    # indexing of the log events that happened before you delete the policy will still be used for as
    # many as 30 days to improve CloudWatch Logs Insights queries.
    #
    # If the deleted policy included facet configurations, those facets will no longer be available
    # for interactive exploration in the CloudWatch Logs Insights console for this log group. However,
    # facet data is retained for up to 30 days.
    #
    # You can't use this operation to delete an account-level index policy. Instead, use
    # [DeleteAccountPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DeleteAccountPolicy.html).
    #
    # If you delete a log-group level field index policy and there is an account-level field index
    # policy, in a few minutes the log group begins using that account-wide policy to index new
    # incoming log events. This operation only affects log group-level policies, including any facet
    # configurations, and preserves any data source-based account policies that may apply to the log
    # group.
    def delete_index_policy(input : ACWL::DeleteIndexPolicyRequest) : Core::ParsedResponse(ACWL::DeleteIndexPolicyResponse)
      Log.info { "performing 'DeleteIndexPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteIndexPolicy", "/", input.to_json)
      Core::ParsedResponse(ACWL::DeleteIndexPolicyResponse).new(response)
    end

    # Deletes the integration between CloudWatch Logs and OpenSearch Service. If your integration has
    # active vended logs dashboards, you must specify `true` for the `force` parameter, otherwise the
    # operation will fail. If you delete the integration by setting `force` to `true`, all your vended
    # logs dashboards powered by OpenSearch Service will be deleted and the data that was on them will
    # no longer be accessible.
    def delete_integration(input : ACWL::DeleteIntegrationRequest) : Core::ParsedResponse(ACWL::DeleteIntegrationResponse)
      Log.info { "performing 'DeleteIntegration' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteIntegration", "/", input.to_json)
      Core::ParsedResponse(ACWL::DeleteIntegrationResponse).new(response)
    end

    # Deletes the specified CloudWatch Logs anomaly detector.
    def delete_log_anomaly_detector(input : ACWL::DeleteLogAnomalyDetectorRequest) : Core::Response
      Log.info { "performing 'DeleteLogAnomalyDetector' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteLogAnomalyDetector", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes the specified log group and permanently deletes all the archived log events associated
    # with the log group.
    def delete_log_group(input : ACWL::DeleteLogGroupRequest) : Core::Response
      Log.info { "performing 'DeleteLogGroup' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteLogGroup", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes the specified log stream and permanently deletes all the archived log events associated
    # with the log stream.
    def delete_log_stream(input : ACWL::DeleteLogStreamRequest) : Core::Response
      Log.info { "performing 'DeleteLogStream' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteLogStream", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes a lookup table permanently. This operation cannot be undone.
    #
    # Queries that reference a deleted table will return an error. Before deleting a lookup table,
    # review any saved queries or dashboards that may reference it.
    def delete_lookup_table(input : ACWL::DeleteLookupTableRequest) : Core::Response
      Log.info { "performing 'DeleteLookupTable' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteLookupTable", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes the specified metric filter.
    def delete_metric_filter(input : ACWL::DeleteMetricFilterRequest) : Core::Response
      Log.info { "performing 'DeleteMetricFilter' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteMetricFilter", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes a saved CloudWatch Logs Insights query definition. A query definition contains details
    # about a saved CloudWatch Logs Insights query.
    #
    # Each `DeleteQueryDefinition` operation can delete one query definition.
    #
    # You must have the `logs:DeleteQueryDefinition` permission to be able to perform this operation.
    def delete_query_definition(input : ACWL::DeleteQueryDefinitionRequest) : Core::ParsedResponse(ACWL::DeleteQueryDefinitionResponse)
      Log.info { "performing 'DeleteQueryDefinition' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteQueryDefinition", "/", input.to_json)
      Core::ParsedResponse(ACWL::DeleteQueryDefinitionResponse).new(response)
    end

    # Deletes a resource policy from this account. This revokes the access of the identities in that
    # policy to put log events to this account.
    def delete_resource_policy(input : ACWL::DeleteResourcePolicyRequest) : Core::Response
      Log.info { "performing 'DeleteResourcePolicy' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteResourcePolicy", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes the specified retention policy.
    #
    # Log events do not expire if they belong to log groups without a retention policy.
    def delete_retention_policy(input : ACWL::DeleteRetentionPolicyRequest) : Core::Response
      Log.info { "performing 'DeleteRetentionPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteRetentionPolicy", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes a scheduled query and stops all future executions. This operation also removes any
    # configured actions and associated resources.
    def delete_scheduled_query(input : ACWL::DeleteScheduledQueryRequest) : Core::ParsedResponse(ACWL::DeleteScheduledQueryResponse)
      Log.info { "performing 'DeleteScheduledQuery' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteScheduledQuery", "/", input.to_json)
      Core::ParsedResponse(ACWL::DeleteScheduledQueryResponse).new(response)
    end

    # Deletes the specified subscription filter.
    def delete_subscription_filter(input : ACWL::DeleteSubscriptionFilterRequest) : Core::Response
      Log.info { "performing 'DeleteSubscriptionFilter' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteSubscriptionFilter", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes a syslog configuration for a log group. After deletion, syslog data is no longer
    # ingested through the specified VPC endpoint.
    def delete_syslog_configuration(input : ACWL::DeleteSyslogConfigurationRequest) : Core::Response
      Log.info { "performing 'DeleteSyslogConfiguration' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteSyslogConfiguration", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes the log transformer for the specified log group. As soon as you do this, the
    # transformation of incoming log events according to that transformer stops. If this account has
    # an account-level transformer that applies to this log group, the log group begins using that
    # account-level transformer when this log-group level transformer is deleted.
    #
    # After you delete a transformer, be sure to edit any metric filters or subscription filters that
    # relied on the transformed versions of the log events.
    def delete_transformer(input : ACWL::DeleteTransformerRequest) : Core::Response
      Log.info { "performing 'DeleteTransformer' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteTransformer", "/", input.to_json)
      Core::Response.new(response)
    end

    # Returns a list of all CloudWatch Logs account policies in the account.
    #
    # To use this operation, you must be signed on with the correct permissions depending on the type
    # of policy that you are retrieving information for.
    #
    # - To see data protection policies, you must have the `logs:GetDataProtectionPolicy` and
    # `logs:DescribeAccountPolicies` permissions.
    #
    # - To see subscription filter policies, you must have the `logs:DescribeSubscriptionFilters` and
    # `logs:DescribeAccountPolicies` permissions.
    #
    # - To see transformer policies, you must have the `logs:GetTransformer` and
    # `logs:DescribeAccountPolicies` permissions.
    #
    # - To see field index policies, you must have the `logs:DescribeIndexPolicies` and
    # `logs:DescribeAccountPolicies` permissions.
    def describe_account_policies(input : ACWL::DescribeAccountPoliciesRequest) : Core::ParsedResponse(ACWL::DescribeAccountPoliciesResponse)
      Log.info { "performing 'DescribeAccountPolicies' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeAccountPolicies", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeAccountPoliciesResponse).new(response)
    end

    # Use this operation to return the valid and default values that are used when creating delivery
    # sources, delivery destinations, and deliveries. For more information about deliveries, see
    # [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html).
    def describe_configuration_templates(input : ACWL::DescribeConfigurationTemplatesRequest) : Core::ParsedResponse(ACWL::DescribeConfigurationTemplatesResponse)
      Log.info { "performing 'DescribeConfigurationTemplates' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeConfigurationTemplates", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeConfigurationTemplatesResponse).new(response)
    end

    # Retrieves a list of the deliveries that have been created in the account.
    #
    # A *delivery* is a connection between a [ *delivery source*
    # ](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html)
    # and a [ *delivery destination*
    # ](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html).
    #
    # A delivery source represents an Amazon Web Services resource that sends logs to an logs delivery
    # destination. The destination can be CloudWatch Logs, Amazon S3, Firehose or X-Ray. Only some
    # Amazon Web Services services support being configured as a delivery source. These services are
    # listed in [Enable logging from Amazon Web Services
    # services.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html)
    def describe_deliveries(input : ACWL::DescribeDeliveriesRequest) : Core::ParsedResponse(ACWL::DescribeDeliveriesResponse)
      Log.info { "performing 'DescribeDeliveries' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeDeliveries", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeDeliveriesResponse).new(response)
    end

    # Retrieves a list of the delivery destinations that have been created in the account.
    def describe_delivery_destinations(input : ACWL::DescribeDeliveryDestinationsRequest) : Core::ParsedResponse(ACWL::DescribeDeliveryDestinationsResponse)
      Log.info { "performing 'DescribeDeliveryDestinations' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeDeliveryDestinations", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeDeliveryDestinationsResponse).new(response)
    end

    # Retrieves a list of the delivery sources that have been created in the account.
    def describe_delivery_sources(input : ACWL::DescribeDeliverySourcesRequest) : Core::ParsedResponse(ACWL::DescribeDeliverySourcesResponse)
      Log.info { "performing 'DescribeDeliverySources' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeDeliverySources", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeDeliverySourcesResponse).new(response)
    end

    # Lists all your destinations. The results are ASCII-sorted by destination name.
    def describe_destinations(input : ACWL::DescribeDestinationsRequest) : Core::ParsedResponse(ACWL::DescribeDestinationsResponse)
      Log.info { "performing 'DescribeDestinations' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeDestinations", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeDestinationsResponse).new(response)
    end

    # Lists the specified export tasks. You can list all your export tasks or filter the results based
    # on task ID or task status.
    def describe_export_tasks(input : ACWL::DescribeExportTasksRequest) : Core::ParsedResponse(ACWL::DescribeExportTasksResponse)
      Log.info { "performing 'DescribeExportTasks' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeExportTasks", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeExportTasksResponse).new(response)
    end

    # Returns a list of field indexes discovered in log data. By default, the response includes the
    # `DEFAULT`, `CUSTOM`, and `INACTIVE` index categories. To return indexes from other categories,
    # use the `indexCategories` parameter.
    #
    # For more information about field index policies, see
    # [PutIndexPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html).
    def describe_field_indexes(input : ACWL::DescribeFieldIndexesRequest) : Core::ParsedResponse(ACWL::DescribeFieldIndexesResponse)
      Log.info { "performing 'DescribeFieldIndexes' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeFieldIndexes", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeFieldIndexesResponse).new(response)
    end

    # Gets detailed information about the individual batches within an import task, including their
    # status and any error messages. For CloudTrail Event Data Store sources, a batch refers to a
    # subset of stored events grouped by their eventTime.
    def describe_import_task_batches(input : ACWL::DescribeImportTaskBatchesRequest) : Core::ParsedResponse(ACWL::DescribeImportTaskBatchesResponse)
      Log.info { "performing 'DescribeImportTaskBatches' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeImportTaskBatches", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeImportTaskBatchesResponse).new(response)
    end

    # Lists and describes import tasks, with optional filtering by import status and source ARN.
    def describe_import_tasks(input : ACWL::DescribeImportTasksRequest) : Core::ParsedResponse(ACWL::DescribeImportTasksResponse)
      Log.info { "performing 'DescribeImportTasks' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeImportTasks", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeImportTasksResponse).new(response)
    end

    # Returns the field index policies of the specified log group. For more information about field
    # index policies, see
    # [PutIndexPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html).
    #
    # If a specified log group has a log-group level index policy, that policy is returned by this
    # operation.
    #
    # If a specified log group doesn't have a log-group level index policy, but an account-wide index
    # policy applies to it, that account-wide policy is returned by this operation.
    #
    # To find information about only account-level policies, use
    # [DescribeAccountPolicies](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeAccountPolicies.html)
    # instead.
    def describe_index_policies(input : ACWL::DescribeIndexPoliciesRequest) : Core::ParsedResponse(ACWL::DescribeIndexPoliciesResponse)
      Log.info { "performing 'DescribeIndexPolicies' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeIndexPolicies", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeIndexPoliciesResponse).new(response)
    end

    # Returns information about log groups, including data sources that ingest into each log group.
    # You can return all your log groups or filter the results by prefix. The results are ASCII-sorted
    # by log group name.
    #
    # CloudWatch Logs doesn't support IAM policies that control access to the `DescribeLogGroups`
    # action by using the `aws:ResourceTag/*key-name* ` condition key. Other CloudWatch Logs actions
    # do support the use of the `aws:ResourceTag/*key-name* ` condition key to control access. For
    # more information about using tags to control access, see [Controlling access to Amazon Web
    # Services resources using
    # tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html).
    #
    # If you are using CloudWatch cross-account observability, you can use this operation in a
    # monitoring account and view data from the linked source accounts. For more information, see
    # [CloudWatch cross-account
    # observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
    def describe_log_groups(input : ACWL::DescribeLogGroupsRequest) : Core::ParsedResponse(ACWL::DescribeLogGroupsResponse)
      Log.info { "performing 'DescribeLogGroups' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeLogGroups", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeLogGroupsResponse).new(response)
    end

    # Lists the log streams for the specified log group. You can list all the log streams or filter
    # the results by prefix. You can also control how the results are ordered.
    #
    # You can specify the log group to search by using either `logGroupIdentifier` or `logGroupName`.
    # You must include one of these two parameters, but you can't include both.
    #
    # This operation has a limit of 25 transactions per second, after which transactions are
    # throttled.
    #
    # If you are using CloudWatch cross-account observability, you can use this operation in a
    # monitoring account and view data from the linked source accounts. For more information, see
    # [CloudWatch cross-account
    # observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
    def describe_log_streams(input : ACWL::DescribeLogStreamsRequest) : Core::ParsedResponse(ACWL::DescribeLogStreamsResponse)
      Log.info { "performing 'DescribeLogStreams' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeLogStreams", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeLogStreamsResponse).new(response)
    end

    # Retrieves metadata about lookup tables in your account. You can optionally filter the results by
    # table name prefix. Results are sorted by table name in ascending order.
    def describe_lookup_tables(input : ACWL::DescribeLookupTablesRequest) : Core::ParsedResponse(ACWL::DescribeLookupTablesResponse)
      Log.info { "performing 'DescribeLookupTables' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeLookupTables", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeLookupTablesResponse).new(response)
    end

    # Lists the specified metric filters. You can list all of the metric filters or filter the results
    # by log name, prefix, metric name, or metric namespace. The results are ASCII-sorted by filter
    # name.
    def describe_metric_filters(input : ACWL::DescribeMetricFiltersRequest) : Core::ParsedResponse(ACWL::DescribeMetricFiltersResponse)
      Log.info { "performing 'DescribeMetricFilters' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeMetricFilters", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeMetricFiltersResponse).new(response)
    end

    # Returns a list of CloudWatch Logs Insights queries that are scheduled, running, or have been run
    # recently in this account. You can request all queries or limit it to queries of a specific log
    # group or queries with a certain status.
    #
    # This operation includes both interactive queries started directly by users and automated queries
    # executed by scheduled query configurations. Scheduled query executions appear in the results
    # alongside manually initiated queries, providing visibility into all query activity in your
    # account.
    def describe_queries(input : ACWL::DescribeQueriesRequest) : Core::ParsedResponse(ACWL::DescribeQueriesResponse)
      Log.info { "performing 'DescribeQueries' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeQueries", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeQueriesResponse).new(response)
    end

    # This operation returns a paginated list of your saved CloudWatch Logs Insights query
    # definitions. You can retrieve query definitions from the current account or from a source
    # account that is linked to the current account.
    #
    # You can use the `queryDefinitionNamePrefix` parameter to limit the results to only the query
    # definitions that have names that start with a certain string.
    def describe_query_definitions(input : ACWL::DescribeQueryDefinitionsRequest) : Core::ParsedResponse(ACWL::DescribeQueryDefinitionsResponse)
      Log.info { "performing 'DescribeQueryDefinitions' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeQueryDefinitions", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeQueryDefinitionsResponse).new(response)
    end

    # Lists the resource policies in this account.
    def describe_resource_policies(input : ACWL::DescribeResourcePoliciesRequest) : Core::ParsedResponse(ACWL::DescribeResourcePoliciesResponse)
      Log.info { "performing 'DescribeResourcePolicies' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeResourcePolicies", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeResourcePoliciesResponse).new(response)
    end

    # Lists the subscription filters for the specified log group. You can list all the subscription
    # filters or filter the results by prefix. The results are ASCII-sorted by filter name.
    def describe_subscription_filters(input : ACWL::DescribeSubscriptionFiltersRequest) : Core::ParsedResponse(ACWL::DescribeSubscriptionFiltersResponse)
      Log.info { "performing 'DescribeSubscriptionFilters' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeSubscriptionFilters", "/", input.to_json)
      Core::ParsedResponse(ACWL::DescribeSubscriptionFiltersResponse).new(response)
    end

    # Disassociates the specified KMS key from the specified log group or from all CloudWatch Logs
    # Insights query results in the account.
    #
    # When you use `DisassociateKmsKey`, you specify either the `logGroupName` parameter or the
    # `resourceIdentifier` parameter. You can't specify both of those parameters in the same
    # operation.
    #
    # - Specify the `logGroupName` parameter to stop using the KMS key to encrypt future log events
    # ingested and stored in the log group. Instead, they will be encrypted with the default
    # CloudWatch Logs method. The log events that were ingested while the key was associated with the
    # log group are still encrypted with that key. Therefore, CloudWatch Logs will need permissions
    # for the key whenever that data is accessed.
    #
    # - Specify the `resourceIdentifier` parameter with the `query-result` resource to stop using the
    # KMS key to encrypt the results of all future
    # [StartQuery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html)
    # operations in the account. They will instead be encrypted with the default CloudWatch Logs
    # method. The results from queries that ran while the key was associated with the account are
    # still encrypted with that key. Therefore, CloudWatch Logs will need permissions for the key
    # whenever that data is accessed.
    #
    # It can take up to 5 minutes for this operation to take effect.
    def disassociate_kms_key(input : ACWL::DisassociateKmsKeyRequest) : Core::Response
      Log.info { "performing 'DisassociateKmsKey' operation" }
      input.validate! if config.validate_input?
      response = post("DisassociateKmsKey", "/", input.to_json)
      Core::Response.new(response)
    end

    # Disassociates a data source from an S3 Table Integration, removing query access and deleting all
    # associated data from the integration.
    def disassociate_source_from_s3_table_integration(input : ACWL::DisassociateSourceFromS3TableIntegrationRequest) : Core::ParsedResponse(ACWL::DisassociateSourceFromS3TableIntegrationResponse)
      Log.info { "performing 'DisassociateSourceFromS3TableIntegration' operation" }
      input.validate! if config.validate_input?
      response = post("DisassociateSourceFromS3TableIntegration", "/", input.to_json)
      Core::ParsedResponse(ACWL::DisassociateSourceFromS3TableIntegrationResponse).new(response)
    end

    # Lists log events from the specified log group. You can list all the log events or filter the
    # results using one or more of the following:
    #
    # - A filter pattern
    #
    # - A time range
    #
    # - The log stream name, or a log stream name prefix that matches multiple log streams
    #
    # You must have the `logs:FilterLogEvents` permission to perform this operation.
    #
    # You can specify the log group to search by using either `logGroupIdentifier` or `logGroupName`.
    # You must include one of these two parameters, but you can't include both.
    #
    # `FilterLogEvents` is a paginated operation. Each page returned can contain up to 1 MB of log
    # events or up to 10,000 log events. A returned page might only be partially full, or even empty.
    # For example, if the result of a query would return 15,000 log events, the first page isn't
    # guaranteed to have 10,000 log events even if they all fit into 1 MB.
    #
    # Partially full or empty pages don't necessarily mean that pagination is finished. If the results
    # include a `nextToken`, there might be more log events available. You can return these additional
    # log events by providing the nextToken in a subsequent `FilterLogEvents` operation. If the
    # results don't include a `nextToken`, then pagination is finished.
    #
    # Specifying the `limit` parameter only guarantees that a single page doesn't return more log
    # events than the specified limit, but it might return fewer events than the limit. This is the
    # expected API behavior.
    #
    # The returned log events are sorted by event timestamp, the timestamp when the event was ingested
    # by CloudWatch Logs, and the ID of the `PutLogEvents` request. By default, the events are
    # returned in ascending timestamp order (oldest first). To return events in descending timestamp
    # order (newest first), set the `startFromHead` parameter to `false`.
    #
    # If you are using CloudWatch cross-account observability, you can use this operation in a
    # monitoring account and view data from the linked source accounts. For more information, see
    # [CloudWatch cross-account
    # observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
    #
    # If you are using [log
    # transformation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html),
    # the `FilterLogEvents` operation returns only the original versions of log events, before they
    # were transformed. To view the transformed versions, you must use a [CloudWatch Logs
    # query.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html)
    def filter_log_events(input : ACWL::FilterLogEventsRequest) : Core::ParsedResponse(ACWL::FilterLogEventsResponse)
      Log.info { "performing 'FilterLogEvents' operation" }
      input.validate! if config.validate_input?
      response = post("FilterLogEvents", "/", input.to_json)
      Core::ParsedResponse(ACWL::FilterLogEventsResponse).new(response)
    end

    # Returns information about a log group data protection policy.
    def get_data_protection_policy(input : ACWL::GetDataProtectionPolicyRequest) : Core::ParsedResponse(ACWL::GetDataProtectionPolicyResponse)
      Log.info { "performing 'GetDataProtectionPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("GetDataProtectionPolicy", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetDataProtectionPolicyResponse).new(response)
    end

    # Returns complete information about one logical *delivery*. A delivery is a connection between a
    # [ *delivery source*
    # ](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html)
    # and a [ *delivery destination*
    # ](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html).
    #
    # A delivery source represents an Amazon Web Services resource that sends logs to an logs delivery
    # destination. The destination can be CloudWatch Logs, Amazon S3, or Firehose. Only some Amazon
    # Web Services services support being configured as a delivery source. These services are listed
    # in [Enable logging from Amazon Web Services
    # services.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html)
    #
    # You need to specify the delivery `id` in this operation. You can find the IDs of the deliveries
    # in your account with the
    # [DescribeDeliveries](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html)
    # operation.
    def get_delivery(input : ACWL::GetDeliveryRequest) : Core::ParsedResponse(ACWL::GetDeliveryResponse)
      Log.info { "performing 'GetDelivery' operation" }
      input.validate! if config.validate_input?
      response = post("GetDelivery", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetDeliveryResponse).new(response)
    end

    # Retrieves complete information about one delivery destination.
    def get_delivery_destination(input : ACWL::GetDeliveryDestinationRequest) : Core::ParsedResponse(ACWL::GetDeliveryDestinationResponse)
      Log.info { "performing 'GetDeliveryDestination' operation" }
      input.validate! if config.validate_input?
      response = post("GetDeliveryDestination", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetDeliveryDestinationResponse).new(response)
    end

    # Retrieves the delivery destination policy assigned to the delivery destination that you specify.
    # For more information about delivery destinations and their policies, see
    # [PutDeliveryDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html).
    def get_delivery_destination_policy(input : ACWL::GetDeliveryDestinationPolicyRequest) : Core::ParsedResponse(ACWL::GetDeliveryDestinationPolicyResponse)
      Log.info { "performing 'GetDeliveryDestinationPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("GetDeliveryDestinationPolicy", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetDeliveryDestinationPolicyResponse).new(response)
    end

    # Retrieves complete information about one delivery source.
    def get_delivery_source(input : ACWL::GetDeliverySourceRequest) : Core::ParsedResponse(ACWL::GetDeliverySourceResponse)
      Log.info { "performing 'GetDeliverySource' operation" }
      input.validate! if config.validate_input?
      response = post("GetDeliverySource", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetDeliverySourceResponse).new(response)
    end

    # Returns information about one integration between CloudWatch Logs and OpenSearch Service.
    def get_integration(input : ACWL::GetIntegrationRequest) : Core::ParsedResponse(ACWL::GetIntegrationResponse)
      Log.info { "performing 'GetIntegration' operation" }
      input.validate! if config.validate_input?
      response = post("GetIntegration", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetIntegrationResponse).new(response)
    end

    # Retrieves information about the log anomaly detector that you specify. The KMS key ARN detected
    # is valid.
    def get_log_anomaly_detector(input : ACWL::GetLogAnomalyDetectorRequest) : Core::ParsedResponse(ACWL::GetLogAnomalyDetectorResponse)
      Log.info { "performing 'GetLogAnomalyDetector' operation" }
      input.validate! if config.validate_input?
      response = post("GetLogAnomalyDetector", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetLogAnomalyDetectorResponse).new(response)
    end

    # Lists log events from the specified log stream. You can list all of the log events or filter
    # using a time range.
    #
    # `GetLogEvents` is a paginated operation. Each page returned can contain up to 1 MB of log events
    # or up to 10,000 log events. A returned page might only be partially full, or even empty. For
    # example, if the result of a query would return 15,000 log events, the first page isn't
    # guaranteed to have 10,000 log events even if they all fit into 1 MB.
    #
    # Partially full or empty pages don't necessarily mean that pagination is finished. As long as the
    # `nextBackwardToken` or `nextForwardToken` returned is NOT equal to the `nextToken` that you
    # passed into the API call, there might be more log events available. The token that you use
    # depends on the direction you want to move in along the log stream. The returned tokens are never
    # null.
    #
    # If you set `startFromHead` to `true` and you don’t include `endTime` in your request, you can
    # end up in a situation where the pagination doesn't terminate. This can happen when the new log
    # events are being added to the target log streams faster than they are being read. This situation
    # is a good use case for the CloudWatch Logs [Live
    # Tail](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs_LiveTail.html)
    # feature.
    #
    # If you are using CloudWatch cross-account observability, you can use this operation in a
    # monitoring account and view data from the linked source accounts. For more information, see
    # [CloudWatch cross-account
    # observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
    #
    # You can specify the log group to search by using either `logGroupIdentifier` or `logGroupName`.
    # You must include one of these two parameters, but you can't include both.
    #
    # If you are using [log
    # transformation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html),
    # the `GetLogEvents` operation returns only the original versions of log events, before they were
    # transformed. To view the transformed versions, you must use a [CloudWatch Logs
    # query.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html)
    def get_log_events(input : ACWL::GetLogEventsRequest) : Core::ParsedResponse(ACWL::GetLogEventsResponse)
      Log.info { "performing 'GetLogEvents' operation" }
      input.validate! if config.validate_input?
      response = post("GetLogEvents", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetLogEventsResponse).new(response)
    end

    # Discovers available fields for a specific data source and type. The response includes any field
    # modifications introduced through pipelines, such as new fields or changed field types.
    def get_log_fields(input : ACWL::GetLogFieldsRequest) : Core::ParsedResponse(ACWL::GetLogFieldsResponse)
      Log.info { "performing 'GetLogFields' operation" }
      input.validate! if config.validate_input?
      response = post("GetLogFields", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetLogFieldsResponse).new(response)
    end

    # Returns a list of the fields that are included in log events in the specified log group.
    # Includes the percentage of log events that contain each field. The search is limited to a time
    # period that you specify.
    #
    # This operation is used for discovering fields within log group events. For discovering fields
    # across data sources, use the GetLogFields operation.
    #
    # You can specify the log group to search by using either `logGroupIdentifier` or `logGroupName`.
    # You must specify one of these parameters, but you can't specify both.
    #
    # In the results, fields that start with `@` are fields generated by CloudWatch Logs. For example,
    # `@timestamp` is the timestamp of each log event. For more information about the fields that are
    # generated by CloudWatch logs, see [Supported Logs and Discovered
    # Fields](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html).
    #
    # The response results are sorted by the frequency percentage, starting with the highest
    # percentage.
    #
    # If you are using CloudWatch cross-account observability, you can use this operation in a
    # monitoring account and view data from the linked source accounts. For more information, see
    # [CloudWatch cross-account
    # observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
    def get_log_group_fields(input : ACWL::GetLogGroupFieldsRequest) : Core::ParsedResponse(ACWL::GetLogGroupFieldsResponse)
      Log.info { "performing 'GetLogGroupFields' operation" }
      input.validate! if config.validate_input?
      response = post("GetLogGroupFields", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetLogGroupFieldsResponse).new(response)
    end

    # Retrieves all of the fields and values of a single log event. All fields are retrieved, even if
    # the original query that produced the `logRecordPointer` retrieved only a subset of fields.
    # Fields are returned as field name/field value pairs.
    #
    # The full unparsed log event is returned within `@message`.
    def get_log_record(input : ACWL::GetLogRecordRequest) : Core::ParsedResponse(ACWL::GetLogRecordResponse)
      Log.info { "performing 'GetLogRecord' operation" }
      input.validate! if config.validate_input?
      response = post("GetLogRecord", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetLogRecordResponse).new(response)
    end

    # Retrieves the full content of a lookup table, including the CSV data.
    def get_lookup_table(input : ACWL::GetLookupTableRequest) : Core::ParsedResponse(ACWL::GetLookupTableResponse)
      Log.info { "performing 'GetLookupTable' operation" }
      input.validate! if config.validate_input?
      response = post("GetLookupTable", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetLookupTableResponse).new(response)
    end

    # Returns the results from the specified query.
    #
    # Only the fields requested in the query are returned, along with a `@ptr` field, which is the
    # identifier for the log record. You can use the value of `@ptr` in a
    # [GetLogRecord](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogRecord.html)
    # operation to get the full log record.
    #
    # `GetQueryResults` does not start running a query. To run a query, use
    # [StartQuery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html).
    # For more information about how long results of previous queries are available, see [CloudWatch
    # Logs
    # quotas](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/cloudwatch_limits_cwl.html).
    #
    # If the value of the `Status` field in the output is `Running`, this operation returns only
    # partial results. If you see a value of `Scheduled` or `Running` for the status, you can retry
    # the operation later to see the final results.
    #
    # This operation is used both for retrieving results from interactive queries and from automated
    # scheduled query executions. Scheduled queries use `GetQueryResults` internally to retrieve query
    # results for processing and delivery to configured destinations.
    #
    # You can retrieve up to 100,000 log event results from a query, if available, by using
    # pagination. Use the `nextToken` returned in the response to request additional pages of results,
    # with each page returning up to 10,000 log events. This is only supported for Logs Insights QL
    # and is currently not supported for PPL and SQL query languages.
    #
    # If you are using CloudWatch cross-account observability, you can use this operation in a
    # monitoring account to start queries in linked source accounts. For more information, see
    # [CloudWatch cross-account
    # observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
    def get_query_results(input : ACWL::GetQueryResultsRequest) : Core::ParsedResponse(ACWL::GetQueryResultsResponse)
      Log.info { "performing 'GetQueryResults' operation" }
      input.validate! if config.validate_input?
      response = post("GetQueryResults", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetQueryResultsResponse).new(response)
    end

    # Retrieves details about a specific scheduled query, including its configuration, execution
    # status, and metadata.
    def get_scheduled_query(input : ACWL::GetScheduledQueryRequest) : Core::ParsedResponse(ACWL::GetScheduledQueryResponse)
      Log.info { "performing 'GetScheduledQuery' operation" }
      input.validate! if config.validate_input?
      response = post("GetScheduledQuery", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetScheduledQueryResponse).new(response)
    end

    # Retrieves the execution history of a scheduled query within a specified time range, including
    # query results and destination processing status.
    def get_scheduled_query_history(input : ACWL::GetScheduledQueryHistoryRequest) : Core::ParsedResponse(ACWL::GetScheduledQueryHistoryResponse)
      Log.info { "performing 'GetScheduledQueryHistory' operation" }
      input.validate! if config.validate_input?
      response = post("GetScheduledQueryHistory", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetScheduledQueryHistoryResponse).new(response)
    end

    # Returns the storage tier policy for the account.
    def get_storage_tier_policy(input : ACWL::GetStorageTierPolicyRequest) : Core::ParsedResponse(ACWL::GetStorageTierPolicyResponse)
      Log.info { "performing 'GetStorageTierPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("GetStorageTierPolicy", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetStorageTierPolicyResponse).new(response)
    end

    # Returns the information about the log transformer associated with this log group.
    #
    # This operation returns data only for transformers created at the log group level. To get
    # information for an account-level transformer, use
    # [DescribeAccountPolicies](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeAccountPolicies.html).
    def get_transformer(input : ACWL::GetTransformerRequest) : Core::ParsedResponse(ACWL::GetTransformerResponse)
      Log.info { "performing 'GetTransformer' operation" }
      input.validate! if config.validate_input?
      response = post("GetTransformer", "/", input.to_json)
      Core::ParsedResponse(ACWL::GetTransformerResponse).new(response)
    end

    # Returns an aggregate summary of all log groups in the Region grouped by specified data source
    # characteristics. Supports optional filtering by log group class, name patterns, and data
    # sources. If you perform this action in a monitoring account, you can also return aggregated
    # summaries of log groups from source accounts that are linked to the monitoring account. For more
    # information about using cross-account observability to set up monitoring accounts and source
    # accounts, see [CloudWatch cross-account
    # observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
    #
    # The operation aggregates log groups by data source name and type and optionally format,
    # providing counts of log groups that share these characteristics. The operation paginates
    # results. By default, it returns up to 50 results and includes a token to retrieve more results.
    def list_aggregate_log_group_summaries(input : ACWL::ListAggregateLogGroupSummariesRequest) : Core::ParsedResponse(ACWL::ListAggregateLogGroupSummariesResponse)
      Log.info { "performing 'ListAggregateLogGroupSummaries' operation" }
      input.validate! if config.validate_input?
      response = post("ListAggregateLogGroupSummaries", "/", input.to_json)
      Core::ParsedResponse(ACWL::ListAggregateLogGroupSummariesResponse).new(response)
    end

    # Returns a list of anomalies that log anomaly detectors have found. For details about the
    # structure format of each anomaly object that is returned, see the example in this section.
    def list_anomalies(input : ACWL::ListAnomaliesRequest) : Core::ParsedResponse(ACWL::ListAnomaliesResponse)
      Log.info { "performing 'ListAnomalies' operation" }
      input.validate! if config.validate_input?
      response = post("ListAnomalies", "/", input.to_json)
      Core::ParsedResponse(ACWL::ListAnomaliesResponse).new(response)
    end

    # Returns a list of integrations between CloudWatch Logs and other services in this account.
    # Currently, only one integration can be created in an account, and this integration must be with
    # OpenSearch Service.
    def list_integrations(input : ACWL::ListIntegrationsRequest) : Core::ParsedResponse(ACWL::ListIntegrationsResponse)
      Log.info { "performing 'ListIntegrations' operation" }
      input.validate! if config.validate_input?
      response = post("ListIntegrations", "/", input.to_json)
      Core::ParsedResponse(ACWL::ListIntegrationsResponse).new(response)
    end

    # Retrieves a list of the log anomaly detectors in the account.
    def list_log_anomaly_detectors(input : ACWL::ListLogAnomalyDetectorsRequest) : Core::ParsedResponse(ACWL::ListLogAnomalyDetectorsResponse)
      Log.info { "performing 'ListLogAnomalyDetectors' operation" }
      input.validate! if config.validate_input?
      response = post("ListLogAnomalyDetectors", "/", input.to_json)
      Core::ParsedResponse(ACWL::ListLogAnomalyDetectorsResponse).new(response)
    end

    # Returns a list of log groups in the Region in your account. If you are performing this action in
    # a monitoring account, you can choose to also return log groups from source accounts that are
    # linked to the monitoring account. For more information about using cross-account observability
    # to set up monitoring accounts and source accounts, see [ CloudWatch cross-account
    # observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
    #
    # You can optionally filter the results by log group class, log group name pattern, field indexes,
    # data sources, field index names, or log group tags. If you specify more than one filter type,
    # the results include log groups that satisfy all filters.
    #
    # This operation is paginated. By default, your first use of this operation returns 50 results,
    # and includes a token to use in a subsequent operation to return more results.
    def list_log_groups(input : ACWL::ListLogGroupsRequest) : Core::ParsedResponse(ACWL::ListLogGroupsResponse)
      Log.info { "performing 'ListLogGroups' operation" }
      input.validate! if config.validate_input?
      response = post("ListLogGroups", "/", input.to_json)
      Core::ParsedResponse(ACWL::ListLogGroupsResponse).new(response)
    end

    # Returns a list of the log groups that were analyzed during a single CloudWatch Logs Insights
    # query. This can be useful for queries that use log group name prefixes or the `filterIndex`
    # command, because the log groups are dynamically selected in these cases.
    #
    # For more information about field indexes, see [Create field indexes to improve query performance
    # and reduce
    # costs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing.html).
    def list_log_groups_for_query(input : ACWL::ListLogGroupsForQueryRequest) : Core::ParsedResponse(ACWL::ListLogGroupsForQueryResponse)
      Log.info { "performing 'ListLogGroupsForQuery' operation" }
      input.validate! if config.validate_input?
      response = post("ListLogGroupsForQuery", "/", input.to_json)
      Core::ParsedResponse(ACWL::ListLogGroupsForQueryResponse).new(response)
    end

    # Lists all scheduled queries in your account and region. You can filter results by state to show
    # only enabled or disabled queries.
    def list_scheduled_queries(input : ACWL::ListScheduledQueriesRequest) : Core::ParsedResponse(ACWL::ListScheduledQueriesResponse)
      Log.info { "performing 'ListScheduledQueries' operation" }
      input.validate! if config.validate_input?
      response = post("ListScheduledQueries", "/", input.to_json)
      Core::ParsedResponse(ACWL::ListScheduledQueriesResponse).new(response)
    end

    # Returns a list of data source associations for a specified S3 Table Integration, showing which
    # data sources are currently associated for query access.
    def list_sources_for_s3_table_integration(input : ACWL::ListSourcesForS3TableIntegrationRequest) : Core::ParsedResponse(ACWL::ListSourcesForS3TableIntegrationResponse)
      Log.info { "performing 'ListSourcesForS3TableIntegration' operation" }
      input.validate! if config.validate_input?
      response = post("ListSourcesForS3TableIntegration", "/", input.to_json)
      Core::ParsedResponse(ACWL::ListSourcesForS3TableIntegrationResponse).new(response)
    end

    # Returns a list of syslog configurations. You can optionally filter the results by log group or
    # VPC endpoint.
    def list_syslog_configurations(input : ACWL::ListSyslogConfigurationsRequest) : Core::ParsedResponse(ACWL::ListSyslogConfigurationsResponse)
      Log.info { "performing 'ListSyslogConfigurations' operation" }
      input.validate! if config.validate_input?
      response = post("ListSyslogConfigurations", "/", input.to_json)
      Core::ParsedResponse(ACWL::ListSyslogConfigurationsResponse).new(response)
    end

    # Displays the tags associated with a CloudWatch Logs resource. Currently, log groups and
    # destinations support tagging.
    def list_tags_for_resource(input : ACWL::ListTagsForResourceRequest) : Core::ParsedResponse(ACWL::ListTagsForResourceResponse)
      Log.info { "performing 'ListTagsForResource' operation" }
      input.validate! if config.validate_input?
      response = post("ListTagsForResource", "/", input.to_json)
      Core::ParsedResponse(ACWL::ListTagsForResourceResponse).new(response)
    end

    # The ListTagsLogGroup operation is on the path to deprecation. We recommend that you use
    # [ListTagsForResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html)
    # instead.
    #
    # Lists the tags for the specified log group.
    def list_tags_log_group(input : ACWL::ListTagsLogGroupRequest) : Core::ParsedResponse(ACWL::ListTagsLogGroupResponse)
      Log.info { "performing 'ListTagsLogGroup' operation" }
      input.validate! if config.validate_input?
      response = post("ListTagsLogGroup", "/", input.to_json)
      Core::ParsedResponse(ACWL::ListTagsLogGroupResponse).new(response)
    end

    # Creates an account-level data protection policy, subscription filter policy, field index policy,
    # transformer policy, or metric extraction policy that applies to all log groups, a subset of log
    # groups, or a data source name and type combination in the account.
    #
    # `PutAccountPolicy` is an account-wide administrative operation intended for CloudWatch Logs
    # administrators. Because it affects all log groups (or a broad subset) in the account, you should
    # grant `logs:PutAccountPolicy` permissions only to administrators who manage logging
    # configuration across the account, not to application teams or individual log group owners.
    #
    # **Conflict resolution between account-level and log-group-level policies**
    #
    # When both an account-level policy and a log-group-level policy of the same type apply to a log
    # group, the resolution depends on the policy type:
    #
    # - *Data protection* — The two policies are cumulative. Any sensitive term specified in either
    # the account-level or the log-group-level policy is masked.
    #
    # - *Subscription filters* — Account-level and log-group-level subscription filters are additive.
    # A log group can have up to 1 account-level and up to 2 log-group-level subscription filters.
    #
    # - *Transformers* — A log-group-level transformer overrides the account-level transformer. If a
    # log group has its own transformer, it ignores the account-level transformer policy.
    #
    # - *Field index policies* — If a log group has its own field index policy (created with
    # `PutIndexPolicy`), any account-level policy that uses `LogGroupNamePrefix` selection criteria or
    # has no selection criteria is ignored for that log group. However, account-level policies that
    # use `DataSourceName` and `DataSourceType` selection criteria still apply alongside the
    # log-group-level policy.
    #
    # - *Metric extraction policies* — Metric extraction policies are account-level only and have no
    # log-group-level equivalent, so no conflict resolution applies.
    #
    # For field index policies, you can configure indexed fields as *facets* to enable interactive
    # exploration of your logs. Facets provide value distributions and counts for indexed fields in
    # the CloudWatch Logs Insights console without requiring query execution. For more information,
    # see [Use facets to group and explore
    # logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Facets.html).
    #
    # To use this operation, you must be signed on with the correct permissions depending on the type
    # of policy that you are creating.
    #
    # - To create a data protection policy, you must have the `logs:PutDataProtectionPolicy` and
    # `logs:PutAccountPolicy` permissions.
    #
    # - To create a subscription filter policy, you must have the `logs:PutSubscriptionFilter` and
    # `logs:PutAccountPolicy` permissions.
    #
    # - To create a transformer policy, you must have the `logs:PutTransformer` and
    # `logs:PutAccountPolicy` permissions.
    #
    # - To create a field index policy, you must have the `logs:PutIndexPolicy` and
    # `logs:PutAccountPolicy` permissions.
    #
    # - To configure facets for field index policies, you must have the `logs:PutIndexPolicy` and
    # `logs:PutAccountPolicy` permissions.
    #
    # - To create a metric extraction policy, you must have the `logs:PutMetricExtractionPolicy` and
    # `logs:PutAccountPolicy` permissions.
    #
    # **Data protection policy**
    #
    # A data protection policy can help safeguard sensitive data that's ingested by your log groups by
    # auditing and masking the sensitive log data. Each account can have only one account-level data
    # protection policy.
    #
    # Sensitive data is detected and masked when it is ingested into a log group. When you set a data
    # protection policy, log events ingested into the log groups before that time are not masked.
    #
    # If you use `PutAccountPolicy` to create a data protection policy for your whole account, it
    # applies to both existing log groups and all log groups that are created later in this account.
    # The account-level policy is applied to existing log groups with eventual consistency. It might
    # take up to 5 minutes before sensitive data in existing log groups begins to be masked.
    #
    # By default, when a user views a log event that includes masked data, the sensitive data is
    # replaced by asterisks. A user who has the `logs:Unmask` permission can use a
    # [GetLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html)
    # or
    # [FilterLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html)
    # operation with the `unmask` parameter set to `true` to view the unmasked log events. Users with
    # the `logs:Unmask` can also view unmasked data in the CloudWatch Logs console by running a
    # CloudWatch Logs Insights query with the `unmask` query command.
    #
    # For more information, including a list of types of data that can be audited and masked, see
    # [Protect sensitive log data with
    # masking](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html).
    #
    # To use the `PutAccountPolicy` operation for a data protection policy, you must be signed on with
    # the `logs:PutDataProtectionPolicy` and `logs:PutAccountPolicy` permissions.
    #
    # The `PutAccountPolicy` operation applies to all log groups in the account. You can use
    # [PutDataProtectionPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html)
    # to create a data protection policy that applies to just one log group. If a log group has its
    # own data protection policy and the account also has an account-level data protection policy,
    # then the two policies are cumulative. Any sensitive term specified in either policy is masked.
    #
    # **Subscription filter policy**
    #
    # A subscription filter policy sets up a real-time feed of log events from CloudWatch Logs to
    # other Amazon Web Services services. Account-level subscription filter policies apply to both
    # existing log groups and log groups that are created later in this account. Supported
    # destinations are Kinesis Data Streams, Firehose, and Lambda. When log events are sent to the
    # receiving service, they are Base64 encoded and compressed with the GZIP format.
    #
    # The following destinations are supported for subscription filters:
    #
    # - An Kinesis Data Streams data stream in the same account as the subscription policy, for
    # same-account delivery.
    #
    # - An Firehose data stream in the same account as the subscription policy, for same-account
    # delivery.
    #
    # - A Lambda function in the same account as the subscription policy, for same-account delivery.
    #
    # - A logical destination in a different account created with
    # [PutDestination](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html),
    # for cross-account delivery. Kinesis Data Streams and Firehose are supported as logical
    # destinations.
    #
    # Each account can have one account-level subscription filter policy per Region. If you are
    # updating an existing filter, you must specify the correct name in `PolicyName`. To perform a
    # `PutAccountPolicy` subscription filter operation for any destination except a Lambda function,
    # you must also have the `iam:PassRole` permission.
    #
    # **Transformer policy**
    #
    # Creates or updates a *log transformer policy* for your account. You use log transformers to
    # transform log events into a different format, making them easier for you to process and analyze.
    # You can also transform logs from different sources into standardized formats that contain
    # relevant, source-specific information. After you have created a transformer, CloudWatch Logs
    # performs this transformation at the time of log ingestion. You can then refer to the transformed
    # versions of the logs during operations such as querying with CloudWatch Logs Insights or
    # creating metric filters or subscription filters.
    #
    # You can also use a transformer to copy metadata from metadata keys into the log events
    # themselves. This metadata can include log group name, log stream name, account ID and Region.
    #
    # A transformer for a log group is a series of processors, where each processor applies one type
    # of transformation to the log events ingested into this log group. For more information about the
    # available processors to use in a transformer, see [ Processors that you can
    # use](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-Processors).
    #
    # Having log events in standardized format enables visibility across your applications for your
    # log analysis, reporting, and alarming needs. CloudWatch Logs provides transformation for common
    # log types with out-of-the-box transformation templates for major Amazon Web Services log sources
    # such as VPC flow logs, Lambda, and Amazon RDS. You can use pre-built transformation templates or
    # create custom transformation policies.
    #
    # You can create transformers only for the log groups in the Standard log class.
    #
    # You can have one account-level transformer policy that applies to all log groups in the account.
    # Or you can create as many as 20 account-level transformer policies that are each scoped to a
    # subset of log groups with the `selectionCriteria` parameter. If you have multiple account-level
    # transformer policies with selection criteria, no two of them can use the same or overlapping log
    # group name prefixes. For example, if you have one policy filtered to log groups that start with
    # `my-log`, you can't have another transformer policy filtered to `my-logpprod` or `my-logging`.
    #
    # You can also set up a transformer at the log-group level. For more information, see
    # [PutTransformer](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html).
    # If there is both a log-group level transformer created with `PutTransformer` and an
    # account-level transformer that could apply to the same log group, the log group uses only the
    # log-group level transformer. It ignores the account-level transformer.
    #
    # **Field index policy**
    #
    # You can use field index policies to create indexes on fields found in log events for a log group
    # or data source name and type combination. Creating field indexes can help lower the scan volume
    # for CloudWatch Logs Insights queries that reference those fields, because these queries attempt
    # to skip the processing of log events that are known to not match the indexed field. Good fields
    # to index are fields that you often need to query for and fields or values that match only a
    # small fraction of the total log events. Common examples of indexes include request ID, session
    # ID, user IDs, or instance IDs. For more information, see [Create field indexes to improve query
    # performance and reduce
    # costs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing.html)
    #
    # To find the fields that are in your log group events, use the
    # [GetLogGroupFields](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogGroupFields.html)
    # operation. To find the fields for a data source use the
    # [GetLogFields](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogFields.html)
    # operation.
    #
    # For example, suppose you have created a field index for `requestId`. Then, any CloudWatch Logs
    # Insights query on that log group that includes `requestId = *value* ` or `requestId in [*value*,
    # *value*, ...]` will attempt to process only the log events where the indexed field matches the
    # specified value.
    #
    # Matches of log events to the names of indexed fields are case-sensitive. For example, an indexed
    # field of `RequestId` won't match a log event containing `requestId`.
    #
    # You can have one account-level field index policy that applies to all log groups in the account.
    # Or you can create as many as 20 account-level field index policies that are each scoped to a
    # subset of log groups using `LogGroupNamePrefix` with the `selectionCriteria` parameter. You can
    # have another 20 account-level field index policies using `DataSourceName` and `DataSourceType`
    # for the `selectionCriteria` parameter. If you have multiple account-level index policies with
    # `LogGroupNamePrefix` selection criteria, no two of them can use the same or overlapping log
    # group name prefixes. For example, if you have one policy filtered to log groups that start with
    # *my-log*, you can't have another field index policy filtered to *my-logpprod* or *my-logging*.
    # Similarly, if you have multiple account-level index policies with `DataSourceName` and
    # `DataSourceType` selection criteria, no two of them can use the same data source name and type
    # combination. For example, if you have one policy filtered to the data source name `amazon_vpc`
    # and data source type `flow` you cannot create another policy with this combination.
    #
    # If you create an account-level field index policy in a monitoring account in cross-account
    # observability, the policy is applied only to the monitoring account and not to any source
    # accounts.
    #
    # CloudWatch Logs provides default field indexes for all log groups in the Standard log class.
    # Default field indexes are automatically available for the following fields:
    #
    # - `@logStream`
    #
    # - `@aws.region`
    #
    # - `@aws.account`
    #
    # - `@source.log`
    #
    # - `@data_source_name`
    #
    # - `@data_source_type`
    #
    # - `@data_format`
    #
    # - `traceId`
    #
    # - `severityText`
    #
    # - `attributes.session.id`
    #
    # CloudWatch Logs provides default field indexes for certain data source name and type
    # combinations as well. Default field indexes are automatically available for the following data
    # source name and type combinations as identified in the following list:
    #
    # `amazon_vpc.flow`
    #
    # - `action`
    #
    # - `logStatus`
    #
    # - `region`
    #
    # - `flowDirection`
    #
    # - `type`
    #
    # `amazon_route53.resolver_query`
    #
    # - `transport`
    #
    # - `rcode`
    #
    # `aws_waf.access`
    #
    # - `action`
    #
    # - `httpRequest.country`
    #
    # `aws_cloudtrail.data`, `aws_cloudtrail.management`
    #
    # - `eventSource`
    #
    # - `eventName`
    #
    # - `awsRegion`
    #
    # - `userAgent`
    #
    # - `errorCode`
    #
    # - `eventType`
    #
    # - `managementEvent`
    #
    # - `readOnly`
    #
    # - `eventCategory`
    #
    # - `requestId`
    #
    # Default field indexes are in addition to any custom field indexes you define within your policy.
    # Default field indexes are not counted towards your [field index
    # quota](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing-Syntax).
    #
    # If you want to create a field index policy for a single log group, you can use
    # [PutIndexPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html)
    # instead of `PutAccountPolicy`. If you do so, that log group will use that log-group level policy
    # and any account-level policies that match at the data source level; any account-level policy
    # that matches at the log group level (for example, no selection criteria or log group name prefix
    # selection criteria) will be ignored.
    #
    # **Metric extraction policy**
    #
    # A metric extraction policy controls whether CloudWatch Metrics can be created through the
    # Embedded Metrics Format (EMF) for log groups in your account. By default, EMF metric creation is
    # enabled for all log groups. You can use metric extraction policies to disable EMF metric
    # creation for your entire account or specific log groups.
    #
    # When a policy disables EMF metric creation for a log group, log events in the EMF format are
    # still ingested, but no CloudWatch Metrics are created from them.
    #
    # Creating a policy disables metrics for Amazon Web Services features that use EMF to create
    # metrics, such as CloudWatch Container Insights and CloudWatch Application Signals. To prevent
    # turning off those features by accident, we recommend that you exclude the underlying log-groups
    # through a selection-criteria such as `LogGroupNamePrefix NOT IN ["/aws/containerinsights",
    # "/aws/ecs/containerinsights", "/aws/application-signals/data"]`.
    #
    # Each account can have either one account-level metric extraction policy that applies to all log
    # groups, or up to 5 policies that are each scoped to a subset of log groups with the
    # `selectionCriteria` parameter. The selection criteria supports filtering by `LogGroupName` and
    # `LogGroupNamePrefix` using the operators `IN` and `NOT IN`. You can specify up to 50 values in
    # each `IN` or `NOT IN` list.
    #
    # The selection criteria can be specified in these formats:
    #
    # `LogGroupName IN ["log-group-1", "log-group-2"]`
    #
    # `LogGroupNamePrefix NOT IN ["/aws/prefix1", "/aws/prefix2"]`
    #
    # If you have multiple account-level metric extraction policies with selection criteria, no two of
    # them can have overlapping criteria. For example, if you have one policy with selection criteria
    # `LogGroupNamePrefix IN ["my-log"]`, you can't have another metric extraction policy with
    # selection criteria `LogGroupNamePrefix IN ["/my-log-prod"]` or `LogGroupNamePrefix IN
    # ["/my-logging"]`, as the set of log groups matching these prefixes would be a subset of the log
    # groups matching the first policy's prefix, creating an overlap.
    #
    # When using `NOT IN`, only one policy with this operator is allowed per account.
    #
    # When combining policies with `IN` and `NOT IN` operators, the overlap check ensures that
    # policies don't have conflicting effects. Two policies with `IN` and `NOT IN` operators do not
    # overlap if and only if every value in the `IN `policy is completely contained within some value
    # in the `NOT IN` policy. For example:
    #
    # - If you have a `NOT IN` policy for prefix `"/aws/lambda"`, you can create an `IN` policy for
    # the exact log group name `"/aws/lambda/function1"` because the set of log groups matching
    # `"/aws/lambda/function1"` is a subset of the log groups matching `"/aws/lambda"`.
    #
    # - If you have a `NOT IN` policy for prefix `"/aws/lambda"`, you cannot create an `IN` policy for
    # prefix `"/aws"` because the set of log groups matching `"/aws"` is not a subset of the log
    # groups matching `"/aws/lambda"`.
    def put_account_policy(input : ACWL::PutAccountPolicyRequest) : Core::ParsedResponse(ACWL::PutAccountPolicyResponse)
      Log.info { "performing 'PutAccountPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("PutAccountPolicy", "/", input.to_json)
      Core::ParsedResponse(ACWL::PutAccountPolicyResponse).new(response)
    end

    # Enables or disables bearer token authentication for the specified log group. When enabled on a
    # log group, bearer token authentication is enabled on operations until it is explicitly disabled.
    #
    # For information about the parameters that are common to all actions, see [Common
    # Parameters](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/CommonParameters.html).
    def put_bearer_token_authentication(input : ACWL::PutBearerTokenAuthenticationRequest) : Core::Response
      Log.info { "performing 'PutBearerTokenAuthentication' operation" }
      input.validate! if config.validate_input?
      response = post("PutBearerTokenAuthentication", "/", input.to_json)
      Core::Response.new(response)
    end

    # Creates a data protection policy for the specified log group. A data protection policy can help
    # safeguard sensitive data that's ingested by the log group by auditing and masking the sensitive
    # log data.
    #
    # Sensitive data is detected and masked when it is ingested into the log group. When you set a
    # data protection policy, log events ingested into the log group before that time are not masked.
    #
    # By default, when a user views a log event that includes masked data, the sensitive data is
    # replaced by asterisks. A user who has the `logs:Unmask` permission can use a
    # [GetLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html)
    # or
    # [FilterLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html)
    # operation with the `unmask` parameter set to `true` to view the unmasked log events. Users with
    # the `logs:Unmask` can also view unmasked data in the CloudWatch Logs console by running a
    # CloudWatch Logs Insights query with the `unmask` query command.
    #
    # For more information, including a list of types of data that can be audited and masked, see
    # [Protect sensitive log data with
    # masking](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html).
    #
    # The `PutDataProtectionPolicy` operation applies to only the specified log group. You can also
    # use
    # [PutAccountPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutAccountPolicy.html)
    # to create an account-level data protection policy that applies to all log groups in the account,
    # including both existing log groups and log groups that are created level. If a log group has its
    # own data protection policy and the account also has an account-level data protection policy,
    # then the two policies are cumulative. Any sensitive term specified in either policy is masked.
    def put_data_protection_policy(input : ACWL::PutDataProtectionPolicyRequest) : Core::ParsedResponse(ACWL::PutDataProtectionPolicyResponse)
      Log.info { "performing 'PutDataProtectionPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("PutDataProtectionPolicy", "/", input.to_json)
      Core::ParsedResponse(ACWL::PutDataProtectionPolicyResponse).new(response)
    end

    # Creates or updates a logical *delivery destination*. A delivery destination is an Amazon Web
    # Services resource that represents an Amazon Web Services service that logs can be sent to.
    # CloudWatch Logs, Amazon S3, and Firehose are supported as logs delivery destinations and X-Ray
    # as the trace delivery destination.
    #
    # To configure logs delivery between a supported Amazon Web Services service and a destination,
    # you must do the following:
    #
    # - Create a delivery source, which is a logical object that represents the resource that is
    # actually sending the logs. For more information, see
    # [PutDeliverySource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html).
    #
    # - Use `PutDeliveryDestination` to create a *delivery destination* in the same account of the
    # actual delivery destination. The delivery destination that you create is a logical object that
    # represents the actual delivery destination.
    #
    # - If you are delivering logs cross-account, you must use
    # [PutDeliveryDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html)
    # in the destination account to assign an IAM policy to the destination. This policy allows
    # delivery to that destination.
    #
    # - Use `CreateDelivery` to create a *delivery* by pairing exactly one delivery source and one
    # delivery destination. For more information, see
    # [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html).
    #
    # You can configure a single delivery source to send logs to multiple destinations by creating
    # multiple deliveries. You can also create multiple deliveries to configure multiple delivery
    # sources to send logs to the same delivery destination.
    #
    # Only some Amazon Web Services services support being configured as a delivery source. These
    # services are listed as **Supported [V2 Permissions]** in the table at [Enabling logging from
    # Amazon Web Services
    # services.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html)
    #
    # If you use this operation to update an existing delivery destination, all the current delivery
    # destination parameters are overwritten with the new parameter values that you specify.
    def put_delivery_destination(input : ACWL::PutDeliveryDestinationRequest) : Core::ParsedResponse(ACWL::PutDeliveryDestinationResponse)
      Log.info { "performing 'PutDeliveryDestination' operation" }
      input.validate! if config.validate_input?
      response = post("PutDeliveryDestination", "/", input.to_json)
      Core::ParsedResponse(ACWL::PutDeliveryDestinationResponse).new(response)
    end

    # Creates and assigns an IAM policy that grants permissions to CloudWatch Logs to deliver logs
    # cross-account to a specified destination in this account. To configure the delivery of logs from
    # an Amazon Web Services service in another account to a logs delivery destination in the current
    # account, you must do the following:
    #
    # - Create a delivery source, which is a logical object that represents the resource that is
    # actually sending the logs. For more information, see
    # [PutDeliverySource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html).
    #
    # - Create a *delivery destination*, which is a logical object that represents the actual delivery
    # destination. For more information, see
    # [PutDeliveryDestination](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html).
    #
    # - Use this operation in the destination account to assign an IAM policy to the destination. This
    # policy allows delivery to that destination.
    #
    # - Create a *delivery* by pairing exactly one delivery source and one delivery destination. For
    # more information, see
    # [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html).
    #
    # Only some Amazon Web Services services support being configured as a delivery source. These
    # services are listed as **Supported [V2 Permissions]** in the table at [Enabling logging from
    # Amazon Web Services
    # services.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html)
    #
    # The contents of the policy must include two statements. One statement enables general logs
    # delivery, and the other allows delivery to the chosen destination. See the examples for the
    # needed policies.
    def put_delivery_destination_policy(input : ACWL::PutDeliveryDestinationPolicyRequest) : Core::ParsedResponse(ACWL::PutDeliveryDestinationPolicyResponse)
      Log.info { "performing 'PutDeliveryDestinationPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("PutDeliveryDestinationPolicy", "/", input.to_json)
      Core::ParsedResponse(ACWL::PutDeliveryDestinationPolicyResponse).new(response)
    end

    # Creates or updates a logical *delivery source*. A delivery source represents an Amazon Web
    # Services resource that sends logs to an logs delivery destination. The destination can be
    # CloudWatch Logs, Amazon S3, Firehose or X-Ray for sending traces.
    #
    # To configure logs delivery between a delivery destination and an Amazon Web Services service
    # that is supported as a delivery source, you must do the following:
    #
    # - Use `PutDeliverySource` to create a delivery source, which is a logical object that represents
    # the resource that is actually sending the logs.
    #
    # - Use `PutDeliveryDestination` to create a *delivery destination*, which is a logical object
    # that represents the actual delivery destination. For more information, see
    # [PutDeliveryDestination](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html).
    #
    # - If you are delivering logs cross-account, you must use
    # [PutDeliveryDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html)
    # in the destination account to assign an IAM policy to the destination. This policy allows
    # delivery to that destination.
    #
    # - Use `CreateDelivery` to create a *delivery* by pairing exactly one delivery source and one
    # delivery destination. For more information, see
    # [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html).
    #
    # You can configure a single delivery source to send logs to multiple destinations by creating
    # multiple deliveries. You can also create multiple deliveries to configure multiple delivery
    # sources to send logs to the same delivery destination.
    #
    # Only some Amazon Web Services services support being configured as a delivery source. These
    # services are listed as **Supported [V2 Permissions]** in the table at [Enabling logging from
    # Amazon Web Services
    # services.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html)
    #
    # If you use this operation to update an existing delivery source, all the current delivery source
    # parameters are overwritten with the new parameter values that you specify.
    def put_delivery_source(input : ACWL::PutDeliverySourceRequest) : Core::ParsedResponse(ACWL::PutDeliverySourceResponse)
      Log.info { "performing 'PutDeliverySource' operation" }
      input.validate! if config.validate_input?
      response = post("PutDeliverySource", "/", input.to_json)
      Core::ParsedResponse(ACWL::PutDeliverySourceResponse).new(response)
    end

    # Creates or updates a destination. This operation is used only to create destinations for
    # cross-account subscriptions.
    #
    # A destination encapsulates a physical resource (such as an Amazon Kinesis stream). With a
    # destination, you can subscribe to a real-time stream of log events for a different account,
    # ingested using
    # [PutLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html).
    #
    # Through an access policy, a destination controls what is written to it. By default,
    # `PutDestination` does not set any access policy with the destination, which means a
    # cross-account user cannot call
    # [PutSubscriptionFilter](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutSubscriptionFilter.html)
    # against this destination. To enable this, the destination owner must call
    # [PutDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html)
    # after `PutDestination`.
    #
    # To perform a `PutDestination` operation, you must also have the `iam:PassRole` permission.
    def put_destination(input : ACWL::PutDestinationRequest) : Core::ParsedResponse(ACWL::PutDestinationResponse)
      Log.info { "performing 'PutDestination' operation" }
      input.validate! if config.validate_input?
      response = post("PutDestination", "/", input.to_json)
      Core::ParsedResponse(ACWL::PutDestinationResponse).new(response)
    end

    # Creates or updates an access policy associated with an existing destination. An access policy is
    # an [IAM policy
    # document](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies_overview.html) that is used
    # to authorize claims to register a subscription filter against a given destination.
    def put_destination_policy(input : ACWL::PutDestinationPolicyRequest) : Core::Response
      Log.info { "performing 'PutDestinationPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("PutDestinationPolicy", "/", input.to_json)
      Core::Response.new(response)
    end

    # Creates or updates a *field index policy* for the specified log group. Only log groups in the
    # Standard log class support field index policies. For more information about log classes, see
    # [Log
    # classes](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html).
    #
    # You can use field index policies to create *field indexes* on fields found in log events in the
    # log group. Creating field indexes speeds up and lowers the costs for CloudWatch Logs Insights
    # queries that reference those field indexes, because these queries attempt to skip the processing
    # of log events that are known to not match the indexed field. Good fields to index are fields
    # that you often need to query for and fields or values that match only a small fraction of the
    # total log events. Common examples of indexes include request ID, session ID, userID, and
    # instance IDs. For more information, see [Create field indexes to improve query performance and
    # reduce
    # costs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing.html).
    #
    # You can configure indexed fields as *facets* to enable interactive exploration and filtering of
    # your logs in the CloudWatch Logs Insights console. Facets allow you to view value distributions
    # and counts for indexed fields without running queries. When you create a field index, you can
    # optionally set it as a facet to enable this interactive analysis capability. For more
    # information, see [Use facets to group and explore
    # logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Facets.html).
    #
    # To find the fields that are in your log group events, use the
    # [GetLogGroupFields](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogGroupFields.html)
    # operation.
    #
    # For example, suppose you have created a field index for `requestId`. Then, any CloudWatch Logs
    # Insights query on that log group that includes `requestId = *value* ` or `requestId IN [*value*,
    # *value*, ...]` will process fewer log events to reduce costs, and have improved performance.
    #
    # CloudWatch Logs provides default field indexes for all log groups in the Standard log class.
    # Default field indexes are automatically available for the following fields:
    #
    # - `@logStream`
    #
    # - `@aws.region`
    #
    # - `@aws.account`
    #
    # - `@source.log`
    #
    # - `traceId`
    #
    # Default field indexes are in addition to any custom field indexes you define within your policy.
    # Default field indexes are not counted towards your field index quota.
    #
    # Each index policy has the following quotas and restrictions:
    #
    # - As many as 20 fields can be included in the policy.
    #
    # - Each field name can include as many as 100 characters.
    #
    # Matches of log events to the names of indexed fields are case-sensitive. For example, a field
    # index of `RequestId` won't match a log event containing `requestId`.
    #
    # Log group-level field index policies created with `PutIndexPolicy` override account-level field
    # index policies created with
    # [PutAccountPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutAccountPolicy.html)
    # that apply to log groups. If you use `PutIndexPolicy` to create a field index policy for a log
    # group, that log group uses only that policy for log group-level indexing, including any facet
    # configurations. The log group ignores any account-wide field index policy that applies to log
    # groups, but data source-based account policies may still apply.
    def put_index_policy(input : ACWL::PutIndexPolicyRequest) : Core::ParsedResponse(ACWL::PutIndexPolicyResponse)
      Log.info { "performing 'PutIndexPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("PutIndexPolicy", "/", input.to_json)
      Core::ParsedResponse(ACWL::PutIndexPolicyResponse).new(response)
    end

    # Creates an integration between CloudWatch Logs and another service in this account. Currently,
    # only integrations with OpenSearch Service are supported, and currently you can have only one
    # integration in your account.
    #
    # Integrating with OpenSearch Service makes it possible for you to create curated vended logs
    # dashboards, powered by OpenSearch Service analytics. For more information, see [Vended log
    # dashboards powered by Amazon OpenSearch
    # Service](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-OpenSearch-Dashboards.html).
    #
    # You can use this operation only to create a new integration. You can't modify an existing
    # integration.
    def put_integration(input : ACWL::PutIntegrationRequest) : Core::ParsedResponse(ACWL::PutIntegrationResponse)
      Log.info { "performing 'PutIntegration' operation" }
      input.validate! if config.validate_input?
      response = post("PutIntegration", "/", input.to_json)
      Core::ParsedResponse(ACWL::PutIntegrationResponse).new(response)
    end

    # Uploads a batch of log events to the specified log stream.
    #
    # The sequence token is now ignored in `PutLogEvents` actions. `PutLogEvents` actions are always
    # accepted and never return `InvalidSequenceTokenException` or `DataAlreadyAcceptedException` even
    # if the sequence token is not valid. You can use parallel `PutLogEvents` actions on the same log
    # stream.
    #
    # The batch of events must satisfy the following constraints:
    #
    # - The maximum batch size is 1,048,576 bytes. This size is calculated as the sum of all event
    # messages in UTF-8, plus 26 bytes for each log event.
    #
    # - Events more than 2 hours in the future are rejected while processing remaining valid events.
    #
    # - Events older than 14 days or preceding the log group's retention period are rejected while
    # processing remaining valid events.
    #
    # - The log events in the batch must be in chronological order by their timestamp. The timestamp
    # is the time that the event occurred, expressed as the number of milliseconds after `Jan 1, 1970
    # 00:00:00 UTC`. (In Amazon Web Services Tools for PowerShell and the Amazon Web Services SDK for
    # .NET, the timestamp is specified in .NET format: `yyyy-mm-ddThh:mm:ss`. For example,
    # `2017-09-15T13:45:30`.)
    #
    # - A batch of log events in a single request must be in a chronological order. Otherwise, the
    # operation fails.
    #
    # - Each log event can be no larger than 1 MB.
    #
    # - The maximum number of log events in a batch is 10,000.
    #
    # - For valid events (within 14 days in the past to 2 hours in future), the time span in a single
    # batch cannot exceed 24 hours. Otherwise, the operation fails.
    #
    # The quota of five requests per second per log stream has been removed. Instead, `PutLogEvents`
    # actions are throttled based on a per-second per-account quota. You can request an increase to
    # the per-second throttling quota by using the Service Quotas service.
    #
    # If a call to `PutLogEvents` returns "UnrecognizedClientException" the most likely cause is a
    # non-valid Amazon Web Services access key ID or secret key.
    def put_log_events(input : ACWL::PutLogEventsRequest) : Core::ParsedResponse(ACWL::PutLogEventsResponse)
      Log.info { "performing 'PutLogEvents' operation" }
      input.validate! if config.validate_input?
      response = post("PutLogEvents", "/", input.to_json)
      Core::ParsedResponse(ACWL::PutLogEventsResponse).new(response)
    end

    # Enables or disables deletion protection for the specified log group. When enabled on a log
    # group, deletion protection blocks all deletion operations until it is explicitly disabled.
    #
    # For information about the parameters that are common to all actions, see [Common
    # Parameters](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/CommonParameters.html).
    def put_log_group_deletion_protection(input : ACWL::PutLogGroupDeletionProtectionRequest) : Core::Response
      Log.info { "performing 'PutLogGroupDeletionProtection' operation" }
      input.validate! if config.validate_input?
      response = post("PutLogGroupDeletionProtection", "/", input.to_json)
      Core::Response.new(response)
    end

    # Creates or updates a metric filter and associates it with the specified log group. With metric
    # filters, you can configure rules to extract metric data from log events ingested through
    # [PutLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html).
    #
    # The maximum number of metric filters that can be associated with a log group is 100.
    #
    # Using regular expressions in filter patterns is supported. For these filters, there is a quota
    # of two regular expression patterns within a single filter pattern. There is also a quota of five
    # regular expression patterns per log group. For more information about using regular expressions
    # in filter patterns, see [ Filter pattern syntax for metric filters, subscription filters, filter
    # log events, and Live
    # Tail](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html).
    #
    # When you create a metric filter, you can also optionally assign a unit and dimensions to the
    # metric that is created.
    #
    # Metrics extracted from log events are charged as custom metrics. To prevent unexpected high
    # charges, do not specify high-cardinality fields such as `IPAddress` or `requestID` as
    # dimensions. Each different value found for a dimension is treated as a separate metric and
    # accrues charges as a separate custom metric.
    #
    # CloudWatch Logs might disable a metric filter if it generates 1,000 different name/value pairs
    # for your specified dimensions within one hour.
    #
    # You can also set up a billing alarm to alert you if your charges are higher than expected. For
    # more information, see [ Creating a Billing Alarm to Monitor Your Estimated Amazon Web Services
    # Charges](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html).
    def put_metric_filter(input : ACWL::PutMetricFilterRequest) : Core::Response
      Log.info { "performing 'PutMetricFilter' operation" }
      input.validate! if config.validate_input?
      response = post("PutMetricFilter", "/", input.to_json)
      Core::Response.new(response)
    end

    # Creates or updates a query definition for CloudWatch Logs Insights. For more information, see
    # [Analyzing Log Data with CloudWatch Logs
    # Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html).
    #
    # To update a query definition, specify its `queryDefinitionId` in your request. The values of
    # `name`, `queryString`, and `logGroupNames` are changed to the values that you specify in your
    # update operation. No current values are retained from the current query definition. For example,
    # imagine updating a current query definition that includes log groups. If you don't specify the
    # `logGroupNames` parameter in your update operation, the query definition changes to contain no
    # log groups.
    #
    # You must have the `logs:PutQueryDefinition` permission to be able to perform this operation.
    def put_query_definition(input : ACWL::PutQueryDefinitionRequest) : Core::ParsedResponse(ACWL::PutQueryDefinitionResponse)
      Log.info { "performing 'PutQueryDefinition' operation" }
      input.validate! if config.validate_input?
      response = post("PutQueryDefinition", "/", input.to_json)
      Core::ParsedResponse(ACWL::PutQueryDefinitionResponse).new(response)
    end

    # Creates or updates a resource policy allowing other Amazon Web Services services to put log
    # events to this account, such as Amazon Route 53. This API has the following restrictions:
    #
    # - **Supported actions** - Policy only supports `logs:PutLogEvents` and `logs:CreateLogStream `
    # actions
    #
    # - **Supported principals** - Policy only applies when operations are invoked by Amazon Web
    # Services service principals (not IAM users, roles, or cross-account principals
    #
    # - **Policy limits** - An account can have a maximum of 10 policies without resourceARN and one
    # per LogGroup resourceARN
    #
    # Resource policies with actions invoked by non-Amazon Web Services service principals (such as
    # IAM users, roles, or other Amazon Web Services accounts) will not be enforced. For access
    # control involving these principals, use the IAM policies.
    def put_resource_policy(input : ACWL::PutResourcePolicyRequest) : Core::ParsedResponse(ACWL::PutResourcePolicyResponse)
      Log.info { "performing 'PutResourcePolicy' operation" }
      input.validate! if config.validate_input?
      response = post("PutResourcePolicy", "/", input.to_json)
      Core::ParsedResponse(ACWL::PutResourcePolicyResponse).new(response)
    end

    # Sets the retention of the specified log group. With a retention policy, you can configure the
    # number of days for which to retain log events in the specified log group.
    #
    # CloudWatch Logs doesn't immediately delete log events when they reach their retention setting.
    # It typically takes up to 72 hours after that before log events are deleted, but in rare
    # situations might take longer.
    #
    # To illustrate, imagine that you change a log group to have a longer retention setting when it
    # contains log events that are past the expiration date, but haven't been deleted. Those log
    # events will take up to 72 hours to be deleted after the new retention date is reached. To make
    # sure that log data is deleted permanently, keep a log group at its lower retention setting until
    # 72 hours after the previous retention period ends. Alternatively, wait to change the retention
    # setting until you confirm that the earlier log events are deleted.
    #
    # When log events reach their retention setting they are marked for deletion. After they are
    # marked for deletion, they do not add to your archival storage costs anymore, even if they are
    # not actually deleted until later. These log events marked for deletion are also not included
    # when you use an API to retrieve the `storedBytes` value to see how many bytes a log group is
    # storing.
    def put_retention_policy(input : ACWL::PutRetentionPolicyRequest) : Core::Response
      Log.info { "performing 'PutRetentionPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("PutRetentionPolicy", "/", input.to_json)
      Core::Response.new(response)
    end

    # Sets the storage tier policy for the account. When you set the storage tier to
    # `INTELLIGENT_TIERING`, the service automatically moves log data to the most cost-effective
    # storage tier based on access frequency.
    def put_storage_tier_policy(input : ACWL::PutStorageTierPolicyRequest) : Core::ParsedResponse(ACWL::PutStorageTierPolicyResponse)
      Log.info { "performing 'PutStorageTierPolicy' operation" }
      input.validate! if config.validate_input?
      response = post("PutStorageTierPolicy", "/", input.to_json)
      Core::ParsedResponse(ACWL::PutStorageTierPolicyResponse).new(response)
    end

    # Creates or updates a subscription filter and associates it with the specified log group. With
    # subscription filters, you can subscribe to a real-time stream of log events ingested through
    # [PutLogEvents](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html)
    # and have them delivered to a specific destination. When log events are sent to the receiving
    # service, they are Base64 encoded and compressed with the GZIP format.
    #
    # The following destinations are supported for subscription filters:
    #
    # - An Amazon Kinesis data stream belonging to the same account as the subscription filter, for
    # same-account delivery.
    #
    # - A logical destination created with
    # [PutDestination](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html)
    # that belongs to a different account, for cross-account delivery. We currently support Kinesis
    # Data Streams and Firehose as logical destinations.
    #
    # - An Amazon Kinesis Data Firehose delivery stream that belongs to the same account as the
    # subscription filter, for same-account delivery.
    #
    # - An Lambda function that belongs to the same account as the subscription filter, for
    # same-account delivery.
    #
    # Each log group can have up to two subscription filters associated with it. If you are updating
    # an existing filter, you must specify the correct name in `filterName`.
    #
    # Using regular expressions in filter patterns is supported. For these filters, there is a quotas
    # of quota of two regular expression patterns within a single filter pattern. There is also a
    # quota of five regular expression patterns per log group. For more information about using
    # regular expressions in filter patterns, see [ Filter pattern syntax for metric filters,
    # subscription filters, filter log events, and Live
    # Tail](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html).
    #
    # To perform a `PutSubscriptionFilter` operation for any destination except a Lambda function, you
    # must also have the `iam:PassRole` permission.
    def put_subscription_filter(input : ACWL::PutSubscriptionFilterRequest) : Core::Response
      Log.info { "performing 'PutSubscriptionFilter' operation" }
      input.validate! if config.validate_input?
      response = post("PutSubscriptionFilter", "/", input.to_json)
      Core::Response.new(response)
    end

    # Creates or updates a syslog configuration for a log group. This enables ingestion of syslog data
    # through the specified VPC endpoint into the log group.
    def put_syslog_configuration(input : ACWL::PutSyslogConfigurationRequest) : Core::Response
      Log.info { "performing 'PutSyslogConfiguration' operation" }
      input.validate! if config.validate_input?
      response = post("PutSyslogConfiguration", "/", input.to_json)
      Core::Response.new(response)
    end

    # Creates or updates a *log transformer* for a single log group. You use log transformers to
    # transform log events into a different format, making them easier for you to process and analyze.
    # You can also transform logs from different sources into standardized formats that contains
    # relevant, source-specific information.
    #
    # After you have created a transformer, CloudWatch Logs performs the transformations at the time
    # of log ingestion. You can then refer to the transformed versions of the logs during operations
    # such as querying with CloudWatch Logs Insights or creating metric filters or subscription
    # filers.
    #
    # You can also use a transformer to copy metadata from metadata keys into the log events
    # themselves. This metadata can include log group name, log stream name, account ID and Region.
    #
    # A transformer for a log group is a series of processors, where each processor applies one type
    # of transformation to the log events ingested into this log group. The processors work one after
    # another, in the order that you list them, like a pipeline. For more information about the
    # available processors to use in a transformer, see [ Processors that you can
    # use](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-Processors).
    #
    # Having log events in standardized format enables visibility across your applications for your
    # log analysis, reporting, and alarming needs. CloudWatch Logs provides transformation for common
    # log types with out-of-the-box transformation templates for major Amazon Web Services log sources
    # such as VPC flow logs, Lambda, and Amazon RDS. You can use pre-built transformation templates or
    # create custom transformation policies.
    #
    # You can create transformers only for the log groups in the Standard log class.
    #
    # You can also set up a transformer at the account level. For more information, see
    # [PutAccountPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutAccountPolicy.html).
    # If there is both a log-group level transformer created with `PutTransformer` and an
    # account-level transformer that could apply to the same log group, the log group uses only the
    # log-group level transformer. It ignores the account-level transformer.
    def put_transformer(input : ACWL::PutTransformerRequest) : Core::Response
      Log.info { "performing 'PutTransformer' operation" }
      input.validate! if config.validate_input?
      response = post("PutTransformer", "/", input.to_json)
      Core::Response.new(response)
    end

    # Starts a query of one or more log groups or data sources using CloudWatch Logs Insights. You
    # specify the log groups or data sources and time range to query and the query string to use. You
    # can query up to 10 data sources in a single query.
    #
    # For more information, see [CloudWatch Logs Insights Query
    # Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html).
    #
    # After you run a query using `StartQuery`, the query results are stored by CloudWatch Logs. You
    # can use
    # [GetQueryResults](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html)
    # to retrieve the results of a query, using the `queryId` that `StartQuery` returns.
    #
    # Interactive queries started with `StartQuery` share concurrency limits with automated scheduled
    # query executions. Both types of queries count toward the same regional concurrent query quota,
    # so high scheduled query activity may affect the availability of concurrent slots for interactive
    # queries.
    #
    # To specify the log groups to query, a `StartQuery` operation must include one of the following:
    #
    # - Either exactly one of the following parameters: `logGroupName`, `logGroupNames`, or
    # `logGroupIdentifiers`
    #
    # - Or the `queryString` must include a `SOURCE` command to select log groups for the query. The
    # `SOURCE` command can select log groups based on log group name prefix, account ID, and log
    # class, or select data sources using dataSource syntax in LogsQL, PPL, and SQL. In LogsQL, the
    # `SOURCE` command also supports filtering by log group tags.
    #
    # For more information about the `SOURCE` command, see
    # [SOURCE](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax-Source.html).
    #
    # If you have associated a KMS key with the query results in this account, then
    # [StartQuery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html)
    # uses that key to encrypt the results when it stores them. If no key is associated with query
    # results, the query results are encrypted with the default CloudWatch Logs encryption method.
    #
    # Queries time out after 60 minutes of runtime. If your queries are timing out, reduce the time
    # range being searched or partition your query into a number of queries.
    #
    # If you are using CloudWatch cross-account observability, you can use this operation in a
    # monitoring account to start a query in a linked source account. For more information, see
    # [CloudWatch cross-account
    # observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
    # For a cross-account `StartQuery` operation, the query definition must be defined in the
    # monitoring account.
    #
    # You can have up to 100 concurrent CloudWatch Logs insights queries, including queries that have
    # been added to dashboards.
    def start_query(input : ACWL::StartQueryRequest) : Core::ParsedResponse(ACWL::StartQueryResponse)
      Log.info { "performing 'StartQuery' operation" }
      input.validate! if config.validate_input?
      response = post("StartQuery", "/", input.to_json)
      Core::ParsedResponse(ACWL::StartQueryResponse).new(response)
    end

    # Stops a CloudWatch Logs Insights query that is in progress. If the query has already ended, the
    # operation returns an error indicating that the specified query is not running.
    #
    # This operation can be used to cancel both interactive queries and individual scheduled query
    # executions. When used with scheduled queries, `StopQuery` cancels only the specific execution
    # identified by the query ID, not the scheduled query configuration itself.
    def stop_query(input : ACWL::StopQueryRequest) : Core::ParsedResponse(ACWL::StopQueryResponse)
      Log.info { "performing 'StopQuery' operation" }
      input.validate! if config.validate_input?
      response = post("StopQuery", "/", input.to_json)
      Core::ParsedResponse(ACWL::StopQueryResponse).new(response)
    end

    # The TagLogGroup operation is on the path to deprecation. We recommend that you use
    # [TagResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html)
    # instead.
    #
    # Adds or updates the specified tags for the specified log group.
    #
    # To list the tags for a log group, use
    # [ListTagsForResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html).
    # To remove tags, use
    # [UntagResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html).
    #
    # For more information about tags, see [Tag Log Groups in Amazon CloudWatch
    # Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html#log-group-tagging)
    # in the *Amazon CloudWatch Logs User Guide*.
    #
    # CloudWatch Logs doesn't support IAM policies that prevent users from assigning specified tags to
    # log groups using the `aws:Resource/*key-name* ` or `aws:TagKeys` condition keys. For more
    # information about using tags to control access, see [Controlling access to Amazon Web Services
    # resources using tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html).
    def tag_log_group(input : ACWL::TagLogGroupRequest) : Core::Response
      Log.info { "performing 'TagLogGroup' operation" }
      input.validate! if config.validate_input?
      response = post("TagLogGroup", "/", input.to_json)
      Core::Response.new(response)
    end

    # Assigns one or more tags (key-value pairs) to the specified CloudWatch Logs resource. Currently,
    # the only CloudWatch Logs resources that can be tagged are log groups and destinations.
    #
    # Tags can help you organize and categorize your resources. You can also use them to scope user
    # permissions by granting a user permission to access or change only resources with certain tag
    # values.
    #
    # Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as
    # strings of characters.
    #
    # You can use the `TagResource` action with a resource that already has tags. If you specify a new
    # tag key for the alarm, this tag is appended to the list of tags associated with the alarm. If
    # you specify a tag key that is already associated with the alarm, the new tag value that you
    # specify replaces the previous value for that tag.
    #
    # You can associate as many as 50 tags with a CloudWatch Logs resource.
    def tag_resource(input : ACWL::TagResourceRequest) : Core::Response
      Log.info { "performing 'TagResource' operation" }
      input.validate! if config.validate_input?
      response = post("TagResource", "/", input.to_json)
      Core::Response.new(response)
    end

    # Tests the filter pattern of a metric filter against a sample of log event messages. You can use
    # this operation to validate the correctness of a metric filter pattern.
    def test_metric_filter(input : ACWL::TestMetricFilterRequest) : Core::ParsedResponse(ACWL::TestMetricFilterResponse)
      Log.info { "performing 'TestMetricFilter' operation" }
      input.validate! if config.validate_input?
      response = post("TestMetricFilter", "/", input.to_json)
      Core::ParsedResponse(ACWL::TestMetricFilterResponse).new(response)
    end

    # Use this operation to test a log transformer. You enter the transformer configuration and a set
    # of log events to test with. The operation responds with an array that includes the original log
    # events and the transformed versions.
    def test_transformer(input : ACWL::TestTransformerRequest) : Core::ParsedResponse(ACWL::TestTransformerResponse)
      Log.info { "performing 'TestTransformer' operation" }
      input.validate! if config.validate_input?
      response = post("TestTransformer", "/", input.to_json)
      Core::ParsedResponse(ACWL::TestTransformerResponse).new(response)
    end

    # The UntagLogGroup operation is on the path to deprecation. We recommend that you use
    # [UntagResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html)
    # instead.
    #
    # Removes the specified tags from the specified log group.
    #
    # To list the tags for a log group, use
    # [ListTagsForResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html).
    # To add tags, use
    # [TagResource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html).
    #
    # When using IAM policies to control tag management for CloudWatch Logs log groups, the condition
    # keys `aws:Resource/key-name` and `aws:TagKeys` cannot be used to restrict which tags users can
    # assign.
    def untag_log_group(input : ACWL::UntagLogGroupRequest) : Core::Response
      Log.info { "performing 'UntagLogGroup' operation" }
      input.validate! if config.validate_input?
      response = post("UntagLogGroup", "/", input.to_json)
      Core::Response.new(response)
    end

    # Removes one or more tags from the specified resource.
    def untag_resource(input : ACWL::UntagResourceRequest) : Core::Response
      Log.info { "performing 'UntagResource' operation" }
      input.validate! if config.validate_input?
      response = post("UntagResource", "/", input.to_json)
      Core::Response.new(response)
    end

    # Use this operation to *suppress* anomaly detection for a specified anomaly or pattern. If you
    # suppress an anomaly, CloudWatch Logs won't report new occurrences of that anomaly and won't
    # update that anomaly with new data. If you suppress a pattern, CloudWatch Logs won't report any
    # anomalies related to that pattern.
    #
    # You must specify either `anomalyId` or `patternId`, but you can't specify both parameters in the
    # same operation.
    #
    # If you have previously used this operation to suppress detection of a pattern or anomaly, you
    # can use it again to cause CloudWatch Logs to end the suppression. To do this, use this operation
    # and specify the anomaly or pattern to stop suppressing, and omit the `suppressionType` and
    # `suppressionPeriod` parameters.
    def update_anomaly(input : ACWL::UpdateAnomalyRequest) : Core::Response
      Log.info { "performing 'UpdateAnomaly' operation" }
      input.validate! if config.validate_input?
      response = post("UpdateAnomaly", "/", input.to_json)
      Core::Response.new(response)
    end

    # Use this operation to update the configuration of a
    # [delivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_Delivery.html)
    # to change either the S3 path pattern or the format of the delivered logs. You can't use this
    # operation to change the source or destination of the delivery.
    def update_delivery_configuration(input : ACWL::UpdateDeliveryConfigurationRequest) : Core::ParsedResponse(ACWL::UpdateDeliveryConfigurationResponse)
      Log.info { "performing 'UpdateDeliveryConfiguration' operation" }
      input.validate! if config.validate_input?
      response = post("UpdateDeliveryConfiguration", "/", input.to_json)
      Core::ParsedResponse(ACWL::UpdateDeliveryConfigurationResponse).new(response)
    end

    # Updates an existing log anomaly detector.
    def update_log_anomaly_detector(input : ACWL::UpdateLogAnomalyDetectorRequest) : Core::Response
      Log.info { "performing 'UpdateLogAnomalyDetector' operation" }
      input.validate! if config.validate_input?
      response = post("UpdateLogAnomalyDetector", "/", input.to_json)
      Core::Response.new(response)
    end

    # Updates an existing lookup table by replacing all of its content with new CSV data or CloudWatch
    # Logs query results. After the update completes, queries that use this table use the new data.
    #
    # This is a full replacement operation. All existing content is replaced. You must specify either
    # `tableBody` or `queryId`, but not both.
    def update_lookup_table(input : ACWL::UpdateLookupTableRequest) : Core::ParsedResponse(ACWL::UpdateLookupTableResponse)
      Log.info { "performing 'UpdateLookupTable' operation" }
      input.validate! if config.validate_input?
      response = post("UpdateLookupTable", "/", input.to_json)
      Core::ParsedResponse(ACWL::UpdateLookupTableResponse).new(response)
    end

    # Updates an existing scheduled query with new configuration. This operation uses PUT semantics,
    # allowing modification of query parameters, schedule, and destinations.
    def update_scheduled_query(input : ACWL::UpdateScheduledQueryRequest) : Core::ParsedResponse(ACWL::UpdateScheduledQueryResponse)
      Log.info { "performing 'UpdateScheduledQuery' operation" }
      input.validate! if config.validate_input?
      response = post("UpdateScheduledQuery", "/", input.to_json)
      Core::ParsedResponse(ACWL::UpdateScheduledQueryResponse).new(response)
    end
  end
end
