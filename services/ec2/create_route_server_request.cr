private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateRouteServerRequest
    # The private Autonomous System Number (ASN) for the Amazon side of the BGP session. Valid values
    # are from 1 to 4294967295. We recommend using a private ASN in the 64512–65534 (16-bit ASN) or 4200000000–4294967294
    # (32-bit ASN) range.
    property amazon_side_asn : Int64

    # Unique, case-sensitive identifier to ensure idempotency of the request.
    property client_token : String | Nil

    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Indicates whether routes should be persisted after all BGP sessions are terminated.
    property persist_routes : RouteServerPersistRoutesAction | Nil

    # The number of minutes a route server will wait after BGP is re-established to unpersist the
    # routes in the FIB and RIB. Value must be in the range of 1-5. Required if PersistRoutes is
    # `enabled`.
    #
    # If you set the duration to 1 minute, then when your network appliance re-establishes BGP with
    # route server, it has 1 minute to relearn it's adjacent network and advertise those routes to
    # route server before route server resumes normal functionality. In most cases, 1 minute is
    # probably sufficient. If, however, you have concerns that your BGP network may not be capable of
    # fully re-establishing and re-learning everything in 1 minute, you can increase the duration up
    # to 5 minutes.
    property persist_routes_duration : Int64 | Nil

    # Indicates whether SNS notifications should be enabled for route server events. Enabling SNS
    # notifications persists BGP status changes to an SNS topic provisioned by Amazon Web Services.
    property sns_notifications_enabled : Bool | Nil

    # The tags to apply to the route server during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @amazon_side_asn : Int64,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @persist_routes : RouteServerPersistRoutesAction | Nil = nil,
      @persist_routes_duration : Int64 | Nil = nil,
      @sns_notifications_enabled : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AmazonSideAsn", @amazon_side_asn.to_s}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @persist_routes
        params << {"#{prefix}PersistRoutes", value.to_json_object_key}
      end

      if value = @persist_routes_duration
        params << {"#{prefix}PersistRoutesDuration", value.to_s}
      end

      if value = @sns_notifications_enabled
        params << {"#{prefix}SnsNotificationsEnabled", Core::QueryValue.bool(value)}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        amazon_side_asn: Core::XMLValue.i64(node.xpath_node("*[local-name()='AmazonSideAsn']")).not_nil!,
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        persist_routes: (n = node.xpath_node("*[local-name()='PersistRoutes']")) ? AEC::RouteServerPersistRoutesAction.from_json_object_key?(n.content) : nil,
        persist_routes_duration: Core::XMLValue.i64(node.xpath_node("*[local-name()='PersistRoutesDuration']")),
        sns_notifications_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='SnsNotificationsEnabled']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@amazon_side_asn, @client_token, @dry_run, @persist_routes, @persist_routes_duration, @sns_notifications_enabled, @tag_specifications)
  end
end
