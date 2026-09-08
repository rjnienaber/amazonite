private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the days since the initiation of an incomplete multipart upload that Amazon S3 will
  # wait before permanently removing all parts of the upload. For more information, see [ Aborting
  # Incomplete Multipart Uploads Using a Bucket Lifecycle
  # Configuration](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config)
  # in the *Amazon S3 User Guide*.
  class AbortIncompleteMultipartUpload
    # Specifies the number of days after which Amazon S3 aborts an incomplete multipart upload.
    property days_after_initiation : Int32 | Nil

    def initialize(
      @days_after_initiation : Int32 | Nil = nil,
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
      if value = @days_after_initiation
        xml.element("DaysAfterInitiation") { xml.text value.to_s }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        days_after_initiation: Core::XMLValue.i32(node.xpath_node("*[local-name()='DaysAfterInitiation']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@days_after_initiation)
  end
end
