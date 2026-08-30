require "../spec_helper"

private alias ACWL = Amazonite::CloudWatchLogsV1
private alias AC = Amazonite::Core

describe "CloudWatchLogsV1: basic log group operations" do
  group_name = "/amazonite/integration-test"
  stream_name = "amazonite-integration-test-stream"
  client = ACWL::Client.new
  group_arn = ""

  it "removes an existing log group" do
    client.delete_log_group(ACWL::DeleteLogGroupRequest.new(group_name))
  rescue ACWL::ResourceNotFoundException
  end

  it "creates a log group" do
    response = client.create_log_group(ACWL::CreateLogGroupRequest.new(group_name))
    response.http.status_code.should eq(200)
  end

  it "creates a log stream and puts log events" do
    stream_response = client.create_log_stream(ACWL::CreateLogStreamRequest.new(group_name, stream_name))
    stream_response.http.status_code.should eq(200)

    event = ACWL::InputLogEvent.new(Time.utc.to_unix_ms, "hello from amazonite")
    put_response = client.put_log_events(ACWL::PutLogEventsRequest.new(group_name, stream_name, [event]))
    put_response.http.status_code.should eq(200)
    put_response.result.next_sequence_token.should_not be_nil
  end

  it "gets the log events" do
    response = client.get_log_events(ACWL::GetLogEventsRequest.new(stream_name, log_group_name: group_name))
    response.http.status_code.should eq(200)

    messages = (response.result.events || [] of ACWL::OutputLogEvent).map(&.message)
    messages.should contain("hello from amazonite")
  end

  it "describes the log group" do
    response = client.describe_log_groups(ACWL::DescribeLogGroupsRequest.new(log_group_name_prefix: group_name))
    response.http.status_code.should eq(200)

    groups = response.result.log_groups || [] of ACWL::LogGroup
    groups.map(&.log_group_name).should eq([group_name])
    group_arn = groups[0].log_group_arn || raise "expected a log group arn in the response"
  end

  it "tags the log group" do
    tag_response = client.tag_resource(ACWL::TagResourceRequest.new(group_arn, {"Environment" => "test"}))
    tag_response.http.status_code.should eq(200)

    list_response = client.list_tags_for_resource(ACWL::ListTagsForResourceRequest.new(group_arn))
    list_response.http.status_code.should eq(200)
    (list_response.result.tags || {} of String => String).should eq({"Environment" => "test"})

    untag_response = client.untag_resource(ACWL::UntagResourceRequest.new(group_arn, ["Environment"]))
    untag_response.http.status_code.should eq(200)

    list_response = client.list_tags_for_resource(ACWL::ListTagsForResourceRequest.new(group_arn))
    (list_response.result.tags || {} of String => String).should be_empty
  end

  it "deletes the log group" do
    response = client.delete_log_group(ACWL::DeleteLogGroupRequest.new(group_name))
    response.http.status_code.should eq(200)
  end

  it "throws a typed error" do
    e = expect_raises(ACWL::ResourceNotFoundException) do
      client.delete_log_group(ACWL::DeleteLogGroupRequest.new(group_name))
    end
    e.http.should_not be_nil
  end
end
