private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class PutObjectAnnotationRequest
    # The name of the bucket that contains the object.
    property bucket : String = ""

    # The object key.
    property key : String = ""

    # The version ID of the object to attach the annotation to.
    property version_id : String | Nil

    # The name of the annotation.
    #
    # Length Constraints: Minimum length of 1. Maximum length of 512 bytes.
    property annotation_name : String = ""

    # The annotation payload. Must be between 1 byte and 1 MiB in size, and must be valid UTF-8
    # encoded text. If the payload contains invalid UTF-8 bytes, the request fails with HTTP 415
    # (Unsupported Media Type). To store binary data, encode the payload using Base64 before
    # uploading.
    property annotation_payload : String

    # If specified, the operation only succeeds if the object's ETag matches the provided value.
    property object_if_match : String | Nil

    # The checksum algorithm to use. Supported values: `CRC32`, `CRC32C`, `CRC64NVME`, `SHA1`,
    # `SHA256`, `SHA512`, `MD5`, `XXHASH64`, `XXHASH3`, `XXHASH128`.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # Base64-encoded CRC32 checksum of the annotation payload.
    property checksum_crc32 : String | Nil

    # Base64-encoded CRC32C checksum of the annotation payload.
    property checksum_crc32c : String | Nil

    # Base64-encoded CRC64NVME checksum of the annotation payload.
    property checksum_crc64nvme : String | Nil

    # Base64-encoded SHA1 checksum of the annotation payload.
    property checksum_sha1 : String | Nil

    # Base64-encoded SHA256 checksum of the annotation payload.
    property checksum_sha256 : String | Nil

    # Base64-encoded SHA512 checksum of the annotation payload.
    property checksum_sha512 : String | Nil

    # Base64-encoded MD5 checksum of the annotation payload.
    property checksum_md5 : String | Nil

    # Base64-encoded XXHASH64 checksum of the annotation payload.
    property checksum_xxhash64 : String | Nil

    # Base64-encoded XXHASH3 checksum of the annotation payload.
    property checksum_xxhash3 : String | Nil

    # Base64-encoded XXHASH128 checksum of the annotation payload.
    property checksum_xxhash128 : String | Nil

    # Base64-encoded MD5 digest of the message.
    property content_md5 : String | Nil

    property request_payer : RequestPayer | Nil

    # The account ID of the expected bucket owner. If the bucket is owned by a different account, the
    # request fails with an HTTP 403 (Access Denied) error.
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @key : String,
      @annotation_name : String,
      @annotation_payload : String,
      @version_id : String | Nil = nil,
      @object_if_match : String | Nil = nil,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
      @checksum_crc32 : String | Nil = nil,
      @checksum_crc32c : String | Nil = nil,
      @checksum_crc64nvme : String | Nil = nil,
      @checksum_sha1 : String | Nil = nil,
      @checksum_sha256 : String | Nil = nil,
      @checksum_sha512 : String | Nil = nil,
      @checksum_md5 : String | Nil = nil,
      @checksum_xxhash64 : String | Nil = nil,
      @checksum_xxhash3 : String | Nil = nil,
      @checksum_xxhash128 : String | Nil = nil,
      @content_md5 : String | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
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
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@bucket, @key, @version_id, @annotation_name, @annotation_payload, @object_if_match, @checksum_algorithm, @checksum_crc32, @checksum_crc32c, @checksum_crc64nvme, @checksum_sha1, @checksum_sha256, @checksum_sha512, @checksum_md5, @checksum_xxhash64, @checksum_xxhash3, @checksum_xxhash128, @content_md5, @request_payer, @expected_bucket_owner)
  end
end
