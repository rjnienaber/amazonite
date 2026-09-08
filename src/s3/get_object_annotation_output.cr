private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class GetObjectAnnotationOutput
    # The annotation payload.
    property annotation_payload : String | Nil

    # The version ID of the object that the annotation is attached to.
    property object_version_id : String | Nil

    # The date and time the annotation was last modified.
    property last_modified : Time | Nil

    # The size of the annotation payload, in bytes.
    property content_length : Int64 | Nil

    # The entity tag of the annotation.
    property e_tag : String | Nil

    # The CRC32 checksum of the annotation payload.
    property checksum_crc32 : String | Nil

    # The CRC32C checksum of the annotation payload.
    property checksum_crc32c : String | Nil

    # The CRC64NVME checksum of the annotation payload.
    property checksum_crc64nvme : String | Nil

    # The SHA1 checksum of the annotation payload.
    property checksum_sha1 : String | Nil

    # The SHA256 checksum of the annotation payload.
    property checksum_sha256 : String | Nil

    # The SHA512 checksum of the annotation payload.
    property checksum_sha512 : String | Nil

    # The MD5 checksum of the annotation payload.
    property checksum_md5 : String | Nil

    # The XXHASH64 checksum of the annotation payload.
    property checksum_xxhash64 : String | Nil

    # The XXHASH3 checksum of the annotation payload.
    property checksum_xxhash3 : String | Nil

    # The XXHASH128 checksum of the annotation payload.
    property checksum_xxhash128 : String | Nil

    # The type of checksum used.
    property checksum_type : ChecksumType | Nil

    # The server-side encryption algorithm used.
    property server_side_encryption : ServerSideEncryption | Nil

    property request_charged : RequestCharged | Nil

    # The replication status of the annotation. Possible values include `PENDING`, `COMPLETED`,
    # `FAILED`, and `REPLICA`.
    property replication_status : ReplicationStatus | Nil

    def initialize(
      @annotation_payload : String | Nil = nil,
      @object_version_id : String | Nil = nil,
      @last_modified : Time | Nil = nil,
      @content_length : Int64 | Nil = nil,
      @e_tag : String | Nil = nil,
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
      @checksum_type : ChecksumType | Nil = nil,
      @server_side_encryption : ServerSideEncryption | Nil = nil,
      @request_charged : RequestCharged | Nil = nil,
      @replication_status : ReplicationStatus | Nil = nil,
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

    def_equals_and_hash(@annotation_payload, @object_version_id, @last_modified, @content_length, @e_tag, @checksum_crc32, @checksum_crc32c, @checksum_crc64nvme, @checksum_sha1, @checksum_sha256, @checksum_sha512, @checksum_md5, @checksum_xxhash64, @checksum_xxhash3, @checksum_xxhash128, @checksum_type, @server_side_encryption, @request_charged, @replication_status)
  end
end
