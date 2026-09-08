private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableCapacityManagerResult
    # The current status of Capacity Manager after the enable operation.
    property capacity_manager_status : CapacityManagerStatus | Nil

    # Indicates whether Organizations access is enabled for cross-account data aggregation.
    property organizations_access : Bool | Nil

    def initialize(
      @capacity_manager_status : CapacityManagerStatus | Nil = nil,
      @organizations_access : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_manager_status
        params << {"#{prefix}CapacityManagerStatus", value.to_json_object_key}
      end

      if value = @organizations_access
        params << {"#{prefix}OrganizationsAccess", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_manager_status: (n = node.xpath_node("*[local-name()='capacityManagerStatus']")) ? AEC::CapacityManagerStatus.from_json_object_key?(n.content) : nil,
        organizations_access: Core::XMLValue.bool(node.xpath_node("*[local-name()='organizationsAccess']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_manager_status, @organizations_access)
  end
end
