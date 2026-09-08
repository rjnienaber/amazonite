private alias AS = Amazonite::S3

module Amazonite::S3
  # Amazon S3 keys for log objects are partitioned in the following format:
  #
  # `[DestinationPrefix][SourceAccountId]/[SourceRegion]/[SourceBucket]/[YYYY]/[MM]/[DD]/[YYYY]-[MM]-[DD]-[hh]-[mm]-[ss]-[UniqueString]`
  #
  # PartitionedPrefix defaults to EventTime delivery when server access logs are delivered.
  class PartitionedPrefix
    # Specifies the partition date source for the partitioned prefix. `PartitionDateSource` can be
    # `EventTime` or `DeliveryTime`.
    #
    # For `DeliveryTime`, the time in the log file names corresponds to the delivery time for the log
    # files.
    #
    # For `EventTime`, The logs delivered are for a specific day only. The year, month, and day
    # correspond to the day on which the event occurred, and the hour, minutes and seconds are set to
    # 00 in the key.
    property partition_date_source : PartitionDateSource | Nil

    def initialize(
      @partition_date_source : PartitionDateSource | Nil = nil,
    )
    end

    # `root` is the element this shape is serialized under, which restXml
    # takes from the member binding it as the request payload rather than
    # from the shape's own name - they differ often enough (S3 sends a
    # CompletedMultipartUpload as <CompleteMultipartUpload>) that the caller
    # has to supply it.
    def to_xml(root : String) : String
      XML.build(indent: nil) do |xml|
        xml.element(root) { build_xml(xml) }
      end
    end

    def build_xml(xml : XML::Builder) : Nil
      if value = @partition_date_source
        xml.element("PartitionDateSource") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        partition_date_source: (n = node.xpath_node("*[local-name()='PartitionDateSource']")) ? AS::PartitionDateSource.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@partition_date_source)
  end
end
