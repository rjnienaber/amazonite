private alias ACW = Amazonite::CloudWatch
private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class Client < Core::Client
    Log               = ::Log.for("amazonite.cloudwatch.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("GraniteServiceVersion20100801", "monitoring", "1.0", EXCEPTION_FACTORY, config)
    end

    # Associates an Amazon Web Services Key Management Service (Amazon Web Services KMS) customer
    # managed key with the specified dataset. After this operation completes, all data published to
    # the dataset is encrypted at rest using the specified KMS key. Callers must have `kms:Decrypt`
    # permission on the key to read the encrypted data.
    #
    # Only the `default` dataset is supported. The `default` dataset is implicit for every account in
    # every Region — you do not need to create it before calling this operation.
    #
    # You can call `AssociateDatasetKmsKey` on a dataset that is already associated with a KMS key to
    # replace the existing key with a different one. The caller must have `kms:Decrypt` permission on
    # both the current key and the new key.
    #
    # If the currently associated key has been deleted, is scheduled for deletion, is pending import,
    # is unavailable, or has been disabled, Amazon CloudWatch does not require `kms:Decrypt`
    # permission on the current key and the rotation proceeds. If the key was only disabled, consider
    # re-enabling it instead of rotating, because re-enabling allows Amazon CloudWatch to resume
    # decrypting your existing metric data encrypted with that key.
    #
    # The KMS key that you specify must meet all of the following requirements:
    #
    # - It must be a symmetric encryption KMS key (key spec `SYMMETRIC_DEFAULT`, key usage
    # `ENCRYPT_DECRYPT`). Asymmetric keys, HMAC keys, and key material types other than
    # `SYMMETRIC_DEFAULT` are not supported.
    #
    # - It must be enabled and not pending deletion.
    #
    # - Its key policy must grant the CloudWatch service principal (`cloudwatch.amazonaws.com`) these
    # permissions: `kms:DescribeKey`, `kms:GenerateDataKey`, `kms:Encrypt`, `kms:Decrypt`, and
    # `kms:ReEncrypt*`. Amazon CloudWatch requires these permissions to manage the data on your
    # behalf.
    #
    # - The calling principal must have `kms:Decrypt` permission on the key.
    #
    # - It must be specified as a fully qualified key ARN. Key IDs, aliases, and alias ARNs are not
    # accepted.
    #
    # - It must be in the same Amazon Web Services Region as the dataset.
    #
    # Before completing the association, Amazon CloudWatch validates the key by performing a series of
    # dry-run KMS operations. Service-principal checks run first to verify that the key policy grants
    # the required access to Amazon CloudWatch. These checks include `kms:DescribeKey`,
    # `kms:GenerateDataKey`, `kms:Encrypt`, `kms:Decrypt`, and `kms:ReEncrypt*`. After those succeed,
    # a `kms:Decrypt` dry-run is run with the caller's credentials to verify that the calling
    # principal can use the new key. When you are replacing an existing key, the caller's
    # `kms:Decrypt` dry-run is also run on the current key.
    #
    # If any of these checks on the new key fails, the operation fails and the existing key
    # association (if any) remains unchanged. Common failure causes include the new key being
    # disabled, the key policy not granting the required permissions to Amazon CloudWatch, or the
    # caller lacking `kms:Decrypt` permission on the new key.
    #
    # For more information about using customer managed keys with Amazon CloudWatch, see [Encryption
    # at rest with customer managed
    # keys](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cmk-encryption.html) in the
    # *Amazon CloudWatch User Guide*.
    def associate_dataset_kms_key(input : ACW::AssociateDatasetKmsKeyInput) : Core::ParsedResponse(ACW::AssociateDatasetKmsKeyOutput)
      Log.info { "performing 'AssociateDatasetKmsKey' operation" }
      input.validate! if config.validate_input?
      response = post("AssociateDatasetKmsKey", "/", input.to_json)
      Core::ParsedResponse(ACW::AssociateDatasetKmsKeyOutput).new(response)
    end

    # Deletes a specific alarm mute rule.
    #
    # When you delete a mute rule, any alarms that are currently being muted by that rule are
    # immediately unmuted. If those alarms are in an ALARM state, their configured actions will
    # trigger.
    #
    # This operation is idempotent. If you delete a mute rule that does not exist, the operation
    # succeeds without returning an error.
    #
    # **Permissions**
    #
    # To delete a mute rule, you need the `cloudwatch:DeleteAlarmMuteRule` permission on the alarm
    # mute rule resource.
    def delete_alarm_mute_rule(input : ACW::DeleteAlarmMuteRuleInput) : Core::Response
      Log.info { "performing 'DeleteAlarmMuteRule' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteAlarmMuteRule", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes the specified alarms. You can delete up to 100 alarms in one operation. However, this
    # total can include no more than one composite alarm. For example, you could delete 99 metric
    # alarms and one composite alarms with one operation, but you can't delete two composite alarms
    # with one operation. Log alarms cannot be batch deleted.
    #
    # If you specify any incorrect alarm names, the alarms you specify with correct names are still
    # deleted. Other syntax errors might result in no alarms being deleted. To confirm that alarms
    # were deleted successfully, you can use the
    # [DescribeAlarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeAlarms.html)
    # operation after using `DeleteAlarms`.
    #
    # It is possible to create a loop or cycle of composite alarms, where composite alarm A depends on
    # composite alarm B, and composite alarm B also depends on composite alarm A. In this scenario,
    # you can't delete any composite alarm that is part of the cycle because there is always still a
    # composite alarm that depends on that alarm that you want to delete.
    #
    # To get out of such a situation, you must break the cycle by changing the rule of one of the
    # composite alarms in the cycle to remove a dependency that creates the cycle. The simplest change
    # to make to break a cycle is to change the `AlarmRule` of one of the alarms to `false`.
    #
    # Additionally, the evaluation of composite alarms stops if CloudWatch detects a cycle in the
    # evaluation path.
    def delete_alarms(input : ACW::DeleteAlarmsInput) : Core::Response
      Log.info { "performing 'DeleteAlarms' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteAlarms", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes the specified anomaly detection model from your account. For more information about how
    # to delete an anomaly detection model, see [Deleting an anomaly detection
    # model](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Anomaly_Detection_Alarm.html#Delete_Anomaly_Detection_Model)
    # in the *CloudWatch User Guide*.
    def delete_anomaly_detector(input : ACW::DeleteAnomalyDetectorInput) : Core::ParsedResponse(ACW::DeleteAnomalyDetectorOutput)
      Log.info { "performing 'DeleteAnomalyDetector' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteAnomalyDetector", "/", input.to_json)
      Core::ParsedResponse(ACW::DeleteAnomalyDetectorOutput).new(response)
    end

    # Deletes all dashboards that you specify. You can specify up to 100 dashboards to delete. If
    # there is an error during this call, the operation attempts to delete as many dashboards as
    # possible.
    def delete_dashboards(input : ACW::DeleteDashboardsInput) : Core::ParsedResponse(ACW::DeleteDashboardsOutput)
      Log.info { "performing 'DeleteDashboards' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteDashboards", "/", input.to_json)
      Core::ParsedResponse(ACW::DeleteDashboardsOutput).new(response)
    end

    # Permanently deletes the specified Contributor Insights rules.
    #
    # If you create a rule, delete it, and then re-create it with the same name, historical data from
    # the first time the rule was created might not be available.
    def delete_insight_rules(input : ACW::DeleteInsightRulesInput) : Core::ParsedResponse(ACW::DeleteInsightRulesOutput)
      Log.info { "performing 'DeleteInsightRules' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteInsightRules", "/", input.to_json)
      Core::ParsedResponse(ACW::DeleteInsightRulesOutput).new(response)
    end

    # Permanently deletes the metric stream that you specify.
    def delete_metric_stream(input : ACW::DeleteMetricStreamInput) : Core::ParsedResponse(ACW::DeleteMetricStreamOutput)
      Log.info { "performing 'DeleteMetricStream' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteMetricStream", "/", input.to_json)
      Core::ParsedResponse(ACW::DeleteMetricStreamOutput).new(response)
    end

    # Returns the information of the current alarm contributors that are in `ALARM` state. This
    # operation returns details about the individual time series that contribute to the alarm's state.
    def describe_alarm_contributors(input : ACW::DescribeAlarmContributorsInput) : Core::ParsedResponse(ACW::DescribeAlarmContributorsOutput)
      Log.info { "performing 'DescribeAlarmContributors' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeAlarmContributors", "/", input.to_json)
      Core::ParsedResponse(ACW::DescribeAlarmContributorsOutput).new(response)
    end

    # Retrieves the history for the specified alarm. You can filter the results by date range or item
    # type. If an alarm name is not specified, the histories for either all metric alarms or all
    # composite alarms are returned.
    #
    # CloudWatch retains the history of an alarm even if you delete the alarm.
    #
    # To use this operation and return information about a composite alarm, you must be signed on with
    # the `cloudwatch:DescribeAlarmHistory` permission that is scoped to `*`. You can't return
    # information about composite alarms if your `cloudwatch:DescribeAlarmHistory` permission has a
    # narrower scope.
    def describe_alarm_history(input : ACW::DescribeAlarmHistoryInput) : Core::ParsedResponse(ACW::DescribeAlarmHistoryOutput)
      Log.info { "performing 'DescribeAlarmHistory' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeAlarmHistory", "/", input.to_json)
      Core::ParsedResponse(ACW::DescribeAlarmHistoryOutput).new(response)
    end

    # Retrieves the specified alarms. You can filter the results by specifying a prefix for the alarm
    # name, the alarm state, or a prefix for any action.
    #
    # To use this operation and return information about composite alarms, you must be signed on with
    # the `cloudwatch:DescribeAlarms` permission that is scoped to `*`. You can't return information
    # about composite alarms if your `cloudwatch:DescribeAlarms` permission has a narrower scope.
    def describe_alarms(input : ACW::DescribeAlarmsInput) : Core::ParsedResponse(ACW::DescribeAlarmsOutput)
      Log.info { "performing 'DescribeAlarms' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeAlarms", "/", input.to_json)
      Core::ParsedResponse(ACW::DescribeAlarmsOutput).new(response)
    end

    # Retrieves the alarms for the specified metric. To filter the results, specify a statistic,
    # period, or unit.
    #
    # This operation retrieves only standard alarms that are based on the specified metric. It does
    # not return alarms based on math expressions that use the specified metric, or composite alarms
    # that use the specified metric.
    def describe_alarms_for_metric(input : ACW::DescribeAlarmsForMetricInput) : Core::ParsedResponse(ACW::DescribeAlarmsForMetricOutput)
      Log.info { "performing 'DescribeAlarmsForMetric' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeAlarmsForMetric", "/", input.to_json)
      Core::ParsedResponse(ACW::DescribeAlarmsForMetricOutput).new(response)
    end

    # Lists the anomaly detection models that you have created in your account. For single metric
    # anomaly detectors, you can list all of the models in your account or filter the results to only
    # the models that are related to a certain namespace, metric name, or metric dimension. For metric
    # math anomaly detectors, you can list them by adding `METRIC_MATH` to the `AnomalyDetectorTypes`
    # array. This will return all metric math anomaly detectors in your account.
    def describe_anomaly_detectors(input : ACW::DescribeAnomalyDetectorsInput) : Core::ParsedResponse(ACW::DescribeAnomalyDetectorsOutput)
      Log.info { "performing 'DescribeAnomalyDetectors' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeAnomalyDetectors", "/", input.to_json)
      Core::ParsedResponse(ACW::DescribeAnomalyDetectorsOutput).new(response)
    end

    # Returns a list of all the Contributor Insights rules in your account.
    #
    # For more information about Contributor Insights, see [Using Contributor Insights to Analyze
    # High-Cardinality
    # Data](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights.html).
    def describe_insight_rules(input : ACW::DescribeInsightRulesInput) : Core::ParsedResponse(ACW::DescribeInsightRulesOutput)
      Log.info { "performing 'DescribeInsightRules' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeInsightRules", "/", input.to_json)
      Core::ParsedResponse(ACW::DescribeInsightRulesOutput).new(response)
    end

    # Disables the actions for the specified alarms. When an alarm's actions are disabled, the alarm
    # actions do not execute when the alarm state changes.
    def disable_alarm_actions(input : ACW::DisableAlarmActionsInput) : Core::Response
      Log.info { "performing 'DisableAlarmActions' operation" }
      input.validate! if config.validate_input?
      response = post("DisableAlarmActions", "/", input.to_json)
      Core::Response.new(response)
    end

    # Disables the specified Contributor Insights rules. When rules are disabled, they do not analyze
    # log groups and do not incur costs.
    def disable_insight_rules(input : ACW::DisableInsightRulesInput) : Core::ParsedResponse(ACW::DisableInsightRulesOutput)
      Log.info { "performing 'DisableInsightRules' operation" }
      input.validate! if config.validate_input?
      response = post("DisableInsightRules", "/", input.to_json)
      Core::ParsedResponse(ACW::DisableInsightRulesOutput).new(response)
    end

    # Removes the customer managed Amazon Web Services Key Management Service (Amazon Web Services
    # KMS) key association from the specified dataset. After this operation completes, data that you
    # publish to the dataset is encrypted at rest using an Amazon Web Services owned key managed by
    # Amazon CloudWatch.
    #
    # Only the `default` dataset is supported. To call this operation, the dataset must currently have
    # a customer managed KMS key associated with it. If the dataset has no associated KMS key, the
    # operation fails with `ResourceNotFoundException`.
    #
    # Amazon CloudWatch performs a dry-run `kms:Decrypt` call on the currently associated key as part
    # of this operation. The caller must have `kms:Decrypt` permission on the currently associated
    # key. If the key is accessible but the caller lacks `kms:Decrypt` permission, the operation fails
    # with `AccessDeniedException`.
    #
    # If the currently associated key has been deleted, is scheduled for deletion, is pending import,
    # is unavailable, or has been disabled, Amazon CloudWatch does not require `kms:Decrypt`
    # permission on that key and the disassociation proceeds. If the key was only disabled, consider
    # re-enabling it instead of disassociating, because re-enabling allows Amazon CloudWatch to resume
    # decrypting your existing metric data.
    #
    # Disassociating a KMS key from a dataset does not immediately remove the `kms:Decrypt`
    # requirement on data plane operations. For up to three hours after disassociation, callers must
    # continue to have `kms:Decrypt` permission on the previously associated key. Some data might
    # still be encrypted with that key during this window. After this enforcement window elapses, the
    # `kms:Decrypt` requirement is lifted.
    #
    # For more information about using customer managed keys with Amazon CloudWatch, see [Encryption
    # at rest with customer managed
    # keys](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cmk-encryption.html) in the
    # *Amazon CloudWatch User Guide*.
    def disassociate_dataset_kms_key(input : ACW::DisassociateDatasetKmsKeyInput) : Core::ParsedResponse(ACW::DisassociateDatasetKmsKeyOutput)
      Log.info { "performing 'DisassociateDatasetKmsKey' operation" }
      input.validate! if config.validate_input?
      response = post("DisassociateDatasetKmsKey", "/", input.to_json)
      Core::ParsedResponse(ACW::DisassociateDatasetKmsKeyOutput).new(response)
    end

    # Enables the actions for the specified alarms.
    def enable_alarm_actions(input : ACW::EnableAlarmActionsInput) : Core::Response
      Log.info { "performing 'EnableAlarmActions' operation" }
      input.validate! if config.validate_input?
      response = post("EnableAlarmActions", "/", input.to_json)
      Core::Response.new(response)
    end

    # Enables the specified Contributor Insights rules. When rules are enabled, they immediately begin
    # analyzing log data.
    def enable_insight_rules(input : ACW::EnableInsightRulesInput) : Core::ParsedResponse(ACW::EnableInsightRulesOutput)
      Log.info { "performing 'EnableInsightRules' operation" }
      input.validate! if config.validate_input?
      response = post("EnableInsightRules", "/", input.to_json)
      Core::ParsedResponse(ACW::EnableInsightRulesOutput).new(response)
    end

    # Retrieves details for a specific alarm mute rule.
    #
    # This operation returns complete information about the mute rule, including its configuration,
    # status, targeted alarms, and metadata.
    #
    # The returned status indicates the current state of the mute rule:
    #
    # - **SCHEDULED**: The mute rule is configured and will become active in the future
    #
    # - **ACTIVE**: The mute rule is currently muting alarm actions
    #
    # - **EXPIRED**: The mute rule has passed its expiration date and will no longer become active
    #
    # **Permissions**
    #
    # To retrieve details for a mute rule, you need the `cloudwatch:GetAlarmMuteRule` permission on
    # the alarm mute rule resource.
    def get_alarm_mute_rule(input : ACW::GetAlarmMuteRuleInput) : Core::ParsedResponse(ACW::GetAlarmMuteRuleOutput)
      Log.info { "performing 'GetAlarmMuteRule' operation" }
      input.validate! if config.validate_input?
      response = post("GetAlarmMuteRule", "/", input.to_json)
      Core::ParsedResponse(ACW::GetAlarmMuteRuleOutput).new(response)
    end

    # Displays the details of the dashboard that you specify.
    #
    # To copy an existing dashboard, use `GetDashboard`, and then use the data returned within
    # `DashboardBody` as the template for the new dashboard when you call `PutDashboard` to create the
    # copy.
    def get_dashboard(input : ACW::GetDashboardInput) : Core::ParsedResponse(ACW::GetDashboardOutput)
      Log.info { "performing 'GetDashboard' operation" }
      input.validate! if config.validate_input?
      response = post("GetDashboard", "/", input.to_json)
      Core::ParsedResponse(ACW::GetDashboardOutput).new(response)
    end

    # Returns information about the specified dataset. This includes its identifier, Amazon Resource
    # Name (ARN), and any customer managed Amazon Web Services Key Management Service (Amazon Web
    # Services KMS) key that is currently associated with it.
    #
    # Only the `default` dataset is supported. The `default` dataset is implicit for every account in
    # every Region — you can call `GetDataset` for it without first creating it. If no customer
    # managed KMS key has been associated with the dataset, the response omits the `KmsKeyArn` field,
    # indicating that data is encrypted at rest using an Amazon Web Services owned key managed by
    # Amazon CloudWatch.
    #
    # To associate a customer managed KMS key with a dataset, use
    # [AssociateDatasetKmsKey](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_AssociateDatasetKmsKey.html).
    # To remove the association, use
    # [DisassociateDatasetKmsKey](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DisassociateDatasetKmsKey.html).
    def get_dataset(input : ACW::GetDatasetInput) : Core::ParsedResponse(ACW::GetDatasetOutput)
      Log.info { "performing 'GetDataset' operation" }
      input.validate! if config.validate_input?
      response = post("GetDataset", "/", input.to_json)
      Core::ParsedResponse(ACW::GetDatasetOutput).new(response)
    end

    # This operation returns the time series data collected by a Contributor Insights rule. The data
    # includes the identity and number of contributors to the log group.
    #
    # You can also optionally return one or more statistics about each data point in the time series.
    # These statistics can include the following:
    #
    # - `UniqueContributors` -- the number of unique contributors for each data point.
    #
    # - `MaxContributorValue` -- the value of the top contributor for each data point. The identity of
    # the contributor might change for each data point in the graph.
    #
    # If this rule aggregates by COUNT, the top contributor for each data point is the contributor
    # with the most occurrences in that period. If the rule aggregates by SUM, the top contributor is
    # the contributor with the highest sum in the log field specified by the rule's `Value`, during
    # that period.
    #
    # - `SampleCount` -- the number of data points matched by the rule.
    #
    # - `Sum` -- the sum of the values from all contributors during the time period represented by
    # that data point.
    #
    # - `Minimum` -- the minimum value from a single observation during the time period represented by
    # that data point.
    #
    # - `Maximum` -- the maximum value from a single observation during the time period represented by
    # that data point.
    #
    # - `Average` -- the average value from all contributors during the time period represented by
    # that data point.
    def get_insight_rule_report(input : ACW::GetInsightRuleReportInput) : Core::ParsedResponse(ACW::GetInsightRuleReportOutput)
      Log.info { "performing 'GetInsightRuleReport' operation" }
      input.validate! if config.validate_input?
      response = post("GetInsightRuleReport", "/", input.to_json)
      Core::ParsedResponse(ACW::GetInsightRuleReportOutput).new(response)
    end

    # You can use the `GetMetricData` API to retrieve CloudWatch metric values. The operation can also
    # include a CloudWatch Metrics Insights query, and one or more metric math functions.
    #
    # A `GetMetricData` operation that does not include a query can retrieve as many as 500 different
    # metrics in a single request, with a total of as many as 100,800 data points. You can also
    # optionally perform metric math expressions on the values of the returned statistics, to create
    # new time series that represent new insights into your data. For example, using Lambda metrics,
    # you could divide the Errors metric by the Invocations metric to get an error rate time series.
    # For more information about metric math expressions, see [Metric Math Syntax and
    # Functions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax)
    # in the *Amazon CloudWatch User Guide*.
    #
    # If you include a Metrics Insights query, each `GetMetricData` operation can include only one
    # query. But the same `GetMetricData` operation can also retrieve other metrics. Metrics Insights
    # queries can query only the most recent three hours of metric data. For more information about
    # Metrics Insights, see [Query your metrics with CloudWatch Metrics
    # Insights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/query_with_cloudwatch-metrics-insights.html).
    #
    # Calls to the `GetMetricData` API have a different pricing structure than calls to
    # `GetMetricStatistics`. For more information about pricing, see [Amazon CloudWatch
    # Pricing](https://aws.amazon.com/cloudwatch/pricing/).
    #
    # Amazon CloudWatch retains metric data as follows:
    #
    # - Data points with a period of less than 60 seconds are available for 3 hours. These data points
    # are high-resolution metrics and are available only for custom metrics that have been defined
    # with a `StorageResolution` of 1.
    #
    # - Data points with a period of 60 seconds (1-minute) are available for 15 days.
    #
    # - Data points with a period of 300 seconds (5-minute) are available for 63 days.
    #
    # - Data points with a period of 3600 seconds (1 hour) are available for 455 days (15 months).
    #
    # Data points that are initially published with a shorter period are aggregated together for
    # long-term storage. For example, if you collect data using a period of 1 minute, the data remains
    # available for 15 days with 1-minute resolution. After 15 days, this data is still available, but
    # is aggregated and retrievable only with a resolution of 5 minutes. After 63 days, the data is
    # further aggregated and is available with a resolution of 1 hour.
    #
    # If you omit `Unit` in your request, all data that was collected with any unit is returned, along
    # with the corresponding units that were specified when the data was reported to CloudWatch. If
    # you specify a unit, the operation returns only data that was collected with that unit specified.
    # If you specify a unit that does not match the data collected, the results of the operation are
    # null. CloudWatch does not perform unit conversions.
    #
    # **Using Metrics Insights queries with metric math**
    #
    # You can't mix a Metric Insights query and metric math syntax in the same expression, but you can
    # reference results from a Metrics Insights query within other Metric math expressions. A Metrics
    # Insights query without a **GROUP BY** clause returns a single time-series (TS), and can be used
    # as input for a metric math expression that expects a single time series. A Metrics Insights
    # query with a **GROUP BY** clause returns an array of time-series (TS[]), and can be used as
    # input for a metric math expression that expects an array of time series.
    def get_metric_data(input : ACW::GetMetricDataInput) : Core::ParsedResponse(ACW::GetMetricDataOutput)
      Log.info { "performing 'GetMetricData' operation" }
      input.validate! if config.validate_input?
      response = post("GetMetricData", "/", input.to_json)
      Core::ParsedResponse(ACW::GetMetricDataOutput).new(response)
    end

    # Gets statistics for the specified metric.
    #
    # The maximum number of data points returned from a single call is 1,440. If you request more than
    # 1,440 data points, CloudWatch returns an error. To reduce the number of data points, you can
    # narrow the specified time range and make multiple requests across adjacent time ranges, or you
    # can increase the specified period. Data points are not returned in chronological order.
    #
    # CloudWatch aggregates data points based on the length of the period that you specify. For
    # example, if you request statistics with a one-hour period, CloudWatch aggregates all data points
    # with time stamps that fall within each one-hour period. Therefore, the number of values
    # aggregated by CloudWatch is larger than the number of data points returned.
    #
    # CloudWatch needs raw data points to calculate percentile statistics. If you publish data using a
    # statistic set instead, you can only retrieve percentile statistics for this data if one of the
    # following conditions is true:
    #
    # - The SampleCount value of the statistic set is 1.
    #
    # - The Min and the Max values of the statistic set are equal.
    #
    # Percentile statistics are not available for metrics when any of the metric values are negative
    # numbers.
    #
    # Amazon CloudWatch retains metric data as follows:
    #
    # - Data points with a period of less than 60 seconds are available for 3 hours. These data points
    # are high-resolution metrics and are available only for custom metrics that have been defined
    # with a `StorageResolution` of 1.
    #
    # - Data points with a period of 60 seconds (1-minute) are available for 15 days.
    #
    # - Data points with a period of 300 seconds (5-minute) are available for 63 days.
    #
    # - Data points with a period of 3600 seconds (1 hour) are available for 455 days (15 months).
    #
    # Data points that are initially published with a shorter period are aggregated together for
    # long-term storage. For example, if you collect data using a period of 1 minute, the data remains
    # available for 15 days with 1-minute resolution. After 15 days, this data is still available, but
    # is aggregated and retrievable only with a resolution of 5 minutes. After 63 days, the data is
    # further aggregated and is available with a resolution of 1 hour.
    #
    # CloudWatch started retaining 5-minute and 1-hour metric data as of July 9, 2016.
    #
    # For information about metrics and dimensions supported by Amazon Web Services services, see the
    # [Amazon CloudWatch Metrics and Dimensions
    # Reference](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html)
    # in the *Amazon CloudWatch User Guide*.
    def get_metric_statistics(input : ACW::GetMetricStatisticsInput) : Core::ParsedResponse(ACW::GetMetricStatisticsOutput)
      Log.info { "performing 'GetMetricStatistics' operation" }
      input.validate! if config.validate_input?
      response = post("GetMetricStatistics", "/", input.to_json)
      Core::ParsedResponse(ACW::GetMetricStatisticsOutput).new(response)
    end

    # Returns information about the metric stream that you specify.
    def get_metric_stream(input : ACW::GetMetricStreamInput) : Core::ParsedResponse(ACW::GetMetricStreamOutput)
      Log.info { "performing 'GetMetricStream' operation" }
      input.validate! if config.validate_input?
      response = post("GetMetricStream", "/", input.to_json)
      Core::ParsedResponse(ACW::GetMetricStreamOutput).new(response)
    end

    # You can use the `GetMetricWidgetImage` API to retrieve a snapshot graph of one or more Amazon
    # CloudWatch metrics as a bitmap image. You can then embed this image into your services and
    # products, such as wiki pages, reports, and documents. You could also retrieve images regularly,
    # such as every minute, and create your own custom live dashboard.
    #
    # The graph you retrieve can include all CloudWatch metric graph features, including metric math
    # and horizontal and vertical annotations.
    #
    # There is a limit of 20 transactions per second for this API. Each `GetMetricWidgetImage` action
    # has the following limits:
    #
    # - As many as 100 metrics in the graph.
    #
    # - Up to 100 KB uncompressed payload.
    def get_metric_widget_image(input : ACW::GetMetricWidgetImageInput) : Core::ParsedResponse(ACW::GetMetricWidgetImageOutput)
      Log.info { "performing 'GetMetricWidgetImage' operation" }
      input.validate! if config.validate_input?
      response = post("GetMetricWidgetImage", "/", input.to_json)
      Core::ParsedResponse(ACW::GetMetricWidgetImageOutput).new(response)
    end

    # Returns the current status of vended metric enrichment for the account, including whether
    # CloudWatch vended metrics are enriched with resource ARN and resource tag labels and queryable
    # using PromQL. For the list of supported resources, see [Supported Amazon Web Services
    # infrastructure
    # metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingResourceTagsForTelemetry.html).
    def get_o_tel_enrichment(input : ACW::GetOTelEnrichmentInput) : Core::ParsedResponse(ACW::GetOTelEnrichmentOutput)
      Log.info { "performing 'GetOTelEnrichment' operation" }
      input.validate! if config.validate_input?
      response = post("GetOTelEnrichment", "/", input.to_json)
      Core::ParsedResponse(ACW::GetOTelEnrichmentOutput).new(response)
    end

    # Lists alarm mute rules in your Amazon Web Services account and region.
    #
    # You can filter the results by alarm name to find all mute rules targeting a specific alarm, or
    # by status to find rules that are scheduled, active, or expired.
    #
    # This operation supports pagination for accounts with many mute rules. Use the `MaxRecords` and
    # `NextToken` parameters to retrieve results in multiple calls.
    #
    # **Permissions**
    #
    # To list mute rules, you need the `cloudwatch:ListAlarmMuteRules` permission.
    def list_alarm_mute_rules(input : ACW::ListAlarmMuteRulesInput) : Core::ParsedResponse(ACW::ListAlarmMuteRulesOutput)
      Log.info { "performing 'ListAlarmMuteRules' operation" }
      input.validate! if config.validate_input?
      response = post("ListAlarmMuteRules", "/", input.to_json)
      Core::ParsedResponse(ACW::ListAlarmMuteRulesOutput).new(response)
    end

    # Returns a list of the dashboards for your account. If you include `DashboardNamePrefix`, only
    # those dashboards with names starting with the prefix are listed. Otherwise, all dashboards in
    # your account are listed.
    #
    # `ListDashboards` returns up to 1000 results on one page. If there are more than 1000 dashboards,
    # you can call `ListDashboards` again and include the value you received for `NextToken` in the
    # first call, to receive the next 1000 results.
    def list_dashboards(input : ACW::ListDashboardsInput) : Core::ParsedResponse(ACW::ListDashboardsOutput)
      Log.info { "performing 'ListDashboards' operation" }
      input.validate! if config.validate_input?
      response = post("ListDashboards", "/", input.to_json)
      Core::ParsedResponse(ACW::ListDashboardsOutput).new(response)
    end

    # Returns a list that contains the number of managed Contributor Insights rules in your account.
    def list_managed_insight_rules(input : ACW::ListManagedInsightRulesInput) : Core::ParsedResponse(ACW::ListManagedInsightRulesOutput)
      Log.info { "performing 'ListManagedInsightRules' operation" }
      input.validate! if config.validate_input?
      response = post("ListManagedInsightRules", "/", input.to_json)
      Core::ParsedResponse(ACW::ListManagedInsightRulesOutput).new(response)
    end

    # List the specified metrics. You can use the returned metrics with
    # [GetMetricData](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html)
    # or
    # [GetMetricStatistics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html)
    # to get statistical data.
    #
    # Up to 500 results are returned for any one call. To retrieve additional results, use the
    # returned token with subsequent calls.
    #
    # After you create a metric, allow up to 15 minutes for the metric to appear. To see metric
    # statistics sooner, use
    # [GetMetricData](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html)
    # or
    # [GetMetricStatistics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html).
    #
    # If you are using CloudWatch cross-account observability, you can use this operation in a
    # monitoring account and view metrics from the linked source accounts. For more information, see
    # [CloudWatch cross-account
    # observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
    #
    # `ListMetrics` doesn't return information about metrics if those metrics haven't reported data in
    # the past two weeks. To retrieve those metrics, use
    # [GetMetricData](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html)
    # or
    # [GetMetricStatistics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html).
    def list_metrics(input : ACW::ListMetricsInput) : Core::ParsedResponse(ACW::ListMetricsOutput)
      Log.info { "performing 'ListMetrics' operation" }
      input.validate! if config.validate_input?
      response = post("ListMetrics", "/", input.to_json)
      Core::ParsedResponse(ACW::ListMetricsOutput).new(response)
    end

    # Returns a list of metric streams in this account.
    def list_metric_streams(input : ACW::ListMetricStreamsInput) : Core::ParsedResponse(ACW::ListMetricStreamsOutput)
      Log.info { "performing 'ListMetricStreams' operation" }
      input.validate! if config.validate_input?
      response = post("ListMetricStreams", "/", input.to_json)
      Core::ParsedResponse(ACW::ListMetricStreamsOutput).new(response)
    end

    # Displays the tags associated with a CloudWatch resource. Currently, alarms, dashboards, metric
    # streams and Contributor Insights rules support tagging.
    def list_tags_for_resource(input : ACW::ListTagsForResourceInput) : Core::ParsedResponse(ACW::ListTagsForResourceOutput)
      Log.info { "performing 'ListTagsForResource' operation" }
      input.validate! if config.validate_input?
      response = post("ListTagsForResource", "/", input.to_json)
      Core::ParsedResponse(ACW::ListTagsForResourceOutput).new(response)
    end

    # Creates or updates an alarm mute rule.
    #
    # Alarm mute rules automatically mute alarm actions during predefined time windows. When a mute
    # rule is active, targeted alarms continue to evaluate metrics and transition between states, but
    # their configured actions (such as Amazon SNS notifications or Auto Scaling actions) are muted.
    #
    # You can create mute rules with recurring schedules using `cron` expressions or one-time mute
    # windows using `at` expressions. Each mute rule can target up to 100 specific alarms by name.
    #
    # If you specify a rule name that already exists, this operation updates the existing rule with
    # the new configuration.
    #
    # **Permissions**
    #
    # To create or update a mute rule, you must have the `cloudwatch:PutAlarmMuteRule` permission on
    # two types of resources: the alarm mute rule resource itself, and each alarm that the rule
    # targets.
    #
    # For example, If you want to allow a user to create mute rules that target only specific alarms
    # named "WebServerCPUAlarm" and "DatabaseConnectionAlarm", you would create an IAM policy with one
    # statement granting `cloudwatch:PutAlarmMuteRule` on the alarm mute rule resource
    # (`arn:aws:cloudwatch:[REGION]:123456789012:alarm-mute-rule:*`), and another statement granting
    # `cloudwatch:PutAlarmMuteRule` on the targeted alarm resources
    # (`arn:aws:cloudwatch:[REGION]:123456789012:alarm:WebServerCPUAlarm` and
    # `arn:aws:cloudwatch:[REGION]:123456789012:alarm:DatabaseConnectionAlarm`).
    #
    # You can also use IAM policy conditions to allow targeting alarms based on resource tags. For
    # example, you can restrict users to create/update mute rules to only target alarms that have a
    # specific tag key-value pair, such as `Team=TeamA`.
    def put_alarm_mute_rule(input : ACW::PutAlarmMuteRuleInput) : Core::Response
      Log.info { "performing 'PutAlarmMuteRule' operation" }
      input.validate! if config.validate_input?
      response = post("PutAlarmMuteRule", "/", input.to_json)
      Core::Response.new(response)
    end

    # Creates an anomaly detection model for a CloudWatch metric. You can use the model to display a
    # band of expected normal values when the metric is graphed.
    #
    # If you have enabled unified cross-account observability, and this account is a monitoring
    # account, the metric can be in the same account or a source account. You can specify the account
    # ID in the object you specify in the `SingleMetricAnomalyDetector` parameter.
    #
    # For more information, see [CloudWatch Anomaly
    # Detection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Anomaly_Detection.html).
    def put_anomaly_detector(input : ACW::PutAnomalyDetectorInput) : Core::ParsedResponse(ACW::PutAnomalyDetectorOutput)
      Log.info { "performing 'PutAnomalyDetector' operation" }
      input.validate! if config.validate_input?
      response = post("PutAnomalyDetector", "/", input.to_json)
      Core::ParsedResponse(ACW::PutAnomalyDetectorOutput).new(response)
    end

    # Creates or updates a *composite alarm*. When you create a composite alarm, you specify a rule
    # expression for the alarm that takes into account the alarm states of other alarms that you have
    # created. The composite alarm goes into ALARM state only if all conditions of the rule are met.
    #
    # The alarms specified in a composite alarm's rule expression can include metric alarms and other
    # composite alarms. The rule expression of a composite alarm can include as many as 100 underlying
    # alarms. Any single alarm can be included in the rule expressions of as many as 150 composite
    # alarms.
    #
    # Using composite alarms can reduce alarm noise. You can create multiple metric alarms, and also
    # create a composite alarm and set up alerts only for the composite alarm. For example, you could
    # create a composite alarm that goes into ALARM state only when more than one of the underlying
    # metric alarms are in ALARM state.
    #
    # Composite alarms can take the following actions:
    #
    # - Notify Amazon SNS topics.
    #
    # - Invoke Lambda functions.
    #
    # - Create OpsItems in Systems Manager Ops Center.
    #
    # - Create incidents in Systems Manager Incident Manager.
    #
    # It is possible to create a loop or cycle of composite alarms, where composite alarm A depends on
    # composite alarm B, and composite alarm B also depends on composite alarm A. In this scenario,
    # you can't delete any composite alarm that is part of the cycle because there is always still a
    # composite alarm that depends on that alarm that you want to delete.
    #
    # To get out of such a situation, you must break the cycle by changing the rule of one of the
    # composite alarms in the cycle to remove a dependency that creates the cycle. The simplest change
    # to make to break a cycle is to change the `AlarmRule` of one of the alarms to `false`.
    #
    # Additionally, the evaluation of composite alarms stops if CloudWatch detects a cycle in the
    # evaluation path.
    #
    # When this operation creates an alarm, the alarm state is immediately set to `INSUFFICIENT_DATA`.
    # The alarm is then evaluated and its state is set appropriately. Any actions associated with the
    # new state are then executed. For a composite alarm, this initial time after creation is the only
    # time that the alarm can be in `INSUFFICIENT_DATA` state.
    #
    # When you update an existing alarm, its state is left unchanged, but the update completely
    # overwrites the previous configuration of the alarm.
    #
    # To use this operation, you must be signed on with the `cloudwatch:PutCompositeAlarm` permission
    # that is scoped to `*`. You can't create a composite alarms if your
    # `cloudwatch:PutCompositeAlarm` permission has a narrower scope.
    #
    # If you are an IAM user, you must have `iam:CreateServiceLinkedRole` to create a composite alarm
    # that has Systems Manager OpsItem actions.
    def put_composite_alarm(input : ACW::PutCompositeAlarmInput) : Core::Response
      Log.info { "performing 'PutCompositeAlarm' operation" }
      input.validate! if config.validate_input?
      response = post("PutCompositeAlarm", "/", input.to_json)
      Core::Response.new(response)
    end

    # Creates a dashboard if it does not already exist, or updates an existing dashboard. If you
    # update a dashboard, the entire contents are replaced with what you specify here.
    #
    # All dashboards in your account are global, not region-specific.
    #
    # A simple way to create a dashboard using `PutDashboard` is to copy an existing dashboard. To
    # copy an existing dashboard using the console, you can load the dashboard and then use the
    # View/edit source command in the Actions menu to display the JSON block for that dashboard.
    # Another way to copy a dashboard is to use `GetDashboard`, and then use the data returned within
    # `DashboardBody` as the template for the new dashboard when you call `PutDashboard`.
    #
    # When you create a dashboard with `PutDashboard`, a good practice is to add a text widget at the
    # top of the dashboard with a message that the dashboard was created by script and should not be
    # changed in the console. This message could also point console users to the location of the
    # `DashboardBody` script or the CloudFormation template used to create the dashboard.
    def put_dashboard(input : ACW::PutDashboardInput) : Core::ParsedResponse(ACW::PutDashboardOutput)
      Log.info { "performing 'PutDashboard' operation" }
      input.validate! if config.validate_input?
      response = post("PutDashboard", "/", input.to_json)
      Core::ParsedResponse(ACW::PutDashboardOutput).new(response)
    end

    # Creates a Contributor Insights rule. Rules evaluate log events in a CloudWatch Logs log group,
    # enabling you to find contributor data for the log events in that log group. For more
    # information, see [Using Contributor Insights to Analyze High-Cardinality
    # Data](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights.html).
    #
    # If you create a rule, delete it, and then re-create it with the same name, historical data from
    # the first time the rule was created might not be available.
    def put_insight_rule(input : ACW::PutInsightRuleInput) : Core::ParsedResponse(ACW::PutInsightRuleOutput)
      Log.info { "performing 'PutInsightRule' operation" }
      input.validate! if config.validate_input?
      response = post("PutInsightRule", "/", input.to_json)
      Core::ParsedResponse(ACW::PutInsightRuleOutput).new(response)
    end

    # Creates or updates a log alarm. A log alarm evaluates the results of a CloudWatch Logs scheduled
    # query against the configured threshold and comparison operator to determine its state.
    #
    # When you create a log alarm, the operation creates a service-managed CloudWatch Logs scheduled
    # query that runs the query string you provide on the schedule you configure. Each scheduled query
    # execution returns one or more aggregated values determined by the `AggregationExpression`, and
    # each aggregated value is compared against the alarm `Threshold` to determine the alarm state.
    # The alarm uses M-out-of-N evaluation: if `QueryResultsToAlarm` out of the most recent
    # `QueryResultsToEvaluate` query results breach the threshold, the alarm transitions to `ALARM`.
    #
    # Log alarms support the alarm states (`OK`, `ALARM`, `INSUFFICIENT_DATA`). Configure transition
    # actions using `OKActions`, `AlarmActions`, and `InsufficientDataActions`.
    #
    # If you call this operation with the name of an existing log alarm, the operation replaces the
    # previous configuration of that alarm.
    #
    # **Permissions**
    #
    # To create or update a log alarm, you must have the `cloudwatch:PutLogAlarm` permission. The IAM
    # role specified in `ScheduledQueryRoleARN` must grant the CloudWatch Alarms service permission to
    # execute scheduled queries on the specified log groups. If you set `ActionLogLineCount`, the role
    # specified in `ActionLogLineRoleArn` must grant permission to retrieve log events for inclusion
    # in alarm notifications.
    def put_log_alarm(input : ACW::PutLogAlarmInput) : Core::Response
      Log.info { "performing 'PutLogAlarm' operation" }
      input.validate! if config.validate_input?
      response = post("PutLogAlarm", "/", input.to_json)
      Core::Response.new(response)
    end

    # Creates a managed Contributor Insights rule for a specified Amazon Web Services resource. When
    # you enable a managed rule, you create a Contributor Insights rule that collects data from Amazon
    # Web Services services. You cannot edit these rules with `PutInsightRule`. The rules can be
    # enabled, disabled, and deleted using `EnableInsightRules`, `DisableInsightRules`, and
    # `DeleteInsightRules`. If a previously created managed rule is currently disabled, a subsequent
    # call to this API will re-enable it. Use `ListManagedInsightRules` to describe all available
    # rules.
    def put_managed_insight_rules(input : ACW::PutManagedInsightRulesInput) : Core::ParsedResponse(ACW::PutManagedInsightRulesOutput)
      Log.info { "performing 'PutManagedInsightRules' operation" }
      input.validate! if config.validate_input?
      response = post("PutManagedInsightRules", "/", input.to_json)
      Core::ParsedResponse(ACW::PutManagedInsightRulesOutput).new(response)
    end

    # Creates or updates an alarm and associates it with the specified metric, metric math expression,
    # anomaly detection model, Metrics Insights query, or PromQL query. For more information about
    # using a Metrics Insights query for an alarm, see [Create alarms on Metrics Insights
    # queries](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Metrics_Insights_Alarm.html).
    #
    # Alarms based on anomaly detection models cannot have Auto Scaling actions.
    #
    # When this operation creates an alarm, the alarm state is immediately set to `INSUFFICIENT_DATA`.
    # For PromQL alarms, the alarm state is instead immediately set to `OK`. The alarm is then
    # evaluated and its state is set appropriately. Any actions associated with the new state are then
    # executed.
    #
    # When you update an existing alarm, its state is left unchanged, but the update completely
    # overwrites the previous configuration of the alarm.
    #
    # If you are an IAM user, you must have Amazon EC2 permissions for some alarm operations:
    #
    # - The `iam:CreateServiceLinkedRole` permission for all alarms with EC2 actions
    #
    # - The `iam:CreateServiceLinkedRole` permissions to create an alarm with Systems Manager OpsItem
    # or response plan actions.
    #
    # The first time you create an alarm in the Amazon Web Services Management Console, the CLI, or by
    # using the PutMetricAlarm API, CloudWatch creates the necessary service-linked role for you. The
    # service-linked roles are called `AWSServiceRoleForCloudWatchEvents` and
    # `AWSServiceRoleForCloudWatchAlarms_ActionSSM`. For more information, see [Amazon Web Services
    # service-linked
    # role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role).
    #
    # Each `PutMetricAlarm` action has a maximum uncompressed payload of 120 KB.
    #
    # **Cross-account alarms**
    #
    # You can set an alarm on metrics in the current account, or in another account. To create a
    # cross-account alarm that watches a metric in a different account, you must have completed the
    # following pre-requisites:
    #
    # - The account where the metrics are located (the *sharing account*) must already have a sharing
    # role named **CloudWatch-CrossAccountSharingRole**. If it does not already have this role, you
    # must create it using the instructions in **Set up a sharing account** in [ Cross-account
    # cross-Region CloudWatch
    # console](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Cross-Account-Cross-Region.html#enable-cross-account-cross-Region).
    # The policy for that role must grant access to the ID of the account where you are creating the
    # alarm.
    #
    # - The account where you are creating the alarm (the *monitoring account*) must already have a
    # service-linked role named **AWSServiceRoleForCloudWatchCrossAccount** to allow CloudWatch to
    # assume the sharing role in the sharing account. If it does not, you must create it following the
    # directions in **Set up a monitoring account** in [ Cross-account cross-Region CloudWatch
    # console](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Cross-Account-Cross-Region.html#enable-cross-account-cross-Region).
    def put_metric_alarm(input : ACW::PutMetricAlarmInput) : Core::Response
      Log.info { "performing 'PutMetricAlarm' operation" }
      input.validate! if config.validate_input?
      response = post("PutMetricAlarm", "/", input.to_json)
      Core::Response.new(response)
    end

    # Publishes metric data to Amazon CloudWatch. CloudWatch associates the data with the specified
    # metric. If the specified metric does not exist, CloudWatch creates the metric. When CloudWatch
    # creates a metric, it can take up to fifteen minutes for the metric to appear in calls to
    # [ListMetrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html).
    #
    # You can publish metrics with associated entity data (so that related telemetry can be found and
    # viewed together), or publish metric data by itself. To send entity data with your metrics, use
    # the `EntityMetricData` parameter. To send metrics without entity data, use the `MetricData`
    # parameter. The `EntityMetricData` structure includes `MetricData` structures for the metric
    # data.
    #
    # You can publish either individual values in the `Value` field, or arrays of values and the
    # number of times each value occurred during the period by using the `Values` and `Counts` fields
    # in the `MetricData` structure. Using the `Values` and `Counts` method enables you to publish up
    # to 150 values per metric with one `PutMetricData` request, and supports retrieving percentile
    # statistics on this data.
    #
    # Each `PutMetricData` request is limited to 1 MB in size for HTTP POST requests. You can send a
    # payload compressed by gzip. Each request is also limited to no more than 1000 different metrics
    # (across both the `MetricData` and `EntityMetricData` properties).
    #
    # Although the `Value` parameter accepts numbers of type `Double`, CloudWatch rejects values that
    # are either too small or too large. Values must be in the range of -2^360 to 2^360. In addition,
    # special values (for example, NaN, +Infinity, -Infinity) are not supported.
    #
    # You can use up to 30 dimensions per metric to further clarify what data the metric collects.
    # Each dimension consists of a Name and Value pair. For more information about specifying
    # dimensions, see [Publishing
    # Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html)
    # in the *Amazon CloudWatch User Guide*.
    #
    # You specify the time stamp to be associated with each data point. You can specify time stamps
    # that are as much as two weeks before the current date, and as much as 2 hours after the current
    # day and time.
    #
    # Data points with time stamps from 24 hours ago or longer can take at least 48 hours to become
    # available for
    # [GetMetricData](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html)
    # or
    # [GetMetricStatistics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html)
    # from the time they are submitted. Data points with time stamps between 3 and 24 hours ago can
    # take as much as 2 hours to become available for
    # [GetMetricData](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html)
    # or
    # [GetMetricStatistics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html).
    #
    # CloudWatch needs raw data points to calculate percentile statistics. If you publish data using a
    # statistic set instead, you can only retrieve percentile statistics for this data if one of the
    # following conditions is true:
    #
    # - The `SampleCount` value of the statistic set is 1 and `Min`, `Max`, and `Sum` are all equal.
    #
    # - The `Min` and `Max` are equal, and `Sum` is equal to `Min` multiplied by `SampleCount`.
    def put_metric_data(input : ACW::PutMetricDataInput) : Core::Response
      Log.info { "performing 'PutMetricData' operation" }
      input.validate! if config.validate_input?
      response = post("PutMetricData", "/", input.to_json)
      Core::Response.new(response)
    end

    # Creates or updates a metric stream. Metric streams can automatically stream CloudWatch metrics
    # to Amazon Web Services destinations, including Amazon S3, and to many third-party solutions.
    #
    # For more information, see [ Using Metric
    # Streams](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Metric-Streams.html).
    #
    # To create a metric stream, you must be signed in to an account that has the `iam:PassRole`
    # permission and either the `CloudWatchFullAccess` policy or the `cloudwatch:PutMetricStream`
    # permission.
    #
    # When you create or update a metric stream, you choose one of the following:
    #
    # - Stream metrics from all metric namespaces in the account.
    #
    # - Stream metrics from all metric namespaces in the account, except for the namespaces that you
    # list in `ExcludeFilters`.
    #
    # - Stream metrics from only the metric namespaces that you list in `IncludeFilters`.
    #
    # By default, a metric stream always sends the `MAX`, `MIN`, `SUM`, and `SAMPLECOUNT` statistics
    # for each metric that is streamed. You can use the `StatisticsConfigurations` parameter to have
    # the metric stream send additional statistics in the stream. Streaming additional statistics
    # incurs additional costs. For more information, see [Amazon CloudWatch
    # Pricing](https://aws.amazon.com/cloudwatch/pricing/).
    #
    # When you use `PutMetricStream` to create a new metric stream, the stream is created in the
    # `running` state. If you use it to update an existing stream, the state of the stream is not
    # changed.
    #
    # If you are using CloudWatch cross-account observability and you create a metric stream in a
    # monitoring account, you can choose whether to include metrics from source accounts in the
    # stream. For more information, see [CloudWatch cross-account
    # observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html).
    def put_metric_stream(input : ACW::PutMetricStreamInput) : Core::ParsedResponse(ACW::PutMetricStreamOutput)
      Log.info { "performing 'PutMetricStream' operation" }
      input.validate! if config.validate_input?
      response = post("PutMetricStream", "/", input.to_json)
      Core::ParsedResponse(ACW::PutMetricStreamOutput).new(response)
    end

    # Temporarily sets the state of an alarm for testing purposes. When the updated state differs from
    # the previous value, the action configured for the appropriate state is invoked. For example, if
    # your alarm is configured to send an Amazon SNS message when an alarm is triggered, temporarily
    # changing the alarm state to `ALARM` sends an SNS message.
    #
    # Metric alarms returns to their actual state quickly, often within seconds. Because the metric
    # alarm state change happens quickly, it is typically only visible in the alarm's **History** tab
    # in the Amazon CloudWatch console or through
    # [DescribeAlarmHistory](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeAlarmHistory.html).
    #
    # If you use `SetAlarmState` on a composite alarm, the composite alarm is not guaranteed to return
    # to its actual state. It returns to its actual state only once any of its children alarms change
    # state. It is also reevaluated if you update its configuration.
    #
    # If an alarm triggers EC2 Auto Scaling policies or application Auto Scaling policies, you must
    # include information in the `StateReasonData` parameter to enable the policy to take the correct
    # action.
    def set_alarm_state(input : ACW::SetAlarmStateInput) : Core::Response
      Log.info { "performing 'SetAlarmState' operation" }
      input.validate! if config.validate_input?
      response = post("SetAlarmState", "/", input.to_json)
      Core::Response.new(response)
    end

    # Starts the streaming of metrics for one or more of your metric streams.
    def start_metric_streams(input : ACW::StartMetricStreamsInput) : Core::ParsedResponse(ACW::StartMetricStreamsOutput)
      Log.info { "performing 'StartMetricStreams' operation" }
      input.validate! if config.validate_input?
      response = post("StartMetricStreams", "/", input.to_json)
      Core::ParsedResponse(ACW::StartMetricStreamsOutput).new(response)
    end

    # Enables enrichment and PromQL access for CloudWatch vended metrics for [supported Amazon Web
    # Services
    # resources](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingResourceTagsForTelemetry.html)
    # in the account. Once enabled, metrics that contain a resource identifier dimension (for example,
    # EC2 `CPUUtilization` with an `InstanceId` dimension) are enriched with resource ARN and resource
    # tag labels and become queryable using PromQL.
    #
    # Before calling this operation, you must enable resource tags on telemetry for your account. For
    # more information, see [Enable resource tags on
    # telemetry](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/EnableResourceTagsOnTelemetry.html).
    def start_o_tel_enrichment(input : ACW::StartOTelEnrichmentInput) : Core::ParsedResponse(ACW::StartOTelEnrichmentOutput)
      Log.info { "performing 'StartOTelEnrichment' operation" }
      input.validate! if config.validate_input?
      response = post("StartOTelEnrichment", "/", input.to_json)
      Core::ParsedResponse(ACW::StartOTelEnrichmentOutput).new(response)
    end

    # Stops the streaming of metrics for one or more of your metric streams.
    def stop_metric_streams(input : ACW::StopMetricStreamsInput) : Core::ParsedResponse(ACW::StopMetricStreamsOutput)
      Log.info { "performing 'StopMetricStreams' operation" }
      input.validate! if config.validate_input?
      response = post("StopMetricStreams", "/", input.to_json)
      Core::ParsedResponse(ACW::StopMetricStreamsOutput).new(response)
    end

    # Disables enrichment and PromQL access for CloudWatch vended metrics for [supported Amazon Web
    # Services
    # resources](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/UsingResourceTagsForTelemetry.html)
    # in the account. After disabling, these metrics are no longer enriched with resource ARN and
    # resource tag labels, and cannot be queried using PromQL.
    def stop_o_tel_enrichment(input : ACW::StopOTelEnrichmentInput) : Core::ParsedResponse(ACW::StopOTelEnrichmentOutput)
      Log.info { "performing 'StopOTelEnrichment' operation" }
      input.validate! if config.validate_input?
      response = post("StopOTelEnrichment", "/", input.to_json)
      Core::ParsedResponse(ACW::StopOTelEnrichmentOutput).new(response)
    end

    # Assigns one or more tags (key-value pairs) to the specified CloudWatch resource. Currently, the
    # only CloudWatch resources that can be tagged are alarms, dashboards, metric streams and
    # Contributor Insights rules.
    #
    # Tags can help you organize and categorize your resources. You can also use them to scope user
    # permissions by granting a user permission to access or change only resources with certain tag
    # values.
    #
    # Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as
    # strings of characters.
    #
    # You can use the `TagResource` action with an alarm that already has tags. If you specify a new
    # tag key for the alarm, this tag is appended to the list of tags associated with the alarm. If
    # you specify a tag key that is already associated with the alarm, the new tag value that you
    # specify replaces the previous value for that tag.
    #
    # You can associate as many as 50 tags with a CloudWatch resource.
    def tag_resource(input : ACW::TagResourceInput) : Core::ParsedResponse(ACW::TagResourceOutput)
      Log.info { "performing 'TagResource' operation" }
      input.validate! if config.validate_input?
      response = post("TagResource", "/", input.to_json)
      Core::ParsedResponse(ACW::TagResourceOutput).new(response)
    end

    # Removes one or more tags from the specified resource. Currently, alarms, dashboards, metric
    # streams and Contributor Insights rules support tagging.
    def untag_resource(input : ACW::UntagResourceInput) : Core::ParsedResponse(ACW::UntagResourceOutput)
      Log.info { "performing 'UntagResource' operation" }
      input.validate! if config.validate_input?
      response = post("UntagResource", "/", input.to_json)
      Core::ParsedResponse(ACW::UntagResourceOutput).new(response)
    end
  end
end
