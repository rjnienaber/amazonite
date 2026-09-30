private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the installation status of a route in a route table.
  class RouteServerRouteInstallationDetail
    # The ID of the route table where the route is being installed.
    property route_table_id : String | Nil

    # The current installation status of the route in the route table.
    property route_installation_status : RouteServerRouteInstallationStatus | Nil

    # The reason for the current installation status of the route.
    property route_installation_status_reason : String | Nil

    def initialize(
      @route_table_id : String | Nil = nil,
      @route_installation_status : RouteServerRouteInstallationStatus | Nil = nil,
      @route_installation_status_reason : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @route_table_id
        params << {"#{prefix}RouteTableId", value}
      end

      if value = @route_installation_status
        params << {"#{prefix}RouteInstallationStatus", value.to_json_object_key}
      end

      if value = @route_installation_status_reason
        params << {"#{prefix}RouteInstallationStatusReason", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeTableId']")),
        route_installation_status: (n = node.xpath_node("*[local-name()='routeInstallationStatus']")) ? AEC::RouteServerRouteInstallationStatus.from_json_object_key?(n.content) : nil,
        route_installation_status_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='routeInstallationStatusReason']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@route_table_id, @route_installation_status, @route_installation_status_reason)
  end
end
