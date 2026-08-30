require "../spec_helper"

private alias AK = Amazonite::KinesisV1
private alias AC = Amazonite::Core

describe "KinesisV1: basic stream operations" do
  stream_name = "amazonite-integration-test-stream"
  client = AK::Client.new
  stream_arn = ""

  it "removes an existing stream" do
    client.delete_stream(AK::DeleteStreamInput.new(stream_name: stream_name))
  rescue AK::ResourceNotFoundException
  end

  it "creates a stream" do
    response = client.create_stream(AK::CreateStreamInput.new(stream_name: stream_name, shard_count: 1))
    response.http.status_code.should eq(200)

    wait_until do
      response = client.describe_stream_summary(AK::DescribeStreamSummaryInput.new(stream_name: stream_name))
      response.result.stream_description_summary.stream_status.active?
    rescue JSON::SerializableError
      # LocalStack omits OpenShardCount (a required field per the AWS API)
      # from the response while the stream is still in the CREATING state.
      false
    end

    response = client.describe_stream_summary(AK::DescribeStreamSummaryInput.new(stream_name: stream_name))
    response.http.status_code.should eq(200)
    stream_arn = response.result.stream_description_summary.stream_arn
  end

  it "puts and gets a record" do
    put_response = client.put_record(AK::PutRecordInput.new(
      data: "hello from amazonite".to_slice,
      partition_key: "amazonite",
      stream_name: stream_name,
    ))
    put_response.http.status_code.should eq(200)

    shard_iterator_response = client.get_shard_iterator(AK::GetShardIteratorInput.new(
      shard_id: put_response.result.shard_id,
      shard_iterator_type: AK::ShardIteratorType::TrimHorizon,
      stream_name: stream_name,
    ))
    shard_iterator_response.http.status_code.should eq(200)
    shard_iterator = shard_iterator_response.result.shard_iterator || raise "expected a shard iterator in the response"

    records_response = client.get_records(AK::GetRecordsInput.new(shard_iterator: shard_iterator))
    records_response.http.status_code.should eq(200)

    messages = records_response.result.records.map(&.data)
    messages.should contain("hello from amazonite".to_slice)
  end

  it "tags the stream" do
    tag_response = client.tag_resource(AK::TagResourceInput.new(tags: {"Environment" => "test"}, resource_arn: stream_arn))
    tag_response.http.status_code.should eq(200)

    list_response = client.list_tags_for_stream(AK::ListTagsForStreamInput.new(stream_name: stream_name))
    list_response.http.status_code.should eq(200)
    list_response.result.tags.map(&.key).should eq(["Environment"])

    untag_response = client.untag_resource(AK::UntagResourceInput.new(tag_keys: ["Environment"], resource_arn: stream_arn))
    untag_response.http.status_code.should eq(200)

    list_response = client.list_tags_for_stream(AK::ListTagsForStreamInput.new(stream_name: stream_name))
    list_response.result.tags.should be_empty
  end

  it "deletes the stream" do
    response = client.delete_stream(AK::DeleteStreamInput.new(stream_name: stream_name))
    response.http.status_code.should eq(200)

    wait_until do
      client.describe_stream_summary(AK::DescribeStreamSummaryInput.new(stream_name: stream_name))
      false
    rescue AK::ResourceNotFoundException
      true
    end
  end

  it "throws a typed error" do
    e = expect_raises(AK::ResourceNotFoundException) do
      client.describe_stream_summary(AK::DescribeStreamSummaryInput.new(stream_name: stream_name))
    end
    e.http.should_not be_nil
  end
end
