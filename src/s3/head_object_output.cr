private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class HeadObjectOutput
    # Specifies whether the object retrieved was (true) or was not (false) a Delete Marker. If false,
    # this response header does not appear in the response.
    #
    # This functionality is not supported for directory buckets.
    property delete_marker : Bool | Nil

    # Indicates that a range of bytes was specified.
    property accept_ranges : String | Nil

    # If the object expiration is configured (see [ `PutBucketLifecycleConfiguration`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html)),
    # the response includes this header. It includes the `expiry-date` and `rule-id` key-value pairs
    # providing object expiration information. The value of the `rule-id` is URL-encoded.
    #
    # Object expiration information is not returned in directory buckets and this header returns the
    # value "`NotImplemented`" in all responses for directory buckets.
    property expiration : String | Nil

    # If the object is an archived object (an object whose storage class is GLACIER), the response
    # includes this header if either the archive restoration is in progress (see
    # [RestoreObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html) or an
    # archive copy is already restored.
    #
    # If an archive copy is already restored, the header value indicates when Amazon S3 is scheduled
    # to delete the object copy. For example:
    #
    # `x-amz-restore: ongoing-request="false", expiry-date="Fri, 21 Dec 2012 00:00:00 GMT"`
    #
    # If the object restoration is in progress, the header returns the value `ongoing-request="true"`.
    #
    # For more information about archiving objects, see [Transitioning Objects: General
    # Considerations](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html#lifecycle-transition-general-considerations).
    #
    # This functionality is not supported for directory buckets. Directory buckets only support
    # `EXPRESS_ONEZONE` (the S3 Express One Zone storage class) in Availability Zones and `ONEZONE_IA`
    # (the S3 One Zone-Infrequent Access storage class) in Dedicated Local Zones.
    property restore : String | Nil

    # The archive state of the head object.
    #
    # This functionality is not supported for directory buckets.
    property archive_status : ArchiveStatus | Nil

    # Date and time when the object was last modified.
    property last_modified : Time | Nil

    # Size of the body in bytes.
    property content_length : Int64 | Nil

    # The Base64 encoded, 32-bit `CRC32 checksum` of the object. This checksum is only present if the
    # checksum was uploaded with the object. When you use an API operation on an object that was
    # uploaded using multipart uploads, this value may not be a direct checksum value of the full
    # object. Instead, it's a calculation based on the checksum values of each individual part. For
    # more information about how checksums are calculated with multipart uploads, see [ Checking
    # object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32 : String | Nil

    # The Base64 encoded, 32-bit `CRC32C` checksum of the object. This checksum is only present if the
    # checksum was uploaded with the object. When you use an API operation on an object that was
    # uploaded using multipart uploads, this value may not be a direct checksum value of the full
    # object. Instead, it's a calculation based on the checksum values of each individual part. For
    # more information about how checksums are calculated with multipart uploads, see [ Checking
    # object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32c : String | Nil

    # The Base64 encoded, 64-bit `CRC64NVME` checksum of the object. For more information, see
    # [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_crc64nvme : String | Nil

    # The Base64 encoded, 160-bit `SHA1` digest of the object. This checksum is only present if the
    # checksum was uploaded with the object. When you use the API operation on an object that was
    # uploaded using multipart uploads, this value may not be a direct checksum value of the full
    # object. Instead, it's a calculation based on the checksum values of each individual part. For
    # more information about how checksums are calculated with multipart uploads, see [ Checking
    # object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums)
    # in the *Amazon S3 User Guide*.
    property checksum_sha1 : String | Nil

    # The Base64 encoded, 256-bit `SHA256` digest of the object. This checksum is only present if the
    # checksum was uploaded with the object. When you use an API operation on an object that was
    # uploaded using multipart uploads, this value may not be a direct checksum value of the full
    # object. Instead, it's a calculation based on the checksum values of each individual part. For
    # more information about how checksums are calculated with multipart uploads, see [ Checking
    # object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums)
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
    # checksum type that is received is the same checksum type that was specified in
    # `CreateMultipartUpload` request. For more information, see [Checking object integrity in the
    # Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_type : ChecksumType | Nil

    # An entity tag (ETag) is an opaque identifier assigned by a web server to a specific version of a
    # resource found at a URL.
    property e_tag : String | Nil

    # This is set to the number of metadata entries not returned in `x-amz-meta` headers. This can
    # happen if you create metadata using an API like SOAP that supports more flexible metadata than
    # the REST API. For example, using SOAP, you can create metadata whose values are not legal HTTP
    # headers.
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

    # A standard MIME type describing the format of the object data.
    property content_type : String | Nil

    # The portion of the object returned in the response for a `GET` request.
    property content_range : String | Nil

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
    # For more information, see [Storage
    # Classes](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html).
    #
    # **Directory buckets ** - Directory buckets only support `EXPRESS_ONEZONE` (the S3 Express One
    # Zone storage class) in Availability Zones and `ONEZONE_IA` (the S3 One Zone-Infrequent Access
    # storage class) in Dedicated Local Zones.
    property storage_class : StorageClass | Nil

    property request_charged : RequestCharged | Nil

    # Amazon S3 can return this header if your request involves a bucket that is either a source or a
    # destination in a replication rule.
    #
    # In replication, you have a source bucket on which you configure replication and destination
    # bucket or buckets where Amazon S3 stores object replicas. When you request an object
    # (`GetObject`) or object metadata (`HeadObject`) from these buckets, Amazon S3 will return the
    # `x-amz-replication-status` header in the response as follows:
    #
    # - **If requesting an object from the source bucket**, Amazon S3 will return the
    # `x-amz-replication-status` header if the object in your request is eligible for replication.
    #
    # For example, suppose that in your replication configuration, you specify object prefix `TaxDocs`
    # requesting Amazon S3 to replicate objects with key prefix `TaxDocs`. Any objects you upload with
    # this key name prefix, for example `TaxDocs/document1.pdf`, are eligible for replication. For any
    # object request with this key name prefix, Amazon S3 will return the `x-amz-replication-status`
    # header with value PENDING, COMPLETED or FAILED indicating object replication status.
    #
    # - **If requesting an object from a destination bucket**, Amazon S3 will return the
    # `x-amz-replication-status` header with value REPLICA if the object in your request is a replica
    # that Amazon S3 created and there is no replica modification replication in progress.
    #
    # - **When replicating objects to multiple destination buckets**, the `x-amz-replication-status`
    # header acts differently. The header of the source object will only return a value of COMPLETED
    # when replication is successful to all destinations. The header will remain at value PENDING
    # until replication has completed for all destinations. If one or more destinations fails
    # replication the header will return FAILED.
    #
    # For more information, see
    # [Replication](https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html).
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

    # The Object Lock mode, if any, that's in effect for this object. This header is only returned if
    # the requester has the `s3:GetObjectRetention` permission. For more information about S3 Object
    # Lock, see [Object Lock](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html).
    #
    # This functionality is not supported for directory buckets.
    property object_lock_mode : ObjectLockMode | Nil

    # The date and time when the Object Lock retention period expires. This header is only returned if
    # the requester has the `s3:GetObjectRetention` permission.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_retain_until_date : Time | Nil

    # Specifies whether a legal hold is in effect for this object. This header is only returned if the
    # requester has the `s3:GetObjectLegalHold` permission. This header is not returned if the
    # specified version of this object has never had a legal hold applied. For more information about
    # S3 Object Lock, see [Object
    # Lock](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html).
    #
    # This functionality is not supported for directory buckets.
    property object_lock_legal_hold_status : ObjectLockLegalHoldStatus | Nil

    def initialize(
      @delete_marker : Bool | Nil = nil,
      @accept_ranges : String | Nil = nil,
      @expiration : String | Nil = nil,
      @restore : String | Nil = nil,
      @archive_status : ArchiveStatus | Nil = nil,
      @last_modified : Time | Nil = nil,
      @content_length : Int64 | Nil = nil,
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
      @e_tag : String | Nil = nil,
      @missing_meta : Int32 | Nil = nil,
      @version_id : String | Nil = nil,
      @cache_control : String | Nil = nil,
      @content_disposition : String | Nil = nil,
      @content_encoding : String | Nil = nil,
      @content_language : String | Nil = nil,
      @content_type : String | Nil = nil,
      @content_range : String | Nil = nil,
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

    def_equals_and_hash(@delete_marker, @accept_ranges, @expiration, @restore, @archive_status, @last_modified, @content_length, @checksum_crc32, @checksum_crc32c, @checksum_crc64nvme, @checksum_sha1, @checksum_sha256, @checksum_sha512, @checksum_md5, @checksum_xxhash64, @checksum_xxhash3, @checksum_xxhash128, @checksum_type, @e_tag, @missing_meta, @version_id, @cache_control, @content_disposition, @content_encoding, @content_language, @content_type, @content_range, @expires, @website_redirect_location, @server_side_encryption, @metadata, @sse_customer_algorithm, @sse_customer_key_md5, @ssekms_key_id, @bucket_key_enabled, @storage_class, @request_charged, @replication_status, @parts_count, @tag_count, @object_lock_mode, @object_lock_retain_until_date, @object_lock_legal_hold_status)
  end
end
