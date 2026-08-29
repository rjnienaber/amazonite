require "../spec_helper"

private alias ACW = Amazonite::CloudWatchV1
private alias AC = Amazonite::Core

describe "CloudWatchV1: basic alarm and metric operations" do
  alarm_name = "amazonite-integration-test-alarm"
  namespace = "AmazoniteIntegrationTest"
  client = ACW::Client.new
  alarm_arn = ""

  it "removes an existing alarm" do
    client.delete_alarms(ACW::DeleteAlarmsInput.new([alarm_name]))
  end

  it "publishes metric data" do
    datum = ACW::MetricDatum.new("RequestCount", value: 42.0)
    response = client.put_metric_data(ACW::PutMetricDataInput.new(namespace, [datum]))
    response.http.status_code.should eq(200)
  end

  it "creates an alarm" do
    request = ACW::PutMetricAlarmInput.new(
      alarm_name,
      metric_name: "RequestCount",
      namespace: namespace,
      statistic: ACW::Statistic::Sum,
      period: 60,
      evaluation_periods: 1,
      threshold: 100.0,
      comparison_operator: ACW::ComparisonOperator::GreaterThanThreshold,
    )
    response = client.put_metric_alarm(request)
    response.http.status_code.should eq(200)
  end

  it "describes the alarm" do
    response = client.describe_alarms(ACW::DescribeAlarmsInput.new(alarm_names: [alarm_name]))
    response.http.status_code.should eq(200)

    alarms = response.result.metric_alarms || [] of ACW::MetricAlarm
    alarms.map(&.alarm_name).should eq([alarm_name])
    alarm_arn = alarms[0].alarm_arn || raise "expected an alarm arn in the response"
  end

  it "tags the alarm" do
    tag_response = client.tag_resource(ACW::TagResourceInput.new(alarm_arn, [ACW::Tag.new("Environment", "test")]))
    tag_response.http.status_code.should eq(200)

    list_response = client.list_tags_for_resource(ACW::ListTagsForResourceInput.new(alarm_arn))
    list_response.http.status_code.should eq(200)
    tags = list_response.result.tags || [] of ACW::Tag
    tags.map(&.key).should eq(["Environment"])
    tags.map(&.value).should eq(["test"])

    untag_response = client.untag_resource(ACW::UntagResourceInput.new(alarm_arn, ["Environment"]))
    untag_response.http.status_code.should eq(200)

    list_response = client.list_tags_for_resource(ACW::ListTagsForResourceInput.new(alarm_arn))
    (list_response.result.tags || [] of ACW::Tag).should be_empty
  end

  it "deletes the alarm" do
    response = client.delete_alarms(ACW::DeleteAlarmsInput.new([alarm_name]))
    response.http.status_code.should eq(200)
  end

  it "throws a typed error" do
    e = expect_raises(ACW::DashboardNotFoundError) do
      client.get_dashboard(ACW::GetDashboardInput.new("amazonite-nonexistent-dashboard"))
    end
    e.http.should_not be_nil
  end
end
