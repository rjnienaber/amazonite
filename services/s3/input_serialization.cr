private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Describes the serialization format of the object.
  class InputSerialization
    # Describes the serialization of a CSV-encoded object.
    property csv : CSVInput | Nil

    # Specifies object's compression format. Valid values: NONE, GZIP, BZIP2. Default Value: NONE.
    property compression_type : CompressionType | Nil

    # Specifies JSON as object's input serialization format.
    property json : JSONInput | Nil

    # Specifies Parquet as object's input serialization format.
    property parquet : ParquetInput | Nil

    def initialize(
      @csv : CSVInput | Nil = nil,
      @compression_type : CompressionType | Nil = nil,
      @json : JSONInput | Nil = nil,
      @parquet : ParquetInput | Nil = nil,
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
      if value = @csv
        xml.element("CSV") { value.build_xml(xml) }
      end

      if value = @compression_type
        xml.element("CompressionType") { xml.text value.to_json_object_key }
      end

      if value = @json
        xml.element("JSON") { value.build_xml(xml) }
      end

      if value = @parquet
        xml.element("Parquet") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        csv: node.xpath_node("*[local-name()='CSV']").try { |n| CSVInput.from_xml(n) },
        compression_type: (n = node.xpath_node("*[local-name()='CompressionType']")) ? AS::CompressionType.from_json_object_key?(n.content) : nil,
        json: node.xpath_node("*[local-name()='JSON']").try { |n| JSONInput.from_xml(n) },
        parquet: node.xpath_node("*[local-name()='Parquet']").try { |n| ParquetInput.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @csv
        value.validate!
      end

      if value = @json
        value.validate!
      end

      if value = @parquet
        value.validate!
      end
    end

    def_equals_and_hash(@csv, @compression_type, @json, @parquet)
  end
end
