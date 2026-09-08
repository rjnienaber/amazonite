private alias Core = Amazonite::Core

module Amazonite::EC2
  # Details for Site-to-Site VPN tunnel endpoint maintenance events.
  class MaintenanceDetails
    # Verify existence of a pending maintenance.
    property pending_maintenance : String | Nil

    # The timestamp after which Amazon Web Services will automatically apply maintenance.
    property maintenance_auto_applied_after : Time | Nil

    # Timestamp of last applied maintenance.
    property last_maintenance_applied : Time | Nil

    def initialize(
      @pending_maintenance : String | Nil = nil,
      @maintenance_auto_applied_after : Time | Nil = nil,
      @last_maintenance_applied : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @pending_maintenance
        params << {"#{prefix}PendingMaintenance", value}
      end

      if value = @maintenance_auto_applied_after
        params << {"#{prefix}MaintenanceAutoAppliedAfter", Core::QueryValue.time(value)}
      end

      if value = @last_maintenance_applied
        params << {"#{prefix}LastMaintenanceApplied", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        pending_maintenance: Core::XMLValue.string(node.xpath_node("*[local-name()='pendingMaintenance']")),
        maintenance_auto_applied_after: Core::XMLValue.time(node.xpath_node("*[local-name()='maintenanceAutoAppliedAfter']")),
        last_maintenance_applied: Core::XMLValue.time(node.xpath_node("*[local-name()='lastMaintenanceApplied']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@pending_maintenance, @maintenance_auto_applied_after, @last_maintenance_applied)
  end
end
