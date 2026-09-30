private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the S3 Intelligent-Tiering configuration for an Amazon S3 bucket.
  #
  # For information about the S3 Intelligent-Tiering storage class, see [Storage class for
  # automatically optimizing frequently and infrequently accessed
  # objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access).
  class IntelligentTieringConfiguration
    # The ID used to identify the S3 Intelligent-Tiering configuration.
    property id : String

    # Specifies a bucket filter. The configuration only includes objects that meet the filter's
    # criteria.
    property filter : IntelligentTieringFilter | Nil

    # Specifies the status of the configuration.
    property status : IntelligentTieringStatus

    # Specifies the S3 Intelligent-Tiering storage class tier of the configuration.
    property tierings : Array(Tiering) = [] of Tiering

    def initialize(
      @id : String,
      @status : IntelligentTieringStatus,
      @tierings : Array(Tiering),
      @filter : IntelligentTieringFilter | Nil = nil,
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
      xml.element("Id") { xml.text @id }

      if value = @filter
        xml.element("Filter") { value.build_xml(xml) }
      end

      xml.element("Status") { xml.text @status.to_json_object_key }

      @tierings.each do |item|
        xml.element("Tiering") { item.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='Id']")).not_nil!,
        filter: node.xpath_node("*[local-name()='Filter']").try { |n| IntelligentTieringFilter.from_xml(n) },
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AS::IntelligentTieringStatus.from_json_object_key?(n.content) : nil).not_nil!,
        tierings: node.xpath_nodes("*[local-name()='Tiering']").map { |n| Tiering.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filter
        value.validate!
      end

      if value = @tierings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@id, @filter, @status, @tierings)
  end
end
