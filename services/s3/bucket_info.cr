private alias AS = Amazonite::S3

module Amazonite::S3
  # Specifies the information about the bucket that will be created. For more information about
  # directory buckets, see [Directory
  # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-overview.html)
  # in the *Amazon S3 User Guide*.
  #
  # This functionality is only supported by directory buckets.
  class BucketInfo
    # The number of Zone (Availability Zone or Local Zone) that's used for redundancy for the bucket.
    property data_redundancy : DataRedundancy | Nil

    # The type of bucket.
    property type : BucketType | Nil

    def initialize(
      @data_redundancy : DataRedundancy | Nil = nil,
      @type : BucketType | Nil = nil,
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
      if value = @data_redundancy
        xml.element("DataRedundancy") { xml.text value.to_json_object_key }
      end

      if value = @type
        xml.element("Type") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        data_redundancy: (n = node.xpath_node("*[local-name()='DataRedundancy']")) ? AS::DataRedundancy.from_json_object_key?(n.content) : nil,
        type: (n = node.xpath_node("*[local-name()='Type']")) ? AS::BucketType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@data_redundancy, @type)
  end
end
