private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the destination options for a flow log.
  class DestinationOptionsRequest
    # The format for the flow log. The default is `plain-text`.
    property file_format : DestinationFileFormat | Nil

    # Indicates whether to use Hive-compatible prefixes for flow logs stored in Amazon S3. The default
    # is `false`.
    property hive_compatible_partitions : Bool | Nil

    # Indicates whether to partition the flow log per hour. This reduces the cost and response time
    # for queries. The default is `false`.
    property per_hour_partition : Bool | Nil

    def initialize(
      @file_format : DestinationFileFormat | Nil = nil,
      @hive_compatible_partitions : Bool | Nil = nil,
      @per_hour_partition : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @file_format
        params << {"#{prefix}FileFormat", value.to_json_object_key}
      end

      if value = @hive_compatible_partitions
        params << {"#{prefix}HiveCompatiblePartitions", Core::QueryValue.bool(value)}
      end

      if value = @per_hour_partition
        params << {"#{prefix}PerHourPartition", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        file_format: (n = node.xpath_node("*[local-name()='FileFormat']")) ? AEC::DestinationFileFormat.from_json_object_key?(n.content) : nil,
        hive_compatible_partitions: Core::XMLValue.bool(node.xpath_node("*[local-name()='HiveCompatiblePartitions']")),
        per_hour_partition: Core::XMLValue.bool(node.xpath_node("*[local-name()='PerHourPartition']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@file_format, @hive_compatible_partitions, @per_hour_partition)
  end
end
