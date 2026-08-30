private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # Represents an event to be submitted.
  class PutEventsRequestEntry
    include JSON::Serializable

    # The time stamp of the event, per [RFC3339](https://www.rfc-editor.org/rfc/rfc3339.txt). If no
    # time stamp is provided, the time stamp of the
    # [PutEvents](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEvents.html) call
    # is used.
    @[JSON::Field(key: "Time", converter: Core::AWSEpochConverter)]
    property time : Time | Nil

    # The source of the event.
    #
    # `Detail`, `DetailType`, and `Source` are required for EventBridge to successfully send an event
    # to an event bus. If you include event entries in a request that do not include each of those
    # properties, EventBridge fails that entry. If you submit a request in which *none* of the entries
    # have each of these properties, EventBridge fails the entire request.
    @[JSON::Field(key: "Source")]
    property source : String | Nil

    # Amazon Web Services resources, identified by Amazon Resource Name (ARN), which the event
    # primarily concerns. Any number, including zero, may be present.
    @[JSON::Field(key: "Resources")]
    property resources : Array(String) | Nil

    # Free-form string, with a maximum of 128 characters, used to decide what fields to expect in the
    # event detail.
    #
    # `Detail`, `DetailType`, and `Source` are required for EventBridge to successfully send an event
    # to an event bus. If you include event entries in a request that do not include each of those
    # properties, EventBridge fails that entry. If you submit a request in which *none* of the entries
    # have each of these properties, EventBridge fails the entire request.
    @[JSON::Field(key: "DetailType")]
    property detail_type : String | Nil

    # A valid JSON object. There is no other schema imposed. The JSON object may contain fields and
    # nested sub-objects.
    #
    # `Detail`, `DetailType`, and `Source` are required for EventBridge to successfully send an event
    # to an event bus. If you include event entries in a request that do not include each of those
    # properties, EventBridge fails that entry. If you submit a request in which *none* of the entries
    # have each of these properties, EventBridge fails the entire request.
    @[JSON::Field(key: "Detail")]
    property detail : String | Nil

    # The name or ARN of the event bus to receive the event. Only the rules that are associated with
    # this event bus are used to match the event. If you omit this, the default event bus is used.
    #
    # If you're using a global endpoint with a custom bus, you can enter either the name or Amazon
    # Resource Name (ARN) of the event bus in either the primary or secondary Region here. EventBridge
    # then determines the corresponding event bus in the other Region based on the endpoint referenced
    # by the `EndpointId`. Specifying the event bus ARN is preferred.
    @[JSON::Field(key: "EventBusName")]
    property event_bus_name : String | Nil

    # An X-Ray trace header, which is an http header (X-Amzn-Trace-Id) that contains the trace-id
    # associated with the event.
    #
    # To learn more about X-Ray trace headers, see [Tracing
    # header](https://docs.aws.amazon.com/xray/latest/devguide/xray-concepts.html#xray-concepts-tracingheader)
    # in the X-Ray Developer Guide.
    @[JSON::Field(key: "TraceHeader")]
    property trace_header : String | Nil

    def initialize(
      @time : Time | Nil = nil,
      @source : String | Nil = nil,
      @resources : Array(String) | Nil = nil,
      @detail_type : String | Nil = nil,
      @detail : String | Nil = nil,
      @event_bus_name : String | Nil = nil,
      @trace_header : String | Nil = nil,
    )
    end

    def_equals_and_hash(@time, @source, @resources, @detail_type, @detail, @event_bus_name, @trace_header)
  end
end
