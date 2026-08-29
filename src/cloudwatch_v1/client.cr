private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.cloudwatch_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("GraniteServiceVersion20100801", "monitoring", "1.0", EXCEPTION_FACTORY, config)
    end

    def associate_dataset_kms_key(input : ACW::AssociateDatasetKmsKeyInput) : Core::ParsedResponse(ACW::AssociateDatasetKmsKeyOutput)
      Log.info { "performing 'AssociateDatasetKmsKey' operation" }
      response = post("AssociateDatasetKmsKey", "/", input.to_json)
      Core::ParsedResponse(ACW::AssociateDatasetKmsKeyOutput).new(response)
    end

    def delete_alarm_mute_rule(input : ACW::DeleteAlarmMuteRuleInput) : Core::Response
      Log.info { "performing 'DeleteAlarmMuteRule' operation" }
      response = post("DeleteAlarmMuteRule", "/", input.to_json)
      Core::Response.new(response)
    end

    def delete_alarms(input : ACW::DeleteAlarmsInput) : Core::Response
      Log.info { "performing 'DeleteAlarms' operation" }
      response = post("DeleteAlarms", "/", input.to_json)
      Core::Response.new(response)
    end

    def delete_anomaly_detector(input : ACW::DeleteAnomalyDetectorInput) : Core::ParsedResponse(ACW::DeleteAnomalyDetectorOutput)
      Log.info { "performing 'DeleteAnomalyDetector' operation" }
      response = post("DeleteAnomalyDetector", "/", input.to_json)
      Core::ParsedResponse(ACW::DeleteAnomalyDetectorOutput).new(response)
    end

    def delete_dashboards(input : ACW::DeleteDashboardsInput) : Core::ParsedResponse(ACW::DeleteDashboardsOutput)
      Log.info { "performing 'DeleteDashboards' operation" }
      response = post("DeleteDashboards", "/", input.to_json)
      Core::ParsedResponse(ACW::DeleteDashboardsOutput).new(response)
    end

    def delete_insight_rules(input : ACW::DeleteInsightRulesInput) : Core::ParsedResponse(ACW::DeleteInsightRulesOutput)
      Log.info { "performing 'DeleteInsightRules' operation" }
      response = post("DeleteInsightRules", "/", input.to_json)
      Core::ParsedResponse(ACW::DeleteInsightRulesOutput).new(response)
    end

    def delete_metric_stream(input : ACW::DeleteMetricStreamInput) : Core::ParsedResponse(ACW::DeleteMetricStreamOutput)
      Log.info { "performing 'DeleteMetricStream' operation" }
      response = post("DeleteMetricStream", "/", input.to_json)
      Core::ParsedResponse(ACW::DeleteMetricStreamOutput).new(response)
    end

    def describe_alarm_contributors(input : ACW::DescribeAlarmContributorsInput) : Core::ParsedResponse(ACW::DescribeAlarmContributorsOutput)
      Log.info { "performing 'DescribeAlarmContributors' operation" }
      response = post("DescribeAlarmContributors", "/", input.to_json)
      Core::ParsedResponse(ACW::DescribeAlarmContributorsOutput).new(response)
    end

    def describe_alarm_history(input : ACW::DescribeAlarmHistoryInput) : Core::ParsedResponse(ACW::DescribeAlarmHistoryOutput)
      Log.info { "performing 'DescribeAlarmHistory' operation" }
      response = post("DescribeAlarmHistory", "/", input.to_json)
      Core::ParsedResponse(ACW::DescribeAlarmHistoryOutput).new(response)
    end

    def describe_alarms(input : ACW::DescribeAlarmsInput) : Core::ParsedResponse(ACW::DescribeAlarmsOutput)
      Log.info { "performing 'DescribeAlarms' operation" }
      response = post("DescribeAlarms", "/", input.to_json)
      Core::ParsedResponse(ACW::DescribeAlarmsOutput).new(response)
    end

    def describe_alarms_for_metric(input : ACW::DescribeAlarmsForMetricInput) : Core::ParsedResponse(ACW::DescribeAlarmsForMetricOutput)
      Log.info { "performing 'DescribeAlarmsForMetric' operation" }
      response = post("DescribeAlarmsForMetric", "/", input.to_json)
      Core::ParsedResponse(ACW::DescribeAlarmsForMetricOutput).new(response)
    end

    def describe_anomaly_detectors(input : ACW::DescribeAnomalyDetectorsInput) : Core::ParsedResponse(ACW::DescribeAnomalyDetectorsOutput)
      Log.info { "performing 'DescribeAnomalyDetectors' operation" }
      response = post("DescribeAnomalyDetectors", "/", input.to_json)
      Core::ParsedResponse(ACW::DescribeAnomalyDetectorsOutput).new(response)
    end

    def describe_insight_rules(input : ACW::DescribeInsightRulesInput) : Core::ParsedResponse(ACW::DescribeInsightRulesOutput)
      Log.info { "performing 'DescribeInsightRules' operation" }
      response = post("DescribeInsightRules", "/", input.to_json)
      Core::ParsedResponse(ACW::DescribeInsightRulesOutput).new(response)
    end

    def disable_alarm_actions(input : ACW::DisableAlarmActionsInput) : Core::Response
      Log.info { "performing 'DisableAlarmActions' operation" }
      response = post("DisableAlarmActions", "/", input.to_json)
      Core::Response.new(response)
    end

    def disable_insight_rules(input : ACW::DisableInsightRulesInput) : Core::ParsedResponse(ACW::DisableInsightRulesOutput)
      Log.info { "performing 'DisableInsightRules' operation" }
      response = post("DisableInsightRules", "/", input.to_json)
      Core::ParsedResponse(ACW::DisableInsightRulesOutput).new(response)
    end

    def disassociate_dataset_kms_key(input : ACW::DisassociateDatasetKmsKeyInput) : Core::ParsedResponse(ACW::DisassociateDatasetKmsKeyOutput)
      Log.info { "performing 'DisassociateDatasetKmsKey' operation" }
      response = post("DisassociateDatasetKmsKey", "/", input.to_json)
      Core::ParsedResponse(ACW::DisassociateDatasetKmsKeyOutput).new(response)
    end

    def enable_alarm_actions(input : ACW::EnableAlarmActionsInput) : Core::Response
      Log.info { "performing 'EnableAlarmActions' operation" }
      response = post("EnableAlarmActions", "/", input.to_json)
      Core::Response.new(response)
    end

    def enable_insight_rules(input : ACW::EnableInsightRulesInput) : Core::ParsedResponse(ACW::EnableInsightRulesOutput)
      Log.info { "performing 'EnableInsightRules' operation" }
      response = post("EnableInsightRules", "/", input.to_json)
      Core::ParsedResponse(ACW::EnableInsightRulesOutput).new(response)
    end

    def get_alarm_mute_rule(input : ACW::GetAlarmMuteRuleInput) : Core::ParsedResponse(ACW::GetAlarmMuteRuleOutput)
      Log.info { "performing 'GetAlarmMuteRule' operation" }
      response = post("GetAlarmMuteRule", "/", input.to_json)
      Core::ParsedResponse(ACW::GetAlarmMuteRuleOutput).new(response)
    end

    def get_dashboard(input : ACW::GetDashboardInput) : Core::ParsedResponse(ACW::GetDashboardOutput)
      Log.info { "performing 'GetDashboard' operation" }
      response = post("GetDashboard", "/", input.to_json)
      Core::ParsedResponse(ACW::GetDashboardOutput).new(response)
    end

    def get_dataset(input : ACW::GetDatasetInput) : Core::ParsedResponse(ACW::GetDatasetOutput)
      Log.info { "performing 'GetDataset' operation" }
      response = post("GetDataset", "/", input.to_json)
      Core::ParsedResponse(ACW::GetDatasetOutput).new(response)
    end

    def get_insight_rule_report(input : ACW::GetInsightRuleReportInput) : Core::ParsedResponse(ACW::GetInsightRuleReportOutput)
      Log.info { "performing 'GetInsightRuleReport' operation" }
      response = post("GetInsightRuleReport", "/", input.to_json)
      Core::ParsedResponse(ACW::GetInsightRuleReportOutput).new(response)
    end

    def get_metric_data(input : ACW::GetMetricDataInput) : Core::ParsedResponse(ACW::GetMetricDataOutput)
      Log.info { "performing 'GetMetricData' operation" }
      response = post("GetMetricData", "/", input.to_json)
      Core::ParsedResponse(ACW::GetMetricDataOutput).new(response)
    end

    def get_metric_statistics(input : ACW::GetMetricStatisticsInput) : Core::ParsedResponse(ACW::GetMetricStatisticsOutput)
      Log.info { "performing 'GetMetricStatistics' operation" }
      response = post("GetMetricStatistics", "/", input.to_json)
      Core::ParsedResponse(ACW::GetMetricStatisticsOutput).new(response)
    end

    def get_metric_stream(input : ACW::GetMetricStreamInput) : Core::ParsedResponse(ACW::GetMetricStreamOutput)
      Log.info { "performing 'GetMetricStream' operation" }
      response = post("GetMetricStream", "/", input.to_json)
      Core::ParsedResponse(ACW::GetMetricStreamOutput).new(response)
    end

    def get_metric_widget_image(input : ACW::GetMetricWidgetImageInput) : Core::ParsedResponse(ACW::GetMetricWidgetImageOutput)
      Log.info { "performing 'GetMetricWidgetImage' operation" }
      response = post("GetMetricWidgetImage", "/", input.to_json)
      Core::ParsedResponse(ACW::GetMetricWidgetImageOutput).new(response)
    end

    def get_o_tel_enrichment(input : ACW::GetOTelEnrichmentInput) : Core::ParsedResponse(ACW::GetOTelEnrichmentOutput)
      Log.info { "performing 'GetOTelEnrichment' operation" }
      response = post("GetOTelEnrichment", "/", input.to_json)
      Core::ParsedResponse(ACW::GetOTelEnrichmentOutput).new(response)
    end

    def list_alarm_mute_rules(input : ACW::ListAlarmMuteRulesInput) : Core::ParsedResponse(ACW::ListAlarmMuteRulesOutput)
      Log.info { "performing 'ListAlarmMuteRules' operation" }
      response = post("ListAlarmMuteRules", "/", input.to_json)
      Core::ParsedResponse(ACW::ListAlarmMuteRulesOutput).new(response)
    end

    def list_dashboards(input : ACW::ListDashboardsInput) : Core::ParsedResponse(ACW::ListDashboardsOutput)
      Log.info { "performing 'ListDashboards' operation" }
      response = post("ListDashboards", "/", input.to_json)
      Core::ParsedResponse(ACW::ListDashboardsOutput).new(response)
    end

    def list_managed_insight_rules(input : ACW::ListManagedInsightRulesInput) : Core::ParsedResponse(ACW::ListManagedInsightRulesOutput)
      Log.info { "performing 'ListManagedInsightRules' operation" }
      response = post("ListManagedInsightRules", "/", input.to_json)
      Core::ParsedResponse(ACW::ListManagedInsightRulesOutput).new(response)
    end

    def list_metrics(input : ACW::ListMetricsInput) : Core::ParsedResponse(ACW::ListMetricsOutput)
      Log.info { "performing 'ListMetrics' operation" }
      response = post("ListMetrics", "/", input.to_json)
      Core::ParsedResponse(ACW::ListMetricsOutput).new(response)
    end

    def list_metric_streams(input : ACW::ListMetricStreamsInput) : Core::ParsedResponse(ACW::ListMetricStreamsOutput)
      Log.info { "performing 'ListMetricStreams' operation" }
      response = post("ListMetricStreams", "/", input.to_json)
      Core::ParsedResponse(ACW::ListMetricStreamsOutput).new(response)
    end

    def list_tags_for_resource(input : ACW::ListTagsForResourceInput) : Core::ParsedResponse(ACW::ListTagsForResourceOutput)
      Log.info { "performing 'ListTagsForResource' operation" }
      response = post("ListTagsForResource", "/", input.to_json)
      Core::ParsedResponse(ACW::ListTagsForResourceOutput).new(response)
    end

    def put_alarm_mute_rule(input : ACW::PutAlarmMuteRuleInput) : Core::Response
      Log.info { "performing 'PutAlarmMuteRule' operation" }
      response = post("PutAlarmMuteRule", "/", input.to_json)
      Core::Response.new(response)
    end

    def put_anomaly_detector(input : ACW::PutAnomalyDetectorInput) : Core::ParsedResponse(ACW::PutAnomalyDetectorOutput)
      Log.info { "performing 'PutAnomalyDetector' operation" }
      response = post("PutAnomalyDetector", "/", input.to_json)
      Core::ParsedResponse(ACW::PutAnomalyDetectorOutput).new(response)
    end

    def put_composite_alarm(input : ACW::PutCompositeAlarmInput) : Core::Response
      Log.info { "performing 'PutCompositeAlarm' operation" }
      response = post("PutCompositeAlarm", "/", input.to_json)
      Core::Response.new(response)
    end

    def put_dashboard(input : ACW::PutDashboardInput) : Core::ParsedResponse(ACW::PutDashboardOutput)
      Log.info { "performing 'PutDashboard' operation" }
      response = post("PutDashboard", "/", input.to_json)
      Core::ParsedResponse(ACW::PutDashboardOutput).new(response)
    end

    def put_insight_rule(input : ACW::PutInsightRuleInput) : Core::ParsedResponse(ACW::PutInsightRuleOutput)
      Log.info { "performing 'PutInsightRule' operation" }
      response = post("PutInsightRule", "/", input.to_json)
      Core::ParsedResponse(ACW::PutInsightRuleOutput).new(response)
    end

    def put_log_alarm(input : ACW::PutLogAlarmInput) : Core::Response
      Log.info { "performing 'PutLogAlarm' operation" }
      response = post("PutLogAlarm", "/", input.to_json)
      Core::Response.new(response)
    end

    def put_managed_insight_rules(input : ACW::PutManagedInsightRulesInput) : Core::ParsedResponse(ACW::PutManagedInsightRulesOutput)
      Log.info { "performing 'PutManagedInsightRules' operation" }
      response = post("PutManagedInsightRules", "/", input.to_json)
      Core::ParsedResponse(ACW::PutManagedInsightRulesOutput).new(response)
    end

    def put_metric_alarm(input : ACW::PutMetricAlarmInput) : Core::Response
      Log.info { "performing 'PutMetricAlarm' operation" }
      response = post("PutMetricAlarm", "/", input.to_json)
      Core::Response.new(response)
    end

    def put_metric_data(input : ACW::PutMetricDataInput) : Core::Response
      Log.info { "performing 'PutMetricData' operation" }
      response = post("PutMetricData", "/", input.to_json)
      Core::Response.new(response)
    end

    def put_metric_stream(input : ACW::PutMetricStreamInput) : Core::ParsedResponse(ACW::PutMetricStreamOutput)
      Log.info { "performing 'PutMetricStream' operation" }
      response = post("PutMetricStream", "/", input.to_json)
      Core::ParsedResponse(ACW::PutMetricStreamOutput).new(response)
    end

    def set_alarm_state(input : ACW::SetAlarmStateInput) : Core::Response
      Log.info { "performing 'SetAlarmState' operation" }
      response = post("SetAlarmState", "/", input.to_json)
      Core::Response.new(response)
    end

    def start_metric_streams(input : ACW::StartMetricStreamsInput) : Core::ParsedResponse(ACW::StartMetricStreamsOutput)
      Log.info { "performing 'StartMetricStreams' operation" }
      response = post("StartMetricStreams", "/", input.to_json)
      Core::ParsedResponse(ACW::StartMetricStreamsOutput).new(response)
    end

    def start_o_tel_enrichment(input : ACW::StartOTelEnrichmentInput) : Core::ParsedResponse(ACW::StartOTelEnrichmentOutput)
      Log.info { "performing 'StartOTelEnrichment' operation" }
      response = post("StartOTelEnrichment", "/", input.to_json)
      Core::ParsedResponse(ACW::StartOTelEnrichmentOutput).new(response)
    end

    def stop_metric_streams(input : ACW::StopMetricStreamsInput) : Core::ParsedResponse(ACW::StopMetricStreamsOutput)
      Log.info { "performing 'StopMetricStreams' operation" }
      response = post("StopMetricStreams", "/", input.to_json)
      Core::ParsedResponse(ACW::StopMetricStreamsOutput).new(response)
    end

    def stop_o_tel_enrichment(input : ACW::StopOTelEnrichmentInput) : Core::ParsedResponse(ACW::StopOTelEnrichmentOutput)
      Log.info { "performing 'StopOTelEnrichment' operation" }
      response = post("StopOTelEnrichment", "/", input.to_json)
      Core::ParsedResponse(ACW::StopOTelEnrichmentOutput).new(response)
    end

    def tag_resource(input : ACW::TagResourceInput) : Core::ParsedResponse(ACW::TagResourceOutput)
      Log.info { "performing 'TagResource' operation" }
      response = post("TagResource", "/", input.to_json)
      Core::ParsedResponse(ACW::TagResourceOutput).new(response)
    end

    def untag_resource(input : ACW::UntagResourceInput) : Core::ParsedResponse(ACW::UntagResourceOutput)
      Log.info { "performing 'UntagResource' operation" }
      response = post("UntagResource", "/", input.to_json)
      Core::ParsedResponse(ACW::UntagResourceOutput).new(response)
    end
  end
end
