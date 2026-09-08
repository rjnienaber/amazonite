private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Container for the transition rule that describes when noncurrent objects transition to the
  # `STANDARD_IA`, `ONEZONE_IA`, `INTELLIGENT_TIERING`, `GLACIER_IR`, `GLACIER`, or `DEEP_ARCHIVE`
  # storage class. If your bucket is versioning-enabled (or versioning is suspended), you can set
  # this action to request that Amazon S3 transition noncurrent object versions to the
  # `STANDARD_IA`, `ONEZONE_IA`, `INTELLIGENT_TIERING`, `GLACIER_IR`, `GLACIER`, or `DEEP_ARCHIVE`
  # storage class at a specific period in the object's lifetime.
  class NoncurrentVersionTransition
    # Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated
    # action. For information about the noncurrent days calculations, see [How Amazon S3 Calculates
    # How Long an Object Has Been
    # Noncurrent](https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations)
    # in the *Amazon S3 User Guide*.
    property noncurrent_days : Int32 | Nil

    # The class of storage used to store the object.
    property storage_class : TransitionStorageClass | Nil

    # Specifies how many noncurrent versions Amazon S3 will retain in the same storage class before
    # transitioning objects. You can specify up to 100 noncurrent versions to retain. Amazon S3 will
    # transition any additional noncurrent versions beyond the specified number to retain. For more
    # information about noncurrent versions, see [Lifecycle configuration
    # elements](https://docs.aws.amazon.com/AmazonS3/latest/userguide/intro-lifecycle-rules.html) in
    # the *Amazon S3 User Guide*.
    property newer_noncurrent_versions : Int32 | Nil

    def initialize(
      @noncurrent_days : Int32 | Nil = nil,
      @storage_class : TransitionStorageClass | Nil = nil,
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

      if value = @storage_class
        xml.element("StorageClass") { xml.text value.to_json_object_key }
      end

      if value = @newer_noncurrent_versions
        xml.element("NewerNoncurrentVersions") { xml.text value.to_s }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        noncurrent_days: Core::XMLValue.i32(node.xpath_node("*[local-name()='NoncurrentDays']")),
        storage_class: (n = node.xpath_node("*[local-name()='StorageClass']")) ? AS::TransitionStorageClass.from_json_object_key?(n.content) : nil,
        newer_noncurrent_versions: Core::XMLValue.i32(node.xpath_node("*[local-name()='NewerNoncurrentVersions']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@noncurrent_days, @storage_class, @newer_noncurrent_versions)
  end
end
