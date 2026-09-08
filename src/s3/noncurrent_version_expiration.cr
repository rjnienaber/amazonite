private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently deletes
  # the noncurrent object versions. You set this lifecycle configuration action on a bucket that has
  # versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object versions at
  # a specific period in the object's lifetime.
  #
  # This parameter applies to general purpose buckets only. It is not supported for directory bucket
  # lifecycle configurations.
  class NoncurrentVersionExpiration
    # Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated
    # action. The value must be a non-zero positive integer. For information about the noncurrent days
    # calculations, see [How Amazon S3 Calculates When an Object Became
    # Noncurrent](https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations)
    # in the *Amazon S3 User Guide*.
    #
    # This parameter applies to general purpose buckets only. It is not supported for directory bucket
    # lifecycle configurations.
    property noncurrent_days : Int32 | Nil

    # Specifies how many noncurrent versions Amazon S3 will retain. You can specify up to 100
    # noncurrent versions to retain. Amazon S3 will permanently delete any additional noncurrent
    # versions beyond the specified number to retain. For more information about noncurrent versions,
    # see [Lifecycle configuration
    # elements](https://docs.aws.amazon.com/AmazonS3/latest/userguide/intro-lifecycle-rules.html) in
    # the *Amazon S3 User Guide*.
    #
    # This parameter applies to general purpose buckets only. It is not supported for directory bucket
    # lifecycle configurations.
    property newer_noncurrent_versions : Int32 | Nil

    def initialize(
      @noncurrent_days : Int32 | Nil = nil,
      @newer_noncurrent_versions : Int32 | Nil = nil,
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
      if value = @noncurrent_days
        xml.element("NoncurrentDays") { xml.text value.to_s }
      end

      if value = @newer_noncurrent_versions
        xml.element("NewerNoncurrentVersions") { xml.text value.to_s }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        noncurrent_days: Core::XMLValue.i32(node.xpath_node("*[local-name()='NoncurrentDays']")),
        newer_noncurrent_versions: Core::XMLValue.i32(node.xpath_node("*[local-name()='NewerNoncurrentVersions']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@noncurrent_days, @newer_noncurrent_versions)
  end
end
