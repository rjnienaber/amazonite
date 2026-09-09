private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class GetObjectOutput
    # Object data.
    property body : String | Nil

    # Indicates whether the object retrieved was (true) or was not (false) a Delete Marker. If false,
    # this response header does not appear in the response.
    #
    # - If the current version of the object is a delete marker, Amazon S3 behaves as if the object
    # was deleted and includes `x-amz-delete-marker: true` in the response.
    #
    # - If the specified version in the request is a delete marker, the response returns a `405 Method
    # Not Allowed` error and the `Last-Modified: timestamp` response header.
    property delete_marker : Bool | Nil

    # Indicates that a range of bytes was specified in the request.
    property accept_ranges : String | Nil

    # If the object expiration is configured (see [ `PutBucketLifecycleConfiguration`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html)),
    # the response includes this header. It includes the `expiry-date` and `rule-id` key-value pairs
    # providing object expiration information. The value of the `rule-id` is URL-encoded.
    #
    # Object expiration information is not returned in directory buckets and this header returns the
    # value "`NotImplemented`" in all responses for directory buckets.
    property expiration : String | Nil

    # Provides information about object restoration action and expiration time of the restored object
    # copy.
    #
    # This functionality is not supported for directory buckets. Directory buckets only support
    # `EXPRESS_ONEZONE` (the S3 Express One Zone storage class) in Availability Zones and `ONEZONE_IA`
    # (the S3 One Zone-Infrequent Access storage class) in Dedicated Local Zones.
    property restore : String | Nil

    # Date and time when the object was last modified.
    #
    # **General purpose buckets ** - When you specify a `versionId` of the object in your request, if
    # the specified version in the request is a delete marker, the response returns a `405 Method Not
    # Allowed` error and the `Last-Modified: timestamp` response header.
    property last_modified : Time | Nil

    # Size of the body in bytes.
    property content_length : Int64 | Nil

    # An entity tag (ETag) is an opaque identifier assigned by a web server to a specific version of a
    # resource found at a URL.
    property e_tag : String | Nil

    # The Base64 encoded, 32-bit `CRC32` checksum of the object. This checksum is only present if the
    # checksum was uploaded with the object. For more information, see [ Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32 : String | Nil

    # The Base64 encoded, 32-bit `CRC32C` checksum of the object. This checksum is only present if the
    # checksum was uploaded with the object. For more information, see [ Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32c : String | Nil

    # The Base64 encoded, 64-bit `CRC64NVME` checksum of the object. For more information, see
    # [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_crc64nvme : String | Nil

    # The Base64 encoded, 160-bit `SHA1` digest of the object. This checksum is only present if the
    # checksum was uploaded with the object. For more information, see [ Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_sha1 : String | Nil

    # The Base64 encoded, 256-bit `SHA256` digest of the object. This checksum is only present if the
    # checksum was uploaded with the object. For more information, see [ Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_sha256 : String | Nil

    # The Base64 encoded, 512-bit `SHA512` digest of the object. For more information, see [Checking
    # object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_sha512 : String | Nil

    # The Base64 encoded, 128-bit `MD5` digest of the object. For more information, see [Checking
    # object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_md5 : String | Nil

    # The Base64 encoded, 64-bit `XXHASH64` checksum of the object. For more information, see
    # [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash64 : String | Nil

    # The Base64 encoded, 64-bit `XXHASH3` checksum of the object. For more information, see [Checking
    # object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash3 : String | Nil

    # The Base64 encoded, 128-bit `XXHASH128` checksum of the object. For more information, see
    # [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash128 : String | Nil

    # The checksum type, which determines how part-level checksums are combined to create an
    # object-level checksum for multipart objects. You can use this header response to verify that the
    # checksum type that is received is the same checksum type that was specified in the
    # `CreateMultipartUpload` request. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_type : ChecksumType | Nil

    # This is set to the number of metadata entries not returned in the headers that are prefixed with
    # `x-amz-meta-`. This can happen if you create metadata using an API like SOAP that supports more
    # flexible metadata than the REST API. For example, using SOAP, you can create metadata whose
    # values are not legal HTTP headers.
    #
    # This functionality is not supported for directory buckets.
    property missing_meta : Int32 | Nil

    # Version ID of the object.
    #
    # This functionality is not supported for directory buckets.
    property version_id : String | Nil

    # Specifies caching behavior along the request/reply chain.
    property cache_control : String | Nil

    # Specifies presentational information for the object.
    property content_disposition : String | Nil

    # Indicates what content encodings have been applied to the object and thus what decoding
    # mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.
    property content_encoding : String | Nil

    # The language the content is in.
    property content_language : String | Nil

    # The portion of the object returned in the response.
    property content_range : String | Nil

    # A standard MIME type describing the format of the object data.
    property content_type : String | Nil

    # The date and time at which the object is no longer cacheable.
    property expires : String | Nil

    # If the bucket is configured as a website, redirects requests for this object to another object
    # in the same bucket or to an external URL. Amazon S3 stores the value of this header in the
    # object metadata.
    #
    # This functionality is not supported for directory buckets.
    property website_redirect_location : String | Nil

    # The server-side encryption algorithm used when you store this object in Amazon S3 or Amazon FSx.
    #
    # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid
    # server side encryption option is `aws:fsx`.
    property server_side_encryption : ServerSideEncryption | Nil

    # A map of metadata to store with the object in S3.
    property metadata : Hash(String, String) | Nil

    # If server-side encryption with a customer-provided encryption key was requested, the response
    # will include this header to confirm the encryption algorithm that's used.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_algorithm : String | Nil

    # If server-side encryption with a customer-provided encryption key was requested, the response
    # will include this header to provide the round-trip message integrity verification of the
    # customer-provided encryption key.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_key_md5 : String | Nil

    # If present, indicates the ID of the KMS key that was used for object encryption.
    property ssekms_key_id : String | Nil

    # Indicates whether the object uses an S3 Bucket Key for server-side encryption with Key
    # Management Service (KMS) keys (SSE-KMS).
    property bucket_key_enabled : Bool | Nil

    # Provides storage class information of the object. Amazon S3 returns this header for all objects
    # except for S3 Standard storage class objects.
    #
    # **Directory buckets ** - Directory buckets only support `EXPRESS_ONEZONE` (the S3 Express One
    # Zone storage class) in Availability Zones and `ONEZONE_IA` (the S3 One Zone-Infrequent Access
    # storage class) in Dedicated Local Zones.
    property storage_class : StorageClass | Nil

    property request_charged : RequestCharged | Nil

    # Amazon S3 can return this if your request involves a bucket that is either a source or
    # destination in a replication rule.
    #
    # This functionality is not supported for directory buckets.
    property replication_status : ReplicationStatus | Nil

    # The count of parts this object has. This value is only returned if you specify `partNumber` in
    # your request and the object was uploaded as a multipart upload.
    property parts_count : Int32 | Nil

    # The number of tags, if any, on the object, when you have the relevant permission to read object
    # tags.
    #
    # You can use
    # [GetObjectTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html) to
    # retrieve the tag set associated with an object.
    #
    # This functionality is not supported for directory buckets.
    property tag_count : Int32 | Nil

    # The Object Lock mode that's currently in place for this object.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_mode : ObjectLockMode | Nil

    # The date and time when this object's Object Lock will expire.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_retain_until_date : Time | Nil

    # Indicates whether this object has an active legal hold. This field is only returned if you have
    # permission to view an object's legal hold status.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_legal_hold_status : ObjectLockLegalHoldStatus | Nil

    # The event hold status for this object. This header is only returned if the requester has the
    # `s3:GetObjectRetention` permission.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_event_hold : ObjectLockEventHold | Nil

    # The event hold duration in days for this object. Only returned when the event hold is enabled.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_event_hold_duration_days : Int32 | Nil

    # The event hold duration in years for this object. Only returned when the event hold is enabled.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_event_hold_duration_years : Int32 | Nil

    def initialize(
      @body : String | Nil = nil,
      @delete_marker : Bool | Nil = nil,
      @accept_ranges : String | Nil = nil,
      @expiration : String | Nil = nil,
      @restore : String | Nil = nil,
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
      @missing_meta : Int32 | Nil = nil,
      @version_id : String | Nil = nil,
      @cache_control : String | Nil = nil,
      @content_disposition : String | Nil = nil,
      @content_encoding : String | Nil = nil,
      @content_language : String | Nil = nil,
      @content_range : String | Nil = nil,
      @content_type : String | Nil = nil,
      @expires : String | Nil = nil,
      @website_redirect_location : String | Nil = nil,
      @server_side_encryption : ServerSideEncryption | Nil = nil,
      @metadata : Hash(String, String) | Nil = nil,
      @sse_customer_algorithm : String | Nil = nil,
      @sse_customer_key_md5 : String | Nil = nil,
      @ssekms_key_id : String | Nil = nil,
      @bucket_key_enabled : Bool | Nil = nil,
      @storage_class : StorageClass | Nil = nil,
      @request_charged : RequestCharged | Nil = nil,
      @replication_status : ReplicationStatus | Nil = nil,
      @parts_count : Int32 | Nil = nil,
      @tag_count : Int32 | Nil = nil,
      @object_lock_mode : ObjectLockMode | Nil = nil,
      @object_lock_retain_until_date : Time | Nil = nil,
      @object_lock_legal_hold_status : ObjectLockLegalHoldStatus | Nil = nil,
      @object_lock_event_hold : ObjectLockEventHold | Nil = nil,
      @object_lock_event_hold_duration_days : Int32 | Nil = nil,
      @object_lock_event_hold_duration_years : Int32 | Nil = nil,
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

    def_equals_and_hash(@body, @delete_marker, @accept_ranges, @expiration, @restore, @last_modified, @content_length, @e_tag, @checksum_crc32, @checksum_crc32c, @checksum_crc64nvme, @checksum_sha1, @checksum_sha256, @checksum_sha512, @checksum_md5, @checksum_xxhash64, @checksum_xxhash3, @checksum_xxhash128, @checksum_type, @missing_meta, @version_id, @cache_control, @content_disposition, @content_encoding, @content_language, @content_range, @content_type, @expires, @website_redirect_location, @server_side_encryption, @metadata, @sse_customer_algorithm, @sse_customer_key_md5, @ssekms_key_id, @bucket_key_enabled, @storage_class, @request_charged, @replication_status, @parts_count, @tag_count, @object_lock_mode, @object_lock_retain_until_date, @object_lock_legal_hold_status, @object_lock_event_hold, @object_lock_event_hold_duration_days, @object_lock_event_hold_duration_years)
  end
end
