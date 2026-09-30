private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Describes a single annotation attached to an object, including its name, last modified time,
  # size, ETag, checksum algorithm, and replication status. Returned in the response from
  # `ListObjectAnnotations`.
  class AnnotationEntry
    # The name of the annotation.
    property annotation_name : String

    # The date and time the annotation was last modified.
    property last_modified : Time

    # The entity tag of the annotation.
    property e_tag : String | Nil

    # The checksum algorithm used for the annotation.
    property checksum_algorithm : Array(ChecksumAlgorithm) | Nil

    # The size of the annotation payload, in bytes.
    property size : Int64

    # The replication status of the annotation.
    property replication_status : ReplicationStatus | Nil

    def initialize(
      @annotation_name : String,
      @last_modified : Time,
      @size : Int64,
      @e_tag : String | Nil = nil,
      @checksum_algorithm : Array(ChecksumAlgorithm) | Nil = nil,
      @replication_status : ReplicationStatus | Nil = nil,
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
      xml.element("AnnotationName") { xml.text @annotation_name }

      xml.element("LastModified") { xml.text Core::QueryValue.time(@last_modified) }

      if value = @e_tag
        xml.element("ETag") { xml.text value }
      end

      (@checksum_algorithm || [] of ChecksumAlgorithm).each do |item|
        xml.element("ChecksumAlgorithm") { xml.text item.to_json_object_key }
      end

      xml.element("Size") { xml.text @size.to_s }

      if value = @replication_status
        xml.element("ReplicationStatus") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        annotation_name: Core::XMLValue.string(node.xpath_node("*[local-name()='AnnotationName']")).not_nil!,
        last_modified: Core::XMLValue.time(node.xpath_node("*[local-name()='LastModified']")).not_nil!,
        e_tag: Core::XMLValue.string(node.xpath_node("*[local-name()='ETag']")),
        checksum_algorithm: node.xpath_nodes("*[local-name()='ChecksumAlgorithm']").compact_map { |n| AS::ChecksumAlgorithm.from_json_object_key?(n.content) },
        size: Core::XMLValue.i64(node.xpath_node("*[local-name()='Size']")).not_nil!,
        replication_status: (n = node.xpath_node("*[local-name()='ReplicationStatus']")) ? AS::ReplicationStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@annotation_name, @last_modified, @e_tag, @checksum_algorithm, @size, @replication_status)
  end
end
