private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetCapacityManagerAttributesResult
    # The current status of Capacity Manager.
    property capacity_manager_status : CapacityManagerStatus | Nil

    # Indicates whether Organizations access is enabled for cross-account data aggregation.
    property organizations_access : Bool | Nil

    # The number of active data export configurations for this account. This count includes all data
    # exports regardless of their current delivery status.
    property data_export_count : Int32 | Nil

    # The current data ingestion status. Initial ingestion may take several hours after enabling
    # Capacity Manager.
    property ingestion_status : IngestionStatus | Nil

    # A descriptive message providing additional details about the current ingestion status. This may
    # include error information if ingestion has failed or progress details during initial setup.
    property ingestion_status_message : String | Nil

    # The timestamp of the earliest data point available in Capacity Manager, in milliseconds since
    # epoch. This indicates how far back historical data is available for queries.
    property earliest_datapoint_timestamp : Time | Nil

    # The timestamp of the most recent data point ingested by Capacity Manager, in milliseconds since
    # epoch. This indicates how current your capacity data is.
    property latest_datapoint_timestamp : Time | Nil

    def initialize(
      @capacity_manager_status : CapacityManagerStatus | Nil = nil,
      @organizations_access : Bool | Nil = nil,
      @data_export_count : Int32 | Nil = nil,
      @ingestion_status : IngestionStatus | Nil = nil,
      @ingestion_status_message : String | Nil = nil,
      @earliest_datapoint_timestamp : Time | Nil = nil,
      @latest_datapoint_timestamp : Time | Nil = nil,
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

      if value = @data_export_count
        params << {"#{prefix}DataExportCount", value.to_s}
      end

      if value = @ingestion_status
        params << {"#{prefix}IngestionStatus", value.to_json_object_key}
      end

      if value = @ingestion_status_message
        params << {"#{prefix}IngestionStatusMessage", value}
      end

      if value = @earliest_datapoint_timestamp
        params << {"#{prefix}EarliestDatapointTimestamp", Core::QueryValue.time(value)}
      end

      if value = @latest_datapoint_timestamp
        params << {"#{prefix}LatestDatapointTimestamp", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_manager_status: (n = node.xpath_node("*[local-name()='capacityManagerStatus']")) ? AEC::CapacityManagerStatus.from_json_object_key?(n.content) : nil,
        organizations_access: Core::XMLValue.bool(node.xpath_node("*[local-name()='organizationsAccess']")),
        data_export_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='dataExportCount']")),
        ingestion_status: (n = node.xpath_node("*[local-name()='ingestionStatus']")) ? AEC::IngestionStatus.from_json_object_key?(n.content) : nil,
        ingestion_status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='ingestionStatusMessage']")),
        earliest_datapoint_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='earliestDatapointTimestamp']")),
        latest_datapoint_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='latestDatapointTimestamp']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_manager_status, @organizations_access, @data_export_count, @ingestion_status, @ingestion_status_message, @earliest_datapoint_timestamp, @latest_datapoint_timestamp)
  end
end
