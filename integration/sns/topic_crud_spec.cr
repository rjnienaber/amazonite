require "../spec_helper"

private alias SNS = Amazonite::Sns
private alias AC = Amazonite::Core

describe "Sns: basic topic operations" do
  topic_name = "amazonite-integration-test-topic"
  client = SNS::Client.new
  topic_arn = ""

  it "removes an existing topic" do
    list_response = client.list_topics(SNS::ListTopicsInput.new)
    arn = (list_response.result.topics || [] of SNS::Topic).find { |topic| topic.topic_arn.try(&.ends_with?(topic_name)) }.try(&.topic_arn)
    client.delete_topic(SNS::DeleteTopicInput.new(arn)) if arn
  end

  it "creates a topic" do
    response = client.create_topic(SNS::CreateTopicInput.new(topic_name))
    response.http.status_code.should eq(200)

    topic_arn = response.result.topic_arn || raise "expected a topic arn in the response"
    topic_arn.should_not be_empty
  end

  it "lists topics" do
    response = client.list_topics(SNS::ListTopicsInput.new)
    response.http.status_code.should eq(200)

    arns = (response.result.topics || [] of SNS::Topic).map(&.topic_arn)
    arns.should contain(topic_arn)
  end

  it "gets the topic attributes" do
    response = client.get_topic_attributes(SNS::GetTopicAttributesInput.new(topic_arn))
    response.http.status_code.should eq(200)

    attributes = response.result.attributes || {} of String => String
    attributes["TopicArn"].should eq(topic_arn)
  end

  it "tags the topic" do
    tag_response = client.tag_resource(SNS::TagResourceRequest.new(topic_arn, [SNS::Tag.new("Environment", "test")]))
    tag_response.http.status_code.should eq(200)

    list_response = client.list_tags_for_resource(SNS::ListTagsForResourceRequest.new(topic_arn))
    list_response.http.status_code.should eq(200)
    tags = list_response.result.tags || [] of SNS::Tag
    tags.map(&.key).should eq(["Environment"])
    tags.map(&.value).should eq(["test"])

    untag_response = client.untag_resource(SNS::UntagResourceRequest.new(topic_arn, ["Environment"]))
    untag_response.http.status_code.should eq(200)

    list_response = client.list_tags_for_resource(SNS::ListTagsForResourceRequest.new(topic_arn))
    (list_response.result.tags || [] of SNS::Tag).should be_empty
  end

  it "publishes a message with message attributes" do
    attributes = {"Priority" => SNS::MessageAttributeValue.new("Number", string_value: "1")}
    request = SNS::PublishInput.new(message: "hello from amazonite", topic_arn: topic_arn, message_attributes: attributes)
    response = client.publish(request)
    response.http.status_code.should eq(200)

    response.result.message_id.should_not be_nil
  end

  it "deletes the topic" do
    response = client.delete_topic(SNS::DeleteTopicInput.new(topic_arn))
    response.http.status_code.should eq(200)
  end

  it "throws a typed error" do
    e = expect_raises(SNS::NotFoundException) do
      client.get_topic_attributes(SNS::GetTopicAttributesInput.new(topic_arn))
    end
    e.http.should_not be_nil
  end
end
