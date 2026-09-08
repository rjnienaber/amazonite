private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class ListObjectAnnotationsOutput
    # The list of annotations attached to the object.
    property annotations : Array(AnnotationEntry) | Nil

    # The bucket name.
    property bucket : String | Nil

    # The object key.
    property key : String | Nil

    # The version ID of the object.
    property object_version_id : String | Nil

    # The prefix used to filter the response.
    property annotation_prefix : String | Nil

    # The maximum number of annotations returned in the response.
    property max_annotation_results : Int32 | Nil

    # The number of annotations returned.
    property annotation_count : Int32 | Nil

    # The continuation token used in this request.
    property continuation_token : String | Nil

    # The continuation token to use to retrieve the next page of results.
    property next_continuation_token : String | Nil

    property request_charged : RequestCharged | Nil

    def initialize(
      @annotations : Array(AnnotationEntry) | Nil = nil,
      @bucket : String | Nil = nil,
      @key : String | Nil = nil,
      @object_version_id : String | Nil = nil,
      @annotation_prefix : String | Nil = nil,
      @max_annotation_results : Int32 | Nil = nil,
      @annotation_count : Int32 | Nil = nil,
      @continuation_token : String | Nil = nil,
      @next_continuation_token : String | Nil = nil,
      @request_charged : RequestCharged | Nil = nil,
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
      xml.element("Annotations") do
        (@annotations || [] of AnnotationEntry).each do |item|
          xml.element("AnnotationEntry") { item.build_xml(xml) }
        end
      end

      if value = @bucket
        xml.element("Bucket") { xml.text value }
      end

      if value = @key
        xml.element("Key") { xml.text value }
      end

      if value = @annotation_prefix
        xml.element("AnnotationPrefix") { xml.text value }
      end

      if value = @max_annotation_results
        xml.element("MaxAnnotationResults") { xml.text value.to_s }
      end

      if value = @annotation_count
        xml.element("AnnotationCount") { xml.text value.to_s }
      end

      if value = @continuation_token
        xml.element("ContinuationToken") { xml.text value }
      end

      if value = @next_continuation_token
        xml.element("NextContinuationToken") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        annotations: node.xpath_nodes("*[local-name()='Annotations']/*[local-name()='AnnotationEntry']").map { |n| AnnotationEntry.from_xml(n) },
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='Bucket']")),
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")),
        annotation_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='AnnotationPrefix']")),
        max_annotation_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxAnnotationResults']")),
        annotation_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='AnnotationCount']")),
        continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ContinuationToken']")),
        next_continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextContinuationToken']")),
      )
    end

    def validate! : Nil
      if value = @annotations
        value.each(&.validate!)
      end

      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end

      if value = @max_annotation_results
        raise Core::ValidationError.new("MaxAnnotationResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxAnnotationResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@annotations, @bucket, @key, @object_version_id, @annotation_prefix, @max_annotation_results, @annotation_count, @continuation_token, @next_continuation_token, @request_charged)
  end
end
