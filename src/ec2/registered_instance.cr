private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an Amazon EC2 instance that is enabled for SQL Server High Availability standby
  # detection monitoring.
  class RegisteredInstance
    # The ID of the SQL Server High Availability instance.
    property instance_id : String | Nil

    # The license type for the SQL Server license. Valid values include:
    #
    # - `full` - The SQL Server High Availability instance is using a full SQL Server license.
    #
    # - `waived` - The SQL Server High Availability instance is waived from the SQL Server license.
    property sql_server_license_usage : SqlServerLicenseUsage | Nil

    # The SQL Server High Availability status of the instance. Valid values are:
    #
    # - `processing` - The SQL Server High Availability status for the SQL Server High Availability
    # instance is being updated.
    #
    # - `active` - The SQL Server High Availability instance is an active node in an SQL Server High
    # Availability cluster.
    #
    # - `standby` - The SQL Server High Availability instance is a standby failover node in an SQL
    # Server High Availability cluster.
    #
    # - `invalid` - An error occurred due to misconfigured permissions, or unable to dertemine SQL
    # Server High Availability status for the SQL Server High Availability instance.
    property ha_status : HaStatus | Nil

    # A brief description of the SQL Server High Availability status. If the instance is in the
    # `invalid` High Availability status, this parameter includes the error message.
    property processing_status : String | Nil

    # The date and time when the instance's SQL Server High Availability status was last updated, in
    # the ISO 8601 format in the UTC time zone (`YYYY-MM-DDThh:mm:ss.sssZ`).
    property last_updated_time : Time | Nil

    # The ARN of the Secrets Manager secret containing the SQL Server access credentials for the SQL
    # Server High Availability instance. If not specified, deafult local user credentials will be used
    # by the Amazon Web Services Systems Manager agent.
    property sql_server_credentials : String | Nil

    # The tags assigned to the SQL Server High Availability instance.
    property tags : Array(Tag) | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @sql_server_license_usage : SqlServerLicenseUsage | Nil = nil,
      @ha_status : HaStatus | Nil = nil,
      @processing_status : String | Nil = nil,
      @last_updated_time : Time | Nil = nil,
      @sql_server_credentials : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @sql_server_license_usage
        params << {"#{prefix}SqlServerLicenseUsage", value.to_json_object_key}
      end

      if value = @ha_status
        params << {"#{prefix}HaStatus", value.to_json_object_key}
      end

      if value = @processing_status
        params << {"#{prefix}ProcessingStatus", value}
      end

      if value = @last_updated_time
        params << {"#{prefix}LastUpdatedTime", Core::QueryValue.time(value)}
      end

      if value = @sql_server_credentials
        params << {"#{prefix}SqlServerCredentials", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        sql_server_license_usage: (n = node.xpath_node("*[local-name()='sqlServerLicenseUsage']")) ? AEC::SqlServerLicenseUsage.from_json_object_key?(n.content) : nil,
        ha_status: (n = node.xpath_node("*[local-name()='haStatus']")) ? AEC::HaStatus.from_json_object_key?(n.content) : nil,
        processing_status: Core::XMLValue.string(node.xpath_node("*[local-name()='processingStatus']")),
        last_updated_time: Core::XMLValue.time(node.xpath_node("*[local-name()='lastUpdatedTime']")),
        sql_server_credentials: Core::XMLValue.string(node.xpath_node("*[local-name()='sqlServerCredentials']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_id, @sql_server_license_usage, @ha_status, @processing_status, @last_updated_time, @sql_server_credentials, @tags)
  end
end
