private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about a Capacity Manager data export configuration, including export
  # settings, delivery status, and recent export activity.
  class CapacityManagerDataExportResponse
    # The unique identifier for the data export configuration.
    property capacity_manager_data_export_id : String | Nil

    # The name of the S3 bucket where export files are delivered.
    property s3_bucket_name : String | Nil

    # The S3 key prefix used for organizing export files within the bucket.
    property s3_bucket_prefix : String | Nil

    # The frequency at which data exports are generated.
    property schedule : Schedule | Nil

    # The file format of the exported data.
    property output_format : OutputFormat | Nil

    # The timestamp when the data export configuration was created.
    property create_time : Time | Nil

    # The status of the most recent export delivery.
    property latest_delivery_status : CapacityManagerDataExportStatus | Nil

    # A message describing the status of the most recent export delivery, including any error details
    # if the delivery failed.
    property latest_delivery_status_message : String | Nil

    # The S3 URI of the most recently delivered export file.
    property latest_delivery_s3_location_uri : String | Nil

    # The timestamp when the most recent export was delivered to S3.
    property latest_delivery_time : Time | Nil

    # The tags associated with the data export configuration.
    property tags : Array(Tag) | Nil

    def initialize(
      @capacity_manager_data_export_id : String | Nil = nil,
      @s3_bucket_name : String | Nil = nil,
      @s3_bucket_prefix : String | Nil = nil,
      @schedule : Schedule | Nil = nil,
      @output_format : OutputFormat | Nil = nil,
      @create_time : Time | Nil = nil,
      @latest_delivery_status : CapacityManagerDataExportStatus | Nil = nil,
      @latest_delivery_status_message : String | Nil = nil,
      @latest_delivery_s3_location_uri : String | Nil = nil,
      @latest_delivery_time : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_manager_data_export_id
        params << {"#{prefix}CapacityManagerDataExportId", value}
      end

      if value = @s3_bucket_name
        params << {"#{prefix}S3BucketName", value}
      end

      if value = @s3_bucket_prefix
        params << {"#{prefix}S3BucketPrefix", value}
      end

      if value = @schedule
        params << {"#{prefix}Schedule", value.to_json_object_key}
      end

      if value = @output_format
        params << {"#{prefix}OutputFormat", value.to_json_object_key}
      end

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      if value = @latest_delivery_status
        params << {"#{prefix}LatestDeliveryStatus", value.to_json_object_key}
      end

      if value = @latest_delivery_status_message
        params << {"#{prefix}LatestDeliveryStatusMessage", value}
      end

      if value = @latest_delivery_s3_location_uri
        params << {"#{prefix}LatestDeliveryS3LocationUri", value}
      end

      if value = @latest_delivery_time
        params << {"#{prefix}LatestDeliveryTime", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_manager_data_export_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityManagerDataExportId']")),
        s3_bucket_name: Core::XMLValue.string(node.xpath_node("*[local-name()='s3BucketName']")),
        s3_bucket_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='s3BucketPrefix']")),
        schedule: (n = node.xpath_node("*[local-name()='schedule']")) ? AEC::Schedule.from_json_object_key?(n.content) : nil,
        output_format: (n = node.xpath_node("*[local-name()='outputFormat']")) ? AEC::OutputFormat.from_json_object_key?(n.content) : nil,
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        latest_delivery_status: (n = node.xpath_node("*[local-name()='latestDeliveryStatus']")) ? AEC::CapacityManagerDataExportStatus.from_json_object_key?(n.content) : nil,
        latest_delivery_status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='latestDeliveryStatusMessage']")),
        latest_delivery_s3_location_uri: Core::XMLValue.string(node.xpath_node("*[local-name()='latestDeliveryS3LocationUri']")),
        latest_delivery_time: Core::XMLValue.time(node.xpath_node("*[local-name()='latestDeliveryTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_manager_data_export_id, @s3_bucket_name, @s3_bucket_prefix, @schedule, @output_format, @create_time, @latest_delivery_status, @latest_delivery_status_message, @latest_delivery_s3_location_uri, @latest_delivery_time, @tags)
  end
end
