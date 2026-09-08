private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyRouteServerRequest
    # The ID of the route server to modify.
    property route_server_id : String

    # Specifies whether to persist routes after all BGP sessions are terminated.
    #
    # - enable: Routes will be persisted in FIB and RIB after all BGP sessions are terminated.
    #
    # - disable: Routes will not be persisted in FIB and RIB after all BGP sessions are terminated.
    #
    # - reset: If a route server has persisted routes due to all BGP sessions having ended, reset will
    # withdraw all routes and reset route server to an empty FIB and RIB.
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

    # Specifies whether to enable SNS notifications for route server events. Enabling SNS
    # notifications persists BGP status changes to an SNS topic provisioned by Amazon Web Services.
    property sns_notifications_enabled : Bool | Nil

    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @route_server_id : String,
      @persist_routes : RouteServerPersistRoutesAction | Nil = nil,
      @persist_routes_duration : Int64 | Nil = nil,
      @sns_notifications_enabled : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RouteServerId", @route_server_id}

      if value = @persist_routes
        params << {"#{prefix}PersistRoutes", value.to_json_object_key}
      end

      if value = @persist_routes_duration
        params << {"#{prefix}PersistRoutesDuration", value.to_s}
      end

      if value = @sns_notifications_enabled
        params << {"#{prefix}SnsNotificationsEnabled", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_server_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RouteServerId']")).not_nil!,
        persist_routes: (n = node.xpath_node("*[local-name()='PersistRoutes']")) ? AEC::RouteServerPersistRoutesAction.from_json_object_key?(n.content) : nil,
        persist_routes_duration: Core::XMLValue.i64(node.xpath_node("*[local-name()='PersistRoutesDuration']")),
        sns_notifications_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='SnsNotificationsEnabled']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@route_server_id, @persist_routes, @persist_routes_duration, @sns_notifications_enabled, @dry_run)
  end
end
