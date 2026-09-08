private alias Core = Amazonite::Core

module Amazonite::S3
  # A container for elements related to an individual part.
  class ObjectPart
    # The part number identifying the part. This value is a positive integer between 1 and 10,000.
    property part_number : Int32 | Nil

    # The size of the uploaded part in bytes.
    property size : Int64 | Nil

    # The Base64 encoded, 32-bit `CRC32` checksum of the part. This checksum is present if the
    # multipart upload request was created with the `CRC32` checksum algorithm. For more information,
    # see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32 : String | Nil

    # The Base64 encoded, 32-bit `CRC32C` checksum of the part. This checksum is present if the
    # multipart upload request was created with the `CRC32C` checksum algorithm. For more information,
    # see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32c : String | Nil

    # The Base64 encoded, 64-bit `CRC64NVME` checksum of the part. This checksum is present if the
    # multipart upload request was created with the `CRC64NVME` checksum algorithm, or if the object
    # was uploaded without a checksum (and Amazon S3 added the default checksum, `CRC64NVME`, to the
    # uploaded object). For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_crc64nvme : String | Nil

    # The Base64 encoded, 160-bit `SHA1` checksum of the part. This checksum is present if the
    # multipart upload request was created with the `SHA1` checksum algorithm. For more information,
    # see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_sha1 : String | Nil

    # The Base64 encoded, 256-bit `SHA256` checksum of the part. This checksum is present if the
    # multipart upload request was created with the `SHA256` checksum algorithm. For more information,
    # see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_sha256 : String | Nil

    # The Base64 encoded, 512-bit `SHA512` digest of the part. This checksum is present if the
    # multipart upload request was created with the `SHA512` checksum algorithm. For more information,
    # see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_sha512 : String | Nil

    # The Base64 encoded, 128-bit `MD5` digest of the part. This checksum is present if the multipart
    # upload request was created with the `MD5` checksum algorithm. For more information, see
    # [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_md5 : String | Nil

    # The Base64 encoded, 64-bit `XXHASH64` checksum of the part. This checksum is present if the
    # multipart upload request was created with the `XXHASH64` checksum algorithm. For more
    # information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_xxhash64 : String | Nil

    # The Base64 encoded, 64-bit `XXHASH3` checksum of the part. This checksum is present if the
    # multipart upload request was created with the `XXHASH3` checksum algorithm. For more
    # information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_xxhash3 : String | Nil

    # The Base64 encoded, 128-bit `XXHASH128` checksum of the part. This checksum is present if the
    # multipart upload request was created with the `XXHASH128` checksum algorithm. For more
    # information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_xxhash128 : String | Nil

    def initialize(
      @part_number : Int32 | Nil = nil,
      @size : Int64 | Nil = nil,
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
      if value = @part_number
        xml.element("PartNumber") { xml.text value.to_s }
      end

      if value = @size
        xml.element("Size") { xml.text value.to_s }
      end

      if value = @checksum_crc32
        xml.element("ChecksumCRC32") { xml.text value }
      end

      if value = @checksum_crc32c
        xml.element("ChecksumCRC32C") { xml.text value }
      end

      if value = @checksum_crc64nvme
        xml.element("ChecksumCRC64NVME") { xml.text value }
      end

      if value = @checksum_sha1
        xml.element("ChecksumSHA1") { xml.text value }
      end

      if value = @checksum_sha256
        xml.element("ChecksumSHA256") { xml.text value }
      end

      if value = @checksum_sha512
        xml.element("ChecksumSHA512") { xml.text value }
      end

      if value = @checksum_md5
        xml.element("ChecksumMD5") { xml.text value }
      end

      if value = @checksum_xxhash64
        xml.element("ChecksumXXHASH64") { xml.text value }
      end

      if value = @checksum_xxhash3
        xml.element("ChecksumXXHASH3") { xml.text value }
      end

      if value = @checksum_xxhash128
        xml.element("ChecksumXXHASH128") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        part_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='PartNumber']")),
        size: Core::XMLValue.i64(node.xpath_node("*[local-name()='Size']")),
        checksum_crc32: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumCRC32']")),
        checksum_crc32c: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumCRC32C']")),
        checksum_crc64nvme: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumCRC64NVME']")),
        checksum_sha1: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumSHA1']")),
        checksum_sha256: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumSHA256']")),
        checksum_sha512: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumSHA512']")),
        checksum_md5: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumMD5']")),
        checksum_xxhash64: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumXXHASH64']")),
        checksum_xxhash3: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumXXHASH3']")),
        checksum_xxhash128: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumXXHASH128']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@part_number, @size, @checksum_crc32, @checksum_crc32c, @checksum_crc64nvme, @checksum_sha1, @checksum_sha256, @checksum_sha512, @checksum_md5, @checksum_xxhash64, @checksum_xxhash3, @checksum_xxhash128)
  end
end
