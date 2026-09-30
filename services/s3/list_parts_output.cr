private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class ListPartsOutput
    # If the bucket has a lifecycle rule configured with an action to abort incomplete multipart
    # uploads and the prefix in the lifecycle rule matches the object name in the request, then the
    # response includes this header indicating when the initiated multipart upload will become
    # eligible for abort operation. For more information, see [Aborting Incomplete Multipart Uploads
    # Using a Bucket Lifecycle
    # Configuration](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config).
    #
    # The response will also include the `x-amz-abort-rule-id` header that will provide the ID of the
    # lifecycle configuration rule that defines this action.
    #
    # This functionality is not supported for directory buckets.
    property abort_date : Time | Nil

    # This header is returned along with the `x-amz-abort-date` header. It identifies applicable
    # lifecycle configuration rule that defines the action to abort incomplete multipart uploads.
    #
    # This functionality is not supported for directory buckets.
    property abort_rule_id : String | Nil

    # The name of the bucket to which the multipart upload was initiated. Does not return the access
    # point ARN or access point alias if used.
    property bucket : String | Nil

    # Object key for which the multipart upload was initiated.
    property key : String | Nil

    # Upload ID identifying the multipart upload whose parts are being listed.
    property upload_id : String | Nil

    # Specifies the part after which listing should begin. Only parts with higher part numbers will be
    # listed.
    property part_number_marker : String | Nil

    # When a list is truncated, this element specifies the last part in the list, as well as the value
    # to use for the `part-number-marker` request parameter in a subsequent request.
    property next_part_number_marker : String | Nil

    # Maximum number of parts that were allowed in the response.
    property max_parts : Int32 | Nil

    # Indicates whether the returned list of parts is truncated. A true value indicates that the list
    # was truncated. A list can be truncated if the number of parts exceeds the limit returned in the
    # MaxParts element.
    property is_truncated : Bool | Nil

    # Container for elements related to a particular part. A response can contain zero or more `Part`
    # elements.
    property parts : Array(Part) | Nil

    # Container element that identifies who initiated the multipart upload. If the initiator is an
    # Amazon Web Services account, this element provides the same information as the `Owner` element.
    # If the initiator is an IAM User, this element provides the user ARN.
    property initiator : Initiator | Nil

    # Container element that identifies the object owner, after the object is created. If multipart
    # upload is initiated by an IAM user, this element provides the parent account ID.
    #
    # **Directory buckets** - The bucket owner is returned as the object owner for all the parts.
    property owner : Owner | Nil

    # The class of storage used to store the uploaded object.
    #
    # **Directory buckets** - Directory buckets only support `EXPRESS_ONEZONE` (the S3 Express One
    # Zone storage class) in Availability Zones and `ONEZONE_IA` (the S3 One Zone-Infrequent Access
    # storage class) in Dedicated Local Zones.
    property storage_class : StorageClass | Nil

    property request_charged : RequestCharged | Nil

    # The algorithm that was used to create a checksum of the object.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # The checksum type, which determines how part-level checksums are combined to create an
    # object-level checksum for multipart objects. You can use this header response to verify that the
    # checksum type that is received is the same checksum type that was specified in
    # `CreateMultipartUpload` request. For more information, see [Checking object integrity in the
    # Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_type : ChecksumType | Nil

    def initialize(
      @abort_date : Time | Nil = nil,
      @abort_rule_id : String | Nil = nil,
      @bucket : String | Nil = nil,
      @key : String | Nil = nil,
      @upload_id : String | Nil = nil,
      @part_number_marker : String | Nil = nil,
      @next_part_number_marker : String | Nil = nil,
      @max_parts : Int32 | Nil = nil,
      @is_truncated : Bool | Nil = nil,
      @parts : Array(Part) | Nil = nil,
      @initiator : Initiator | Nil = nil,
      @owner : Owner | Nil = nil,
      @storage_class : StorageClass | Nil = nil,
      @request_charged : RequestCharged | Nil = nil,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
      @checksum_type : ChecksumType | Nil = nil,
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
      if value = @bucket
        xml.element("Bucket") { xml.text value }
      end

      if value = @key
        xml.element("Key") { xml.text value }
      end

      if value = @upload_id
        xml.element("UploadId") { xml.text value }
      end

      if value = @part_number_marker
        xml.element("PartNumberMarker") { xml.text value }
      end

      if value = @next_part_number_marker
        xml.element("NextPartNumberMarker") { xml.text value }
      end

      if value = @max_parts
        xml.element("MaxParts") { xml.text value.to_s }
      end

      if value = @is_truncated
        xml.element("IsTruncated") { xml.text Core::QueryValue.bool(value) }
      end

      (@parts || [] of Part).each do |item|
        xml.element("Part") { item.build_xml(xml) }
      end

      if value = @initiator
        xml.element("Initiator") { value.build_xml(xml) }
      end

      if value = @owner
        xml.element("Owner") { value.build_xml(xml) }
      end

      if value = @storage_class
        xml.element("StorageClass") { xml.text value.to_json_object_key }
      end

      if value = @checksum_algorithm
        xml.element("ChecksumAlgorithm") { xml.text value.to_json_object_key }
      end

      if value = @checksum_type
        xml.element("ChecksumType") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='Bucket']")),
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")),
        upload_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UploadId']")),
        part_number_marker: Core::XMLValue.string(node.xpath_node("*[local-name()='PartNumberMarker']")),
        next_part_number_marker: Core::XMLValue.string(node.xpath_node("*[local-name()='NextPartNumberMarker']")),
        max_parts: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxParts']")),
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        parts: node.xpath_nodes("*[local-name()='Part']").map { |n| Part.from_xml(n) },
        initiator: node.xpath_node("*[local-name()='Initiator']").try { |n| Initiator.from_xml(n) },
        owner: node.xpath_node("*[local-name()='Owner']").try { |n| Owner.from_xml(n) },
        storage_class: (n = node.xpath_node("*[local-name()='StorageClass']")) ? AS::StorageClass.from_json_object_key?(n.content) : nil,
        checksum_algorithm: (n = node.xpath_node("*[local-name()='ChecksumAlgorithm']")) ? AS::ChecksumAlgorithm.from_json_object_key?(n.content) : nil,
        checksum_type: (n = node.xpath_node("*[local-name()='ChecksumType']")) ? AS::ChecksumType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end

      if value = @parts
        value.each(&.validate!)
      end

      if value = @initiator
        value.validate!
      end

      if value = @owner
        value.validate!
      end
    end

    def_equals_and_hash(@abort_date, @abort_rule_id, @bucket, @key, @upload_id, @part_number_marker, @next_part_number_marker, @max_parts, @is_truncated, @parts, @initiator, @owner, @storage_class, @request_charged, @checksum_algorithm, @checksum_type)
  end
end
