require "../spec_helper"

private alias SQS = Amazonite::SqsV1
private alias AC = Amazonite::Core

describe "SqsV1: basic queue operations" do
  queue_name = "integration-test-queue"
  client = SQS::Client.new
  queue_url = ""
  receipt_handle = ""

  it "removes an existing queue" do
    list_response = client.list_queues(SQS::ListQueuesRequest.new(queue_name))
    list_response.http.status_code.should eq(200)

    list_response.result.queue_urls.try &.each do |url|
      delete_response = client.delete_queue(SQS::DeleteQueueRequest.new(url))
      delete_response.http.status_code.should eq(200)
    end
  end

  it "creates a queue" do
    response = client.create_queue(SQS::CreateQueueRequest.new(queue_name))
    response.http.status_code.should eq(200)

    queue_url = response.result.queue_url || raise "expected a queue url in the response"
    queue_url.should_not be_empty
  end

  it "sets and gets queue attributes" do
    set_response = client.set_queue_attributes(
      SQS::SetQueueAttributesRequest.new(queue_url, {SQS::QueueAttributeName::VisibilityTimeout => "30"})
    )
    set_response.http.status_code.should eq(200)

    get_response = client.get_queue_attributes(
      SQS::GetQueueAttributesRequest.new(queue_url, [SQS::QueueAttributeName::VisibilityTimeout])
    )
    get_response.http.status_code.should eq(200)
    get_response.result.attributes.try(&.[SQS::QueueAttributeName::VisibilityTimeout]).should eq("30")
  end

  it "tags the queue" do
    tag_response = client.tag_queue(SQS::TagQueueRequest.new(queue_url, {"Environment" => "test"}))
    tag_response.http.status_code.should eq(200)

    list_response = client.list_queue_tags(SQS::ListQueueTagsRequest.new(queue_url))
    list_response.http.status_code.should eq(200)
    list_response.result.tags.should eq({"Environment" => "test"})

    untag_response = client.untag_queue(SQS::UntagQueueRequest.new(queue_url, ["Environment"]))
    untag_response.http.status_code.should eq(200)

    list_response = client.list_queue_tags(SQS::ListQueueTagsRequest.new(queue_url))
    list_response.http.status_code.should eq(200)
    (list_response.result.tags || {} of String => String).should be_empty
  end

  it "sends a message" do
    response = client.send_message(SQS::SendMessageRequest.new(queue_url, "hello from amazonite"))
    response.http.status_code.should eq(200)

    response.result.message_id.should_not be_nil
  end

  it "receives the message" do
    messages = [] of SQS::Message

    wait_until do
      request = SQS::ReceiveMessageRequest.new(queue_url, max_number_of_messages: 1, wait_time_seconds: 2)
      response = client.receive_message(request)
      response.http.status_code.should eq(200)

      messages = response.result.messages || [] of SQS::Message
      messages.size == 1
    end

    messages[0].body.should eq("hello from amazonite")
    receipt_handle = messages[0].receipt_handle || raise "expected a receipt handle on the received message"
  end

  it "deletes the message" do
    response = client.delete_message(SQS::DeleteMessageRequest.new(queue_url, receipt_handle))
    response.http.status_code.should eq(200)
  end

  it "sends and deletes a batch of messages" do
    entries = [
      SQS::SendMessageBatchRequestEntry.new("first", "batch message 1"),
      SQS::SendMessageBatchRequestEntry.new("second", "batch message 2"),
    ]
    send_response = client.send_message_batch(SQS::SendMessageBatchRequest.new(queue_url, entries))
    send_response.http.status_code.should eq(200)
    send_response.result.successful.size.should eq(2)
    send_response.result.failed.size.should eq(0)

    received = [] of SQS::Message
    wait_until do
      request = SQS::ReceiveMessageRequest.new(queue_url, max_number_of_messages: 10, wait_time_seconds: 2)
      response = client.receive_message(request)
      response.http.status_code.should eq(200)

      received.concat(response.result.messages || [] of SQS::Message)
      received.size == 2
    end

    delete_entries = received.map_with_index do |message, i|
      handle = message.receipt_handle || raise "expected a receipt handle on the received message"
      SQS::DeleteMessageBatchRequestEntry.new(i.to_s, handle)
    end

    delete_response = client.delete_message_batch(SQS::DeleteMessageBatchRequest.new(queue_url, delete_entries))
    delete_response.http.status_code.should eq(200)
    delete_response.result.successful.size.should eq(2)
    delete_response.result.failed.size.should eq(0)
  end

  it "lists the queue" do
    response = client.list_queues(SQS::ListQueuesRequest.new(queue_name))
    response.http.status_code.should eq(200)

    response.result.queue_urls.should eq([queue_url])
  end

  it "deletes the queue" do
    response = client.delete_queue(SQS::DeleteQueueRequest.new(queue_url))
    response.http.status_code.should eq(200)
  end

  it "throws a typed error" do
    e = expect_raises(SQS::QueueDoesNotExist) do
      client.get_queue_url(SQS::GetQueueUrlRequest.new(queue_name))
    end
    e.http.should_not be_nil
  end
end
