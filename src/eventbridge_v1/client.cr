private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.eventbridge_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AWSEvents", "events", "1.1", EXCEPTION_FACTORY, config)
    end

    # Activates a partner event source that has been deactivated. Once activated, your matching event
    # bus will start receiving events from the event source.
    def activate_event_source(input : AEB::ActivateEventSourceRequest) : Core::Response
      Log.info { "performing 'ActivateEventSource' operation" }
      input.validate! if config.validate_input?
      response = post("ActivateEventSource", "/", input.to_json)
      Core::Response.new(response)
    end

    # Cancels the specified replay.
    def cancel_replay(input : AEB::CancelReplayRequest) : Core::ParsedResponse(AEB::CancelReplayResponse)
      Log.info { "performing 'CancelReplay' operation" }
      input.validate! if config.validate_input?
      response = post("CancelReplay", "/", input.to_json)
      Core::ParsedResponse(AEB::CancelReplayResponse).new(response)
    end

    # Creates an API destination, which is an HTTP invocation endpoint configured as a target for
    # events.
    #
    # API destinations do not support private destinations, such as interface VPC endpoints.
    #
    # For more information, see [API
    # destinations](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-api-destinations.html)
    # in the *EventBridge User Guide*.
    def create_api_destination(input : AEB::CreateApiDestinationRequest) : Core::ParsedResponse(AEB::CreateApiDestinationResponse)
      Log.info { "performing 'CreateApiDestination' operation" }
      input.validate! if config.validate_input?
      response = post("CreateApiDestination", "/", input.to_json)
      Core::ParsedResponse(AEB::CreateApiDestinationResponse).new(response)
    end

    # Creates an archive of events with the specified settings. When you create an archive, incoming
    # events might not immediately start being sent to the archive. Allow a short period of time for
    # changes to take effect. If you do not specify a pattern to filter events sent to the archive,
    # all events are sent to the archive except replayed events. Replayed events are not sent to an
    # archive.
    #
    # If you have specified that EventBridge use a customer managed key for encrypting the source
    # event bus, we strongly recommend you also specify a customer managed key for any archives for
    # the event bus as well.
    #
    # For more information, see [Encrypting
    # archives](https://docs.aws.amazon.com/eventbridge/latest/userguide/encryption-archives.html) in
    # the *Amazon EventBridge User Guide*.
    def create_archive(input : AEB::CreateArchiveRequest) : Core::ParsedResponse(AEB::CreateArchiveResponse)
      Log.info { "performing 'CreateArchive' operation" }
      input.validate! if config.validate_input?
      response = post("CreateArchive", "/", input.to_json)
      Core::ParsedResponse(AEB::CreateArchiveResponse).new(response)
    end

    # Creates a connection. A connection defines the authorization type and credentials to use for
    # authorization with an API destination HTTP endpoint.
    #
    # For more information, see [Connections for endpoint
    # targets](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-target-connection.html) in
    # the *Amazon EventBridge User Guide*.
    def create_connection(input : AEB::CreateConnectionRequest) : Core::ParsedResponse(AEB::CreateConnectionResponse)
      Log.info { "performing 'CreateConnection' operation" }
      input.validate! if config.validate_input?
      response = post("CreateConnection", "/", input.to_json)
      Core::ParsedResponse(AEB::CreateConnectionResponse).new(response)
    end

    # Creates a global endpoint. Global endpoints improve your application's availability by making it
    # regional-fault tolerant. To do this, you define a primary and secondary Region with event buses
    # in each Region. You also create a Amazon Route 53 health check that will tell EventBridge to
    # route events to the secondary Region when an "unhealthy" state is encountered and events will be
    # routed back to the primary Region when the health check reports a "healthy" state.
    def create_endpoint(input : AEB::CreateEndpointRequest) : Core::ParsedResponse(AEB::CreateEndpointResponse)
      Log.info { "performing 'CreateEndpoint' operation" }
      input.validate! if config.validate_input?
      response = post("CreateEndpoint", "/", input.to_json)
      Core::ParsedResponse(AEB::CreateEndpointResponse).new(response)
    end

    # Creates a new event bus within your account. This can be a custom event bus which you can use to
    # receive events from your custom applications and services, or it can be a partner event bus
    # which can be matched to a partner event source.
    def create_event_bus(input : AEB::CreateEventBusRequest) : Core::ParsedResponse(AEB::CreateEventBusResponse)
      Log.info { "performing 'CreateEventBus' operation" }
      input.validate! if config.validate_input?
      response = post("CreateEventBus", "/", input.to_json)
      Core::ParsedResponse(AEB::CreateEventBusResponse).new(response)
    end

    # Called by an SaaS partner to create a partner event source. This operation is not used by Amazon
    # Web Services customers.
    #
    # Each partner event source can be used by one Amazon Web Services account to create a matching
    # partner event bus in that Amazon Web Services account. A SaaS partner must create one partner
    # event source for each Amazon Web Services account that wants to receive those event types.
    #
    # A partner event source creates events based on resources within the SaaS partner's service or
    # application.
    #
    # An Amazon Web Services account that creates a partner event bus that matches the partner event
    # source can use that event bus to receive events from the partner, and then process them using
    # Amazon Web Services Events rules and targets.
    #
    # Partner event source names follow this format:
    #
    # ` *partner_name*/*event_namespace*/*event_name* `
    #
    # - *partner_name* is determined during partner registration, and identifies the partner to Amazon
    # Web Services customers.
    #
    # - *event_namespace* is determined by the partner, and is a way for the partner to categorize
    # their events.
    #
    # - *event_name* is determined by the partner, and should uniquely identify an event-generating
    # resource within the partner system.
    #
    # The *event_name* must be unique across all Amazon Web Services customers. This is because the
    # event source is a shared resource between the partner and customer accounts, and each partner
    # event source unique in the partner account.
    #
    # The combination of *event_namespace* and *event_name* should help Amazon Web Services customers
    # decide whether to create an event bus to receive these events.
    def create_partner_event_source(input : AEB::CreatePartnerEventSourceRequest) : Core::ParsedResponse(AEB::CreatePartnerEventSourceResponse)
      Log.info { "performing 'CreatePartnerEventSource' operation" }
      input.validate! if config.validate_input?
      response = post("CreatePartnerEventSource", "/", input.to_json)
      Core::ParsedResponse(AEB::CreatePartnerEventSourceResponse).new(response)
    end

    # You can use this operation to temporarily stop receiving events from the specified partner event
    # source. The matching event bus is not deleted.
    #
    # When you deactivate a partner event source, the source goes into PENDING state. If it remains in
    # PENDING state for more than two weeks, it is deleted.
    #
    # To activate a deactivated partner event source, use
    # [ActivateEventSource](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ActivateEventSource.html).
    def deactivate_event_source(input : AEB::DeactivateEventSourceRequest) : Core::Response
      Log.info { "performing 'DeactivateEventSource' operation" }
      input.validate! if config.validate_input?
      response = post("DeactivateEventSource", "/", input.to_json)
      Core::Response.new(response)
    end

    # Removes all authorization parameters from the connection. This lets you remove the secret from
    # the connection so you can reuse it without having to create a new connection.
    def deauthorize_connection(input : AEB::DeauthorizeConnectionRequest) : Core::ParsedResponse(AEB::DeauthorizeConnectionResponse)
      Log.info { "performing 'DeauthorizeConnection' operation" }
      input.validate! if config.validate_input?
      response = post("DeauthorizeConnection", "/", input.to_json)
      Core::ParsedResponse(AEB::DeauthorizeConnectionResponse).new(response)
    end

    # Deletes the specified API destination.
    def delete_api_destination(input : AEB::DeleteApiDestinationRequest) : Core::ParsedResponse(AEB::DeleteApiDestinationResponse)
      Log.info { "performing 'DeleteApiDestination' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteApiDestination", "/", input.to_json)
      Core::ParsedResponse(AEB::DeleteApiDestinationResponse).new(response)
    end

    # Deletes the specified archive.
    def delete_archive(input : AEB::DeleteArchiveRequest) : Core::ParsedResponse(AEB::DeleteArchiveResponse)
      Log.info { "performing 'DeleteArchive' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteArchive", "/", input.to_json)
      Core::ParsedResponse(AEB::DeleteArchiveResponse).new(response)
    end

    # Deletes a connection.
    def delete_connection(input : AEB::DeleteConnectionRequest) : Core::ParsedResponse(AEB::DeleteConnectionResponse)
      Log.info { "performing 'DeleteConnection' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteConnection", "/", input.to_json)
      Core::ParsedResponse(AEB::DeleteConnectionResponse).new(response)
    end

    # Delete an existing global endpoint. For more information about global endpoints, see [Making
    # applications Regional-fault tolerant with global endpoints and event
    # replication](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html)
    # in the * *Amazon EventBridge User Guide* *.
    def delete_endpoint(input : AEB::DeleteEndpointRequest) : Core::ParsedResponse(AEB::DeleteEndpointResponse)
      Log.info { "performing 'DeleteEndpoint' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteEndpoint", "/", input.to_json)
      Core::ParsedResponse(AEB::DeleteEndpointResponse).new(response)
    end

    # Deletes the specified custom event bus or partner event bus. All rules associated with this
    # event bus need to be deleted. You can't delete your account's default event bus.
    def delete_event_bus(input : AEB::DeleteEventBusRequest) : Core::Response
      Log.info { "performing 'DeleteEventBus' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteEventBus", "/", input.to_json)
      Core::Response.new(response)
    end

    # This operation is used by SaaS partners to delete a partner event source. This operation is not
    # used by Amazon Web Services customers.
    #
    # When you delete an event source, the status of the corresponding partner event bus in the Amazon
    # Web Services customer account becomes DELETED.
    def delete_partner_event_source(input : AEB::DeletePartnerEventSourceRequest) : Core::Response
      Log.info { "performing 'DeletePartnerEventSource' operation" }
      input.validate! if config.validate_input?
      response = post("DeletePartnerEventSource", "/", input.to_json)
      Core::Response.new(response)
    end

    # Deletes the specified rule.
    #
    # Before you can delete the rule, you must remove all targets, using
    # [RemoveTargets](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_RemoveTargets.html).
    #
    # When you delete a rule, incoming events might continue to match to the deleted rule. Allow a
    # short period of time for changes to take effect.
    #
    # If you call delete rule multiple times for the same rule, all calls will succeed. When you call
    # delete rule for a non-existent custom eventbus, `ResourceNotFoundException` is returned.
    #
    # Managed rules are rules created and managed by another Amazon Web Services service on your
    # behalf. These rules are created by those other Amazon Web Services services to support
    # functionality in those services. You can delete these rules using the `Force` option, but you
    # should do so only if you are sure the other service is not still using that rule.
    def delete_rule(input : AEB::DeleteRuleRequest) : Core::Response
      Log.info { "performing 'DeleteRule' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteRule", "/", input.to_json)
      Core::Response.new(response)
    end

    # Retrieves details about an API destination.
    def describe_api_destination(input : AEB::DescribeApiDestinationRequest) : Core::ParsedResponse(AEB::DescribeApiDestinationResponse)
      Log.info { "performing 'DescribeApiDestination' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeApiDestination", "/", input.to_json)
      Core::ParsedResponse(AEB::DescribeApiDestinationResponse).new(response)
    end

    # Retrieves details about an archive.
    def describe_archive(input : AEB::DescribeArchiveRequest) : Core::ParsedResponse(AEB::DescribeArchiveResponse)
      Log.info { "performing 'DescribeArchive' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeArchive", "/", input.to_json)
      Core::ParsedResponse(AEB::DescribeArchiveResponse).new(response)
    end

    # Retrieves details about a connection.
    def describe_connection(input : AEB::DescribeConnectionRequest) : Core::ParsedResponse(AEB::DescribeConnectionResponse)
      Log.info { "performing 'DescribeConnection' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeConnection", "/", input.to_json)
      Core::ParsedResponse(AEB::DescribeConnectionResponse).new(response)
    end

    # Get the information about an existing global endpoint. For more information about global
    # endpoints, see [Making applications Regional-fault tolerant with global endpoints and event
    # replication](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html)
    # in the * *Amazon EventBridge User Guide* *.
    def describe_endpoint(input : AEB::DescribeEndpointRequest) : Core::ParsedResponse(AEB::DescribeEndpointResponse)
      Log.info { "performing 'DescribeEndpoint' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeEndpoint", "/", input.to_json)
      Core::ParsedResponse(AEB::DescribeEndpointResponse).new(response)
    end

    # Displays details about an event bus in your account. This can include the external Amazon Web
    # Services accounts that are permitted to write events to your default event bus, and the
    # associated policy. For custom event buses and partner event buses, it displays the name, ARN,
    # policy, state, and creation time.
    #
    # To enable your account to receive events from other accounts on its default event bus, use
    # [PutPermission](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html).
    #
    # For more information about partner event buses, see
    # [CreateEventBus](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html).
    def describe_event_bus(input : AEB::DescribeEventBusRequest) : Core::ParsedResponse(AEB::DescribeEventBusResponse)
      Log.info { "performing 'DescribeEventBus' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeEventBus", "/", input.to_json)
      Core::ParsedResponse(AEB::DescribeEventBusResponse).new(response)
    end

    # This operation lists details about a partner event source that is shared with your account.
    def describe_event_source(input : AEB::DescribeEventSourceRequest) : Core::ParsedResponse(AEB::DescribeEventSourceResponse)
      Log.info { "performing 'DescribeEventSource' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeEventSource", "/", input.to_json)
      Core::ParsedResponse(AEB::DescribeEventSourceResponse).new(response)
    end

    # An SaaS partner can use this operation to list details about a partner event source that they
    # have created. Amazon Web Services customers do not use this operation. Instead, Amazon Web
    # Services customers can use
    # [DescribeEventSource](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventSource.html)
    # to see details about a partner event source that is shared with them.
    def describe_partner_event_source(input : AEB::DescribePartnerEventSourceRequest) : Core::ParsedResponse(AEB::DescribePartnerEventSourceResponse)
      Log.info { "performing 'DescribePartnerEventSource' operation" }
      input.validate! if config.validate_input?
      response = post("DescribePartnerEventSource", "/", input.to_json)
      Core::ParsedResponse(AEB::DescribePartnerEventSourceResponse).new(response)
    end

    # Retrieves details about a replay. Use `DescribeReplay` to determine the progress of a running
    # replay. A replay processes events to replay based on the time in the event, and replays them
    # using 1 minute intervals. If you use `StartReplay` and specify an `EventStartTime` and an
    # `EventEndTime` that covers a 20 minute time range, the events are replayed from the first minute
    # of that 20 minute range first. Then the events from the second minute are replayed. You can use
    # `DescribeReplay` to determine the progress of a replay. The value returned for
    # `EventLastReplayedTime` indicates the time within the specified time range associated with the
    # last event replayed.
    def describe_replay(input : AEB::DescribeReplayRequest) : Core::ParsedResponse(AEB::DescribeReplayResponse)
      Log.info { "performing 'DescribeReplay' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeReplay", "/", input.to_json)
      Core::ParsedResponse(AEB::DescribeReplayResponse).new(response)
    end

    # Describes the specified rule.
    #
    # DescribeRule does not list the targets of a rule. To see the targets associated with a rule, use
    # [ListTargetsByRule](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html).
    def describe_rule(input : AEB::DescribeRuleRequest) : Core::ParsedResponse(AEB::DescribeRuleResponse)
      Log.info { "performing 'DescribeRule' operation" }
      input.validate! if config.validate_input?
      response = post("DescribeRule", "/", input.to_json)
      Core::ParsedResponse(AEB::DescribeRuleResponse).new(response)
    end

    # Disables the specified rule. A disabled rule won't match any events, and won't self-trigger if
    # it has a schedule expression.
    #
    # When you disable a rule, incoming events might continue to match to the disabled rule. Allow a
    # short period of time for changes to take effect.
    def disable_rule(input : AEB::DisableRuleRequest) : Core::Response
      Log.info { "performing 'DisableRule' operation" }
      input.validate! if config.validate_input?
      response = post("DisableRule", "/", input.to_json)
      Core::Response.new(response)
    end

    # Enables the specified rule. If the rule does not exist, the operation fails.
    #
    # When you enable a rule, incoming events might not immediately start matching to a newly enabled
    # rule. Allow a short period of time for changes to take effect.
    def enable_rule(input : AEB::EnableRuleRequest) : Core::Response
      Log.info { "performing 'EnableRule' operation" }
      input.validate! if config.validate_input?
      response = post("EnableRule", "/", input.to_json)
      Core::Response.new(response)
    end

    # Retrieves a list of API destination in the account in the current Region.
    def list_api_destinations(input : AEB::ListApiDestinationsRequest) : Core::ParsedResponse(AEB::ListApiDestinationsResponse)
      Log.info { "performing 'ListApiDestinations' operation" }
      input.validate! if config.validate_input?
      response = post("ListApiDestinations", "/", input.to_json)
      Core::ParsedResponse(AEB::ListApiDestinationsResponse).new(response)
    end

    # Lists your archives. You can either list all the archives or you can provide a prefix to match
    # to the archive names. Filter parameters are exclusive.
    def list_archives(input : AEB::ListArchivesRequest) : Core::ParsedResponse(AEB::ListArchivesResponse)
      Log.info { "performing 'ListArchives' operation" }
      input.validate! if config.validate_input?
      response = post("ListArchives", "/", input.to_json)
      Core::ParsedResponse(AEB::ListArchivesResponse).new(response)
    end

    # Retrieves a list of connections from the account.
    def list_connections(input : AEB::ListConnectionsRequest) : Core::ParsedResponse(AEB::ListConnectionsResponse)
      Log.info { "performing 'ListConnections' operation" }
      input.validate! if config.validate_input?
      response = post("ListConnections", "/", input.to_json)
      Core::ParsedResponse(AEB::ListConnectionsResponse).new(response)
    end

    # List the global endpoints associated with this account. For more information about global
    # endpoints, see [Making applications Regional-fault tolerant with global endpoints and event
    # replication](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html)
    # in the * *Amazon EventBridge User Guide* *.
    def list_endpoints(input : AEB::ListEndpointsRequest) : Core::ParsedResponse(AEB::ListEndpointsResponse)
      Log.info { "performing 'ListEndpoints' operation" }
      input.validate! if config.validate_input?
      response = post("ListEndpoints", "/", input.to_json)
      Core::ParsedResponse(AEB::ListEndpointsResponse).new(response)
    end

    # Lists all the event buses in your account, including the default event bus, custom event buses,
    # and partner event buses.
    def list_event_buses(input : AEB::ListEventBusesRequest) : Core::ParsedResponse(AEB::ListEventBusesResponse)
      Log.info { "performing 'ListEventBuses' operation" }
      input.validate! if config.validate_input?
      response = post("ListEventBuses", "/", input.to_json)
      Core::ParsedResponse(AEB::ListEventBusesResponse).new(response)
    end

    # You can use this to see all the partner event sources that have been shared with your Amazon Web
    # Services account. For more information about partner event sources, see
    # [CreateEventBus](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html).
    def list_event_sources(input : AEB::ListEventSourcesRequest) : Core::ParsedResponse(AEB::ListEventSourcesResponse)
      Log.info { "performing 'ListEventSources' operation" }
      input.validate! if config.validate_input?
      response = post("ListEventSources", "/", input.to_json)
      Core::ParsedResponse(AEB::ListEventSourcesResponse).new(response)
    end

    # An SaaS partner can use this operation to display the Amazon Web Services account ID that a
    # particular partner event source name is associated with. This operation is not used by Amazon
    # Web Services customers.
    def list_partner_event_source_accounts(input : AEB::ListPartnerEventSourceAccountsRequest) : Core::ParsedResponse(AEB::ListPartnerEventSourceAccountsResponse)
      Log.info { "performing 'ListPartnerEventSourceAccounts' operation" }
      input.validate! if config.validate_input?
      response = post("ListPartnerEventSourceAccounts", "/", input.to_json)
      Core::ParsedResponse(AEB::ListPartnerEventSourceAccountsResponse).new(response)
    end

    # An SaaS partner can use this operation to list all the partner event source names that they have
    # created. This operation is not used by Amazon Web Services customers.
    def list_partner_event_sources(input : AEB::ListPartnerEventSourcesRequest) : Core::ParsedResponse(AEB::ListPartnerEventSourcesResponse)
      Log.info { "performing 'ListPartnerEventSources' operation" }
      input.validate! if config.validate_input?
      response = post("ListPartnerEventSources", "/", input.to_json)
      Core::ParsedResponse(AEB::ListPartnerEventSourcesResponse).new(response)
    end

    # Lists your replays. You can either list all the replays or you can provide a prefix to match to
    # the replay names. Filter parameters are exclusive.
    def list_replays(input : AEB::ListReplaysRequest) : Core::ParsedResponse(AEB::ListReplaysResponse)
      Log.info { "performing 'ListReplays' operation" }
      input.validate! if config.validate_input?
      response = post("ListReplays", "/", input.to_json)
      Core::ParsedResponse(AEB::ListReplaysResponse).new(response)
    end

    # Lists the rules for the specified target. You can see which of the rules in Amazon EventBridge
    # can invoke a specific target in your account.
    #
    # The maximum number of results per page for requests is 100.
    def list_rule_names_by_target(input : AEB::ListRuleNamesByTargetRequest) : Core::ParsedResponse(AEB::ListRuleNamesByTargetResponse)
      Log.info { "performing 'ListRuleNamesByTarget' operation" }
      input.validate! if config.validate_input?
      response = post("ListRuleNamesByTarget", "/", input.to_json)
      Core::ParsedResponse(AEB::ListRuleNamesByTargetResponse).new(response)
    end

    # Lists your Amazon EventBridge rules. You can either list all the rules or you can provide a
    # prefix to match to the rule names.
    #
    # The maximum number of results per page for requests is 100.
    #
    # ListRules does not list the targets of a rule. To see the targets associated with a rule, use
    # [ListTargetsByRule](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html).
    def list_rules(input : AEB::ListRulesRequest) : Core::ParsedResponse(AEB::ListRulesResponse)
      Log.info { "performing 'ListRules' operation" }
      input.validate! if config.validate_input?
      response = post("ListRules", "/", input.to_json)
      Core::ParsedResponse(AEB::ListRulesResponse).new(response)
    end

    # Displays the tags associated with an EventBridge resource. In EventBridge, rules and event buses
    # can be tagged.
    def list_tags_for_resource(input : AEB::ListTagsForResourceRequest) : Core::ParsedResponse(AEB::ListTagsForResourceResponse)
      Log.info { "performing 'ListTagsForResource' operation" }
      input.validate! if config.validate_input?
      response = post("ListTagsForResource", "/", input.to_json)
      Core::ParsedResponse(AEB::ListTagsForResourceResponse).new(response)
    end

    # Lists the targets assigned to the specified rule.
    #
    # The maximum number of results per page for requests is 100.
    def list_targets_by_rule(input : AEB::ListTargetsByRuleRequest) : Core::ParsedResponse(AEB::ListTargetsByRuleResponse)
      Log.info { "performing 'ListTargetsByRule' operation" }
      input.validate! if config.validate_input?
      response = post("ListTargetsByRule", "/", input.to_json)
      Core::ParsedResponse(AEB::ListTargetsByRuleResponse).new(response)
    end

    # Sends custom events to Amazon EventBridge so that they can be matched to rules.
    #
    # You can batch multiple event entries into one request for efficiency. However, the total entry
    # size must be less than 256KB. You can calculate the entry size before you send the events. For
    # more information, see [Calculating PutEvents event entry
    # size](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-putevents.html#eb-putevent-size)
    # in the * *Amazon EventBridge User Guide* *.
    #
    # PutEvents accepts the data in JSON format. For the JSON number (integer) data type, the
    # constraints are: a minimum value of -9,223,372,036,854,775,808 and a maximum value of
    # 9,223,372,036,854,775,807.
    #
    # PutEvents will only process nested JSON up to 1000 levels deep.
    def put_events(input : AEB::PutEventsRequest) : Core::ParsedResponse(AEB::PutEventsResponse)
      Log.info { "performing 'PutEvents' operation" }
      input.validate! if config.validate_input?
      response = post("PutEvents", "/", input.to_json)
      Core::ParsedResponse(AEB::PutEventsResponse).new(response)
    end

    # This is used by SaaS partners to write events to a customer's partner event bus. Amazon Web
    # Services customers do not use this operation.
    #
    # For information on calculating event batch size, see [Calculating EventBridge PutEvents event
    # entry size](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-putevent-size.html) in
    # the *EventBridge User Guide*.
    def put_partner_events(input : AEB::PutPartnerEventsRequest) : Core::ParsedResponse(AEB::PutPartnerEventsResponse)
      Log.info { "performing 'PutPartnerEvents' operation" }
      input.validate! if config.validate_input?
      response = post("PutPartnerEvents", "/", input.to_json)
      Core::ParsedResponse(AEB::PutPartnerEventsResponse).new(response)
    end

    # Running `PutPermission` permits the specified Amazon Web Services account or Amazon Web Services
    # organization to put events to the specified *event bus*. Amazon EventBridge rules in your
    # account are triggered by these events arriving to an event bus in your account.
    #
    # For another account to send events to your account, that external account must have an
    # EventBridge rule with your account's event bus as a target.
    #
    # To enable multiple Amazon Web Services accounts to put events to your event bus, run
    # `PutPermission` once for each of these accounts. Or, if all the accounts are members of the same
    # Amazon Web Services organization, you can run `PutPermission` once specifying `Principal` as "*"
    # and specifying the Amazon Web Services organization ID in `Condition`, to grant permissions to
    # all accounts in that organization.
    #
    # If you grant permissions using an organization, then accounts in that organization must specify
    # a `RoleArn` with proper permissions when they use `PutTarget` to add your account's event bus as
    # a target. For more information, see [Sending and Receiving Events Between Amazon Web Services
    # Accounts](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html)
    # in the *Amazon EventBridge User Guide*.
    #
    # The permission policy on the event bus cannot exceed 10 KB in size.
    def put_permission(input : AEB::PutPermissionRequest) : Core::Response
      Log.info { "performing 'PutPermission' operation" }
      input.validate! if config.validate_input?
      response = post("PutPermission", "/", input.to_json)
      Core::Response.new(response)
    end

    # Creates or updates the specified rule. Rules are enabled by default, or based on value of the
    # state. You can disable a rule using
    # [DisableRule](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DisableRule.html).
    #
    # A single rule watches for events from a single event bus. Events generated by Amazon Web
    # Services services go to your account's default event bus. Events generated by SaaS partner
    # services or applications go to the matching partner event bus. If you have custom applications
    # or services, you can specify whether their events go to your default event bus or a custom event
    # bus that you have created. For more information, see
    # [CreateEventBus](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html).
    #
    # If you are updating an existing rule, the rule is replaced with what you specify in this
    # `PutRule` command. If you omit arguments in `PutRule`, the old values for those arguments are
    # not kept. Instead, they are replaced with null values.
    #
    # When you create or update a rule, incoming events might not immediately start matching to new or
    # updated rules. Allow a short period of time for changes to take effect.
    #
    # A rule must contain at least an EventPattern or ScheduleExpression. Rules with EventPatterns are
    # triggered when a matching event is observed. Rules with ScheduleExpressions self-trigger based
    # on the given schedule. A rule can have both an EventPattern and a ScheduleExpression, in which
    # case the rule triggers on matching events as well as on a schedule.
    #
    # When you initially create a rule, you can optionally assign one or more tags to the rule. Tags
    # can help you organize and categorize your resources. You can also use them to scope user
    # permissions, by granting a user permission to access or change only rules with certain tag
    # values. To use the `PutRule` operation and assign tags, you must have both the `events:PutRule`
    # and `events:TagResource` permissions.
    #
    # If you are updating an existing rule, any tags you specify in the `PutRule` operation are
    # ignored. To update the tags of an existing rule, use
    # [TagResource](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_TagResource.html)
    # and
    # [UntagResource](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UntagResource.html).
    #
    # Most services in Amazon Web Services treat : or / as the same character in Amazon Resource Names
    # (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be sure to use the
    # correct ARN characters when creating event patterns so that they match the ARN syntax in the
    # event you want to match.
    #
    # In EventBridge, it is possible to create rules that lead to infinite loops, where a rule is
    # fired repeatedly. For example, a rule might detect that ACLs have changed on an S3 bucket, and
    # trigger software to change them to the desired state. If the rule is not written carefully, the
    # subsequent change to the ACLs fires the rule again, creating an infinite loop.
    #
    # To prevent this, write the rules so that the triggered actions do not re-fire the same rule. For
    # example, your rule could fire only if ACLs are found to be in a bad state, instead of after any
    # change.
    #
    # An infinite loop can quickly cause higher than expected charges. We recommend that you use
    # budgeting, which alerts you when charges exceed your specified limit. For more information, see
    # [Managing Your Costs with
    # Budgets](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html).
    #
    # To create a rule that filters for management events from Amazon Web Services services, see
    # [Receiving read-only management events from Amazon Web Services
    # services](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event-cloudtrail.html#eb-service-event-cloudtrail-management)
    # in the *EventBridge User Guide*.
    def put_rule(input : AEB::PutRuleRequest) : Core::ParsedResponse(AEB::PutRuleResponse)
      Log.info { "performing 'PutRule' operation" }
      input.validate! if config.validate_input?
      response = post("PutRule", "/", input.to_json)
      Core::ParsedResponse(AEB::PutRuleResponse).new(response)
    end

    # Adds the specified targets to the specified rule, or updates the targets if they are already
    # associated with the rule.
    #
    # Targets are the resources that are invoked when a rule is triggered.
    #
    # The maximum number of entries per request is 10.
    #
    # Each rule can have up to five (5) targets associated with it at one time.
    #
    # For a list of services you can configure as targets for events, see [EventBridge
    # targets](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-targets.html) in the *
    # *Amazon EventBridge User Guide* *.
    #
    # Creating rules with built-in targets is supported only in the Amazon Web Services Management
    # Console. The built-in targets are:
    #
    # - `Amazon EBS CreateSnapshot API call`
    #
    # - `Amazon EC2 RebootInstances API call`
    #
    # - `Amazon EC2 StopInstances API call`
    #
    # - `Amazon EC2 TerminateInstances API call`
    #
    # For some target types, `PutTargets` provides target-specific parameters. If the target is a
    # Kinesis data stream, you can optionally specify which shard the event goes to by using the
    # `KinesisParameters` argument. To invoke a command on multiple EC2 instances with one rule, you
    # can use the `RunCommandParameters` field.
    #
    # To be able to make API calls against the resources that you own, Amazon EventBridge needs the
    # appropriate permissions:
    #
    # - For Lambda and Amazon SNS resources, EventBridge relies on resource-based policies.
    #
    # - For EC2 instances, Kinesis Data Streams, Step Functions state machines and API Gateway APIs,
    # EventBridge relies on IAM roles that you specify in the `RoleARN` argument in `PutTargets`.
    #
    # For more information, see [Authentication and Access
    # Control](https://docs.aws.amazon.com/eventbridge/latest/userguide/auth-and-access-control-eventbridge.html)
    # in the * *Amazon EventBridge User Guide* *.
    #
    # If another Amazon Web Services account is in the same region and has granted you permission
    # (using `PutPermission`), you can send events to that account. Set that account's event bus as a
    # target of the rules in your account. To send the matched events to the other account, specify
    # that account's event bus as the `Arn` value when you run `PutTargets`. If your account sends
    # events to another account, your account is charged for each sent event. Each event sent to
    # another account is charged as a custom event. The account receiving the event is not charged.
    # For more information, see [Amazon EventBridge
    # Pricing](http://aws.amazon.com/eventbridge/pricing/).
    #
    # `Input`, `InputPath`, and `InputTransformer` are not available with `PutTarget` if the target is
    # an event bus of a different Amazon Web Services account.
    #
    # If you are setting the event bus of another account as the target, and that account granted
    # permission to your account through an organization instead of directly by the account ID, then
    # you must specify a `RoleArn` with proper permissions in the `Target` structure. For more
    # information, see [Sending and Receiving Events Between Amazon Web Services
    # Accounts](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html)
    # in the *Amazon EventBridge User Guide*.
    #
    # If you have an IAM role on a cross-account event bus target, a `PutTargets` call without a role
    # on the same target (same `Id` and `Arn`) will not remove the role.
    #
    # For more information about enabling cross-account events, see
    # [PutPermission](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html).
    #
    # **Input**, **InputPath**, and **InputTransformer** are mutually exclusive and optional
    # parameters of a target. When a rule is triggered due to a matched event:
    #
    # - If none of the following arguments are specified for a target, then the entire event is passed
    # to the target in JSON format (unless the target is Amazon EC2 Run Command or Amazon ECS task, in
    # which case nothing from the event is passed to the target).
    #
    # - If **Input** is specified in the form of valid JSON, then the matched event is overridden with
    # this constant.
    #
    # - If **InputPath** is specified in the form of JSONPath (for example, `$.detail`), then only the
    # part of the event specified in the path is passed to the target (for example, only the detail
    # part of the event is passed).
    #
    # - If **InputTransformer** is specified, then one or more specified JSONPaths are extracted from
    # the event and used as values in a template that you specify as the input to the target.
    #
    # When you specify `InputPath` or `InputTransformer`, you must use JSON dot notation, not bracket
    # notation.
    #
    # When you add targets to a rule and the associated rule triggers soon after, new or updated
    # targets might not be immediately invoked. Allow a short period of time for changes to take
    # effect.
    #
    # This action can partially fail if too many requests are made at the same time. If that happens,
    # `FailedEntryCount` is non-zero in the response and each entry in `FailedEntries` provides the ID
    # of the failed target and the error code.
    def put_targets(input : AEB::PutTargetsRequest) : Core::ParsedResponse(AEB::PutTargetsResponse)
      Log.info { "performing 'PutTargets' operation" }
      input.validate! if config.validate_input?
      response = post("PutTargets", "/", input.to_json)
      Core::ParsedResponse(AEB::PutTargetsResponse).new(response)
    end

    # Revokes the permission of another Amazon Web Services account to be able to put events to the
    # specified event bus. Specify the account to revoke by the `StatementId` value that you
    # associated with the account when you granted it permission with `PutPermission`. You can find
    # the `StatementId` by using
    # [DescribeEventBus](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventBus.html).
    def remove_permission(input : AEB::RemovePermissionRequest) : Core::Response
      Log.info { "performing 'RemovePermission' operation" }
      input.validate! if config.validate_input?
      response = post("RemovePermission", "/", input.to_json)
      Core::Response.new(response)
    end

    # Removes the specified targets from the specified rule. When the rule is triggered, those targets
    # are no longer be invoked.
    #
    # A successful execution of `RemoveTargets` doesn't guarantee all targets are removed from the
    # rule, it means that the target(s) listed in the request are removed.
    #
    # When you remove a target, when the associated rule triggers, removed targets might continue to
    # be invoked. Allow a short period of time for changes to take effect.
    #
    # This action can partially fail if too many requests are made at the same time. If that happens,
    # `FailedEntryCount` is non-zero in the response and each entry in `FailedEntries` provides the ID
    # of the failed target and the error code.
    #
    # The maximum number of entries per request is 10.
    def remove_targets(input : AEB::RemoveTargetsRequest) : Core::ParsedResponse(AEB::RemoveTargetsResponse)
      Log.info { "performing 'RemoveTargets' operation" }
      input.validate! if config.validate_input?
      response = post("RemoveTargets", "/", input.to_json)
      Core::ParsedResponse(AEB::RemoveTargetsResponse).new(response)
    end

    # Starts the specified replay. Events are not necessarily replayed in the exact same order that
    # they were added to the archive. A replay processes events to replay based on the time in the
    # event, and replays them using 1 minute intervals. If you specify an `EventStartTime` and an
    # `EventEndTime` that covers a 20 minute time range, the events are replayed from the first minute
    # of that 20 minute range first. Then the events from the second minute are replayed. You can use
    # `DescribeReplay` to determine the progress of a replay. The value returned for
    # `EventLastReplayedTime` indicates the time within the specified time range associated with the
    # last event replayed.
    def start_replay(input : AEB::StartReplayRequest) : Core::ParsedResponse(AEB::StartReplayResponse)
      Log.info { "performing 'StartReplay' operation" }
      input.validate! if config.validate_input?
      response = post("StartReplay", "/", input.to_json)
      Core::ParsedResponse(AEB::StartReplayResponse).new(response)
    end

    # Assigns one or more tags (key-value pairs) to the specified EventBridge resource. Tags can help
    # you organize and categorize your resources. You can also use them to scope user permissions by
    # granting a user permission to access or change only resources with certain tag values. In
    # EventBridge, rules and event buses can be tagged.
    #
    # Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as
    # strings of characters.
    #
    # You can use the `TagResource` action with a resource that already has tags. If you specify a new
    # tag key, this tag is appended to the list of tags associated with the resource. If you specify a
    # tag key that is already associated with the resource, the new tag value that you specify
    # replaces the previous value for that tag.
    #
    # You can associate as many as 50 tags with a resource.
    def tag_resource(input : AEB::TagResourceRequest) : Core::ParsedResponse(AEB::TagResourceResponse)
      Log.info { "performing 'TagResource' operation" }
      input.validate! if config.validate_input?
      response = post("TagResource", "/", input.to_json)
      Core::ParsedResponse(AEB::TagResourceResponse).new(response)
    end

    # Tests whether the specified event pattern matches the provided event.
    #
    # Most services in Amazon Web Services treat : or / as the same character in Amazon Resource Names
    # (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be sure to use the
    # correct ARN characters when creating event patterns so that they match the ARN syntax in the
    # event you want to match.
    def test_event_pattern(input : AEB::TestEventPatternRequest) : Core::ParsedResponse(AEB::TestEventPatternResponse)
      Log.info { "performing 'TestEventPattern' operation" }
      input.validate! if config.validate_input?
      response = post("TestEventPattern", "/", input.to_json)
      Core::ParsedResponse(AEB::TestEventPatternResponse).new(response)
    end

    # Removes one or more tags from the specified EventBridge resource. In Amazon EventBridge, rules
    # and event buses can be tagged.
    def untag_resource(input : AEB::UntagResourceRequest) : Core::ParsedResponse(AEB::UntagResourceResponse)
      Log.info { "performing 'UntagResource' operation" }
      input.validate! if config.validate_input?
      response = post("UntagResource", "/", input.to_json)
      Core::ParsedResponse(AEB::UntagResourceResponse).new(response)
    end

    # Updates an API destination.
    def update_api_destination(input : AEB::UpdateApiDestinationRequest) : Core::ParsedResponse(AEB::UpdateApiDestinationResponse)
      Log.info { "performing 'UpdateApiDestination' operation" }
      input.validate! if config.validate_input?
      response = post("UpdateApiDestination", "/", input.to_json)
      Core::ParsedResponse(AEB::UpdateApiDestinationResponse).new(response)
    end

    # Updates the specified archive.
    def update_archive(input : AEB::UpdateArchiveRequest) : Core::ParsedResponse(AEB::UpdateArchiveResponse)
      Log.info { "performing 'UpdateArchive' operation" }
      input.validate! if config.validate_input?
      response = post("UpdateArchive", "/", input.to_json)
      Core::ParsedResponse(AEB::UpdateArchiveResponse).new(response)
    end

    # Updates settings for a connection.
    def update_connection(input : AEB::UpdateConnectionRequest) : Core::ParsedResponse(AEB::UpdateConnectionResponse)
      Log.info { "performing 'UpdateConnection' operation" }
      input.validate! if config.validate_input?
      response = post("UpdateConnection", "/", input.to_json)
      Core::ParsedResponse(AEB::UpdateConnectionResponse).new(response)
    end

    # Update an existing endpoint. For more information about global endpoints, see [Making
    # applications Regional-fault tolerant with global endpoints and event
    # replication](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html)
    # in the * *Amazon EventBridge User Guide* *.
    def update_endpoint(input : AEB::UpdateEndpointRequest) : Core::ParsedResponse(AEB::UpdateEndpointResponse)
      Log.info { "performing 'UpdateEndpoint' operation" }
      input.validate! if config.validate_input?
      response = post("UpdateEndpoint", "/", input.to_json)
      Core::ParsedResponse(AEB::UpdateEndpointResponse).new(response)
    end

    # Updates the specified event bus.
    def update_event_bus(input : AEB::UpdateEventBusRequest) : Core::ParsedResponse(AEB::UpdateEventBusResponse)
      Log.info { "performing 'UpdateEventBus' operation" }
      input.validate! if config.validate_input?
      response = post("UpdateEventBus", "/", input.to_json)
      Core::ParsedResponse(AEB::UpdateEventBusResponse).new(response)
    end
  end
end
