private alias AS = Amazonite::S3

module Amazonite::S3
  class PutBucketLifecycleConfigurationOutput
    # Indicates which default minimum object size behavior is applied to the lifecycle configuration.
    #
    # This parameter applies to general purpose buckets only. It is not supported for directory bucket
    # lifecycle configurations.
    #
    # - `all_storage_classes_128K` - Objects smaller than 128 KB will not transition to any storage
    # class by default.
    #
    # - `varies_by_storage_class` - Objects smaller than 128 KB will transition to Glacier Flexible
    # Retrieval or Glacier Deep Archive storage classes. By default, all other storage classes will
    # prevent transitions smaller than 128 KB.
    #
    # To customize the minimum object size for any transition you can add a filter that specifies a
    # custom `ObjectSizeGreaterThan` or `ObjectSizeLessThan` in the body of your transition rule.
    # Custom filters always take precedence over the default transition behavior.
    property transition_default_minimum_object_size : TransitionDefaultMinimumObjectSize | Nil

    def initialize(
      @transition_default_minimum_object_size : TransitionDefaultMinimumObjectSize | Nil = nil,
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
    end

    def self.from_xml(node : XML::Node) : self
      new(
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transition_default_minimum_object_size)
  end
end
