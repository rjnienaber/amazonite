private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes integration options for Amazon Athena.
  class AthenaIntegration
    # The location in Amazon S3 to store the generated CloudFormation template.
    property integration_result_s3_destination_arn : String

    # The schedule for adding new partitions to the table.
    property partition_load_frequency : PartitionLoadFrequency

    # The start date for the partition.
    property partition_start_date : Time | Nil

    # The end date for the partition.
    property partition_end_date : Time | Nil

    def initialize(
      @integration_result_s3_destination_arn : String,
      @partition_load_frequency : PartitionLoadFrequency,
      @partition_start_date : Time | Nil = nil,
      @partition_end_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}IntegrationResultS3DestinationArn", @integration_result_s3_destination_arn}

      params << {"#{prefix}PartitionLoadFrequency", @partition_load_frequency.to_json_object_key}

      if value = @partition_start_date
        params << {"#{prefix}PartitionStartDate", Core::QueryValue.time(value)}
      end

      if value = @partition_end_date
        params << {"#{prefix}PartitionEndDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        integration_result_s3_destination_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='IntegrationResultS3DestinationArn']")).not_nil!,
        partition_load_frequency: ((n = node.xpath_node("*[local-name()='PartitionLoadFrequency']")) ? AEC::PartitionLoadFrequency.from_json_object_key?(n.content) : nil).not_nil!,
        partition_start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='PartitionStartDate']")),
        partition_end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='PartitionEndDate']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@integration_result_s3_destination_arn, @partition_load_frequency, @partition_start_date, @partition_end_date)
  end
end
