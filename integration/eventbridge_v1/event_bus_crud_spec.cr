require "../spec_helper"

private alias AEB = Amazonite::EventBridgeV1
private alias AC = Amazonite::Core

describe "EventBridgeV1: basic event bus operations" do
  bus_name = "amazonite-integration-test-bus"
  client = AEB::Client.new
  bus_arn = ""

  it "removes an existing event bus" do
    client.delete_event_bus(AEB::DeleteEventBusRequest.new(bus_name))
  rescue AEB::ResourceNotFoundException
  end

  it "creates an event bus" do
    response = client.create_event_bus(AEB::CreateEventBusRequest.new(bus_name))
    response.http.status_code.should eq(200)

    bus_arn = response.result.event_bus_arn || raise "expected an event bus arn in the response"
    bus_arn.should_not be_empty
  end

  it "describes the event bus" do
    response = client.describe_event_bus(AEB::DescribeEventBusRequest.new(bus_name))
    response.http.status_code.should eq(200)

    response.result.name.should eq(bus_name)
  end

  it "lists event buses" do
    response = client.list_event_buses(AEB::ListEventBusesRequest.new)
    response.http.status_code.should eq(200)

    names = (response.result.event_buses || [] of AEB::EventBus).map(&.name)
    names.should contain(bus_name)
  end

  it "tags the event bus" do
    tag_response = client.tag_resource(AEB::TagResourceRequest.new(bus_arn, [AEB::Tag.new("Environment", "test")]))
    tag_response.http.status_code.should eq(200)

    list_response = client.list_tags_for_resource(AEB::ListTagsForResourceRequest.new(bus_arn))
    list_response.http.status_code.should eq(200)
    tags = list_response.result.tags || [] of AEB::Tag
    tags.map(&.key).should eq(["Environment"])
    tags.map(&.value).should eq(["test"])

    untag_response = client.untag_resource(AEB::UntagResourceRequest.new(bus_arn, ["Environment"]))
    untag_response.http.status_code.should eq(200)

    list_response = client.list_tags_for_resource(AEB::ListTagsForResourceRequest.new(bus_arn))
    (list_response.result.tags || [] of AEB::Tag).should be_empty
  end

  it "publishes an event" do
    entry = AEB::PutEventsRequestEntry.new(
      source: "amazonite.integration-test",
      detail_type: "IntegrationTest",
      detail: %({"message": "hello from amazonite"}),
      event_bus_name: bus_name,
    )
    response = client.put_events(AEB::PutEventsRequest.new([entry]))
    response.http.status_code.should eq(200)

    response.result.failed_entry_count.should eq(0)
  end

  it "deletes the event bus" do
    response = client.delete_event_bus(AEB::DeleteEventBusRequest.new(bus_name))
    response.http.status_code.should eq(200)
  end

  it "throws a typed error" do
    e = expect_raises(AEB::ResourceNotFoundException) do
      client.describe_event_bus(AEB::DescribeEventBusRequest.new(bus_name))
    end
    e.http.should_not be_nil
  end
end
