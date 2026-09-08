private alias Core = Amazonite::Core

module Amazonite::S3
  # The container for selecting objects from a content event stream.
  class SelectObjectContentEventStream
    # The Records Event.
    property records : RecordsEvent | Nil

    # The Stats Event.
    property stats : StatsEvent | Nil

    # The Progress Event.
    property progress : ProgressEvent | Nil

    # The Continuation Event.
    property cont : ContinuationEvent | Nil

    # The End Event.
    property end : EndEvent | Nil

    def initialize(
      @records : RecordsEvent | Nil = nil,
      @stats : StatsEvent | Nil = nil,
      @progress : ProgressEvent | Nil = nil,
      @cont : ContinuationEvent | Nil = nil,
      @end : EndEvent | Nil = nil,
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
      if value = @records
        xml.element("Records") { value.build_xml(xml) }
      end

      if value = @stats
        xml.element("Stats") { value.build_xml(xml) }
      end

      if value = @progress
        xml.element("Progress") { value.build_xml(xml) }
      end

      if value = @cont
        xml.element("Cont") { value.build_xml(xml) }
      end

      if value = @end
        xml.element("End") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        records: node.xpath_node("*[local-name()='Records']").try { |n| RecordsEvent.from_xml(n) },
        stats: node.xpath_node("*[local-name()='Stats']").try { |n| StatsEvent.from_xml(n) },
        progress: node.xpath_node("*[local-name()='Progress']").try { |n| ProgressEvent.from_xml(n) },
        cont: node.xpath_node("*[local-name()='Cont']").try { |n| ContinuationEvent.from_xml(n) },
        end: node.xpath_node("*[local-name()='End']").try { |n| EndEvent.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @records
        value.validate!
      end

      if value = @stats
        value.validate!
      end

      if value = @progress
        value.validate!
      end

      if value = @cont
        value.validate!
      end

      if value = @end
        value.validate!
      end
    end

    def_equals_and_hash(@records, @stats, @progress, @cont, @end)
  end
end
