private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateCapacityManagerDataExportResult
    # The unique identifier for the created data export configuration. Use this ID to reference the
    # export in other API calls.
    property capacity_manager_data_export_id : String | Nil

    def initialize(
      @capacity_manager_data_export_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_manager_data_export_id
        params << {"#{prefix}CapacityManagerDataExportId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_manager_data_export_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityManagerDataExportId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_manager_data_export_id)
  end
end
