private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a route server and its configuration.
  #
  # Amazon VPC Route Server simplifies routing for traffic between workloads that are deployed
  # within a VPC and its internet gateways. With this feature, VPC Route Server dynamically updates
  # VPC and internet gateway route tables with your preferred IPv4 or IPv6 routes to achieve routing
  # fault tolerance for those workloads. This enables you to automatically reroute traffic within a
  # VPC, which increases the manageability of VPC routing and interoperability with third-party
  # workloads.
  #
  # Route server supports the follow route table types:
  #
  # - VPC route tables not associated with subnets
  #
  # - Subnet route tables
  #
  # - Internet gateway route tables
  #
  # Route server does not support route tables associated with virtual private gateways. To
  # propagate routes into a transit gateway route table, use [Transit Gateway
  # Connect](https://docs.aws.amazon.com/vpc/latest/tgw/tgw-connect.html).
  class RouteServer
    # The unique identifier of the route server.
    property route_server_id : String | Nil

    # The Border Gateway Protocol (BGP) Autonomous System Number (ASN) for the appliance. Valid values
    # are from 1 to 4294967295. We recommend using a private ASN in the 64512–65534 (16-bit ASN) or 4200000000–4294967294
    # (32-bit ASN) range.
    property amazon_side_asn : Int64 | Nil

    # The current state of the route server.
    property state : RouteServerState | Nil

    # Any tags assigned to the route server.
    property tags : Array(Tag) | Nil

    # The current state of route persistence for the route server.
    property persist_routes_state : RouteServerPersistRoutesState | Nil

    # The number of minutes a route server will wait after BGP is re-established to unpersist the
    # routes in the FIB and RIB. Value must be in the range of 1-5. The default value is 1. Only valid
    # if `persistRoutesState` is 'enabled'.
    #
    # If you set the duration to 1 minute, then when your network appliance re-establishes BGP with
    # route server, it has 1 minute to relearn it's adjacent network and advertise those routes to
    # route server before route server resumes normal functionality. In most cases, 1 minute is
    # probably sufficient. If, however, you have concerns that your BGP network may not be capable of
    # fully re-establishing and re-learning everything in 1 minute, you can increase the duration up
    # to 5 minutes.
    property persist_routes_duration : Int64 | Nil

    # Indicates whether SNS notifications are enabled for the route server. Enabling SNS notifications
    # persists BGP status changes to an SNS topic provisioned by Amazon Web Services.
    property sns_notifications_enabled : Bool | Nil

    # The ARN of the SNS topic where notifications are published.
    property sns_topic_arn : String | Nil

    def initialize(
      @route_server_id : String | Nil = nil,
      @amazon_side_asn : Int64 | Nil = nil,
      @state : RouteServerState | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @persist_routes_state : RouteServerPersistRoutesState | Nil = nil,
      @persist_routes_duration : Int64 | Nil = nil,
      @sns_notifications_enabled : Bool | Nil = nil,
      @sns_topic_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route_server_id
        params << {"#{prefix}RouteServerId", value}
      end

      if value = @amazon_side_asn
        params << {"#{prefix}AmazonSideAsn", value.to_s}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @persist_routes_state
        params << {"#{prefix}PersistRoutesState", value.to_json_object_key}
      end

      if value = @persist_routes_duration
        params << {"#{prefix}PersistRoutesDuration", value.to_s}
      end

      if value = @sns_notifications_enabled
        params << {"#{prefix}SnsNotificationsEnabled", Core::QueryValue.bool(value)}
      end

      if value = @sns_topic_arn
        params << {"#{prefix}SnsTopicArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeServerId']")),
        amazon_side_asn: Core::XMLValue.i64(node.xpath_node("*[local-name()='amazonSideAsn']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::RouteServerState.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        persist_routes_state: (n = node.xpath_node("*[local-name()='persistRoutesState']")) ? AEC::RouteServerPersistRoutesState.from_json_object_key?(n.content) : nil,
        persist_routes_duration: Core::XMLValue.i64(node.xpath_node("*[local-name()='persistRoutesDuration']")),
        sns_notifications_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='snsNotificationsEnabled']")),
        sns_topic_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='snsTopicArn']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@route_server_id, @amazon_side_asn, @state, @tags, @persist_routes_state, @persist_routes_duration, @sns_notifications_enabled, @sns_topic_arn)
  end
end
