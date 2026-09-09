private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class CreateMultipartUploadRequest
    # The canned ACL to apply to the object. Amazon S3 supports a set of predefined ACLs, known as
    # *canned ACLs*. Each canned ACL has a predefined set of grantees and permissions. For more
    # information, see [Canned
    # ACL](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL) in the *Amazon
    # S3 User Guide*.
    #
    # By default, all objects are private. Only the owner has full access control. When uploading an
    # object, you can grant access permissions to individual Amazon Web Services accounts or to
    # predefined groups defined by Amazon S3. These permissions are then added to the access control
    # list (ACL) on the new object. For more information, see [Using
    # ACLs](https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html). One way to grant
    # the permissions using the request headers is to specify a canned ACL with the `x-amz-acl`
    # request header.
    #
    # - This functionality is not supported for directory buckets.
    #
    # - This functionality is not supported for Amazon S3 on Outposts.
    property acl : ObjectCannedACL | Nil

    # The name of the bucket where the multipart upload is initiated and where the object is uploaded.
    #
    # **Directory buckets** - When you use this operation with a directory bucket, you must use
    # virtual-hosted-style requests in the format `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`. Path-style requests are not
    # supported. Directory bucket names must be unique in the chosen Zone (Availability Zone or Local
    # Zone). Bucket names must follow the format ` *bucket-base-name*--*zone-id*--x-s3` (for example,
    # ` *amzn-s3-demo-bucket*--*usw2-az1*--x-s3`). For information about bucket naming restrictions,
    # see [Directory bucket naming
    # rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html)
    # in the *Amazon S3 User Guide*.
    #
    # **Access points** - When you use this action with an access point for general purpose buckets,
    # you must provide the alias of the access point in place of the bucket name or specify the access
    # point ARN. When you use this action with an access point for directory buckets, you must provide
    # the access point name in place of the bucket name. When using the access point ARN, you must
    # direct requests to the access point hostname. The access point hostname takes the form
    # *AccessPointName*-*AccountId*.s3-accesspoint.*Region*.amazonaws.com. When using this action with
    # an access point through the Amazon Web Services SDKs, you provide the access point ARN in place
    # of the bucket name. For more information about access point ARNs, see [Using access
    # points](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html) in the
    # *Amazon S3 User Guide*.
    #
    # Object Lambda access points are not supported by directory buckets.
    #
    # **S3 on Outposts** - When you use this action with S3 on Outposts, you must direct requests to
    # the S3 on Outposts hostname. The S3 on Outposts hostname takes the form `
    # *AccessPointName*-*AccountId*.*outpostID*.s3-outposts.*Region*.amazonaws.com`. When you use this
    # action with S3 on Outposts, the destination bucket must be the Outposts access point ARN or the
    # access point alias. For more information about S3 on Outposts, see [What is S3 on
    # Outposts?](https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html) in the
    # *Amazon S3 User Guide*.
    property bucket : String = ""

    # Specifies caching behavior along the request/reply chain.
    property cache_control : String | Nil

    # Specifies presentational information for the object.
    property content_disposition : String | Nil

    # Specifies what content encodings have been applied to the object and thus what decoding
    # mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.
    #
    # For directory buckets, only the `aws-chunked` value is supported in this header field.
    property content_encoding : String | Nil

    # The language that the content is in.
    property content_language : String | Nil

    # A standard MIME type describing the format of the object data.
    property content_type : String | Nil

    # The date and time at which the object is no longer cacheable.
    property expires : String | Nil

    # Specify access permissions explicitly to give the grantee READ, READ_ACP, and WRITE_ACP
    # permissions on the object.
    #
    # By default, all objects are private. Only the owner has full access control. When uploading an
    # object, you can use this header to explicitly grant access permissions to specific Amazon Web
    # Services accounts or groups. This header maps to specific permissions that Amazon S3 supports in
    # an ACL. For more information, see [Access Control List (ACL)
    # Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html) in the *Amazon S3
    # User Guide*.
    #
    # You specify each grantee as a type=value pair, where the type is one of the following:
    #
    # - `id` – if the value specified is the canonical user ID of an Amazon Web Services account
    #
    # - `uri` – if you are granting permissions to a predefined group
    #
    # - `emailAddress` – if the value specified is the email address of an Amazon Web Services account
    #
    # Using email addresses to specify a grantee is only supported in the following Amazon Web
    # Services Regions:
    #
    # - US East (N. Virginia)
    #
    # - US West (N. California)
    #
    # - US West (Oregon)
    #
    # - Asia Pacific (Singapore)
    #
    # - Asia Pacific (Sydney)
    #
    # - Asia Pacific (Tokyo)
    #
    # - Europe (Ireland)
    #
    # - South America (São Paulo)
    #
    # For a list of all the Amazon S3 supported Regions and endpoints, see [Regions and
    # Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region) in the Amazon Web
    # Services General Reference.
    #
    # For example, the following `x-amz-grant-read` header grants the Amazon Web Services accounts
    # identified by account IDs permissions to read object data and its metadata:
    #
    # `x-amz-grant-read: id="11112222333", id="444455556666" `
    #
    # - This functionality is not supported for directory buckets.
    #
    # - This functionality is not supported for Amazon S3 on Outposts.
    property grant_full_control : String | Nil

    # Specify access permissions explicitly to allow grantee to read the object data and its metadata.
    #
    # By default, all objects are private. Only the owner has full access control. When uploading an
    # object, you can use this header to explicitly grant access permissions to specific Amazon Web
    # Services accounts or groups. This header maps to specific permissions that Amazon S3 supports in
    # an ACL. For more information, see [Access Control List (ACL)
    # Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html) in the *Amazon S3
    # User Guide*.
    #
    # You specify each grantee as a type=value pair, where the type is one of the following:
    #
    # - `id` – if the value specified is the canonical user ID of an Amazon Web Services account
    #
    # - `uri` – if you are granting permissions to a predefined group
    #
    # - `emailAddress` – if the value specified is the email address of an Amazon Web Services account
    #
    # Using email addresses to specify a grantee is only supported in the following Amazon Web
    # Services Regions:
    #
    # - US East (N. Virginia)
    #
    # - US West (N. California)
    #
    # - US West (Oregon)
    #
    # - Asia Pacific (Singapore)
    #
    # - Asia Pacific (Sydney)
    #
    # - Asia Pacific (Tokyo)
    #
    # - Europe (Ireland)
    #
    # - South America (São Paulo)
    #
    # For a list of all the Amazon S3 supported Regions and endpoints, see [Regions and
    # Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region) in the Amazon Web
    # Services General Reference.
    #
    # For example, the following `x-amz-grant-read` header grants the Amazon Web Services accounts
    # identified by account IDs permissions to read object data and its metadata:
    #
    # `x-amz-grant-read: id="11112222333", id="444455556666" `
    #
    # - This functionality is not supported for directory buckets.
    #
    # - This functionality is not supported for Amazon S3 on Outposts.
    property grant_read : String | Nil

    # Specify access permissions explicitly to allows grantee to read the object ACL.
    #
    # By default, all objects are private. Only the owner has full access control. When uploading an
    # object, you can use this header to explicitly grant access permissions to specific Amazon Web
    # Services accounts or groups. This header maps to specific permissions that Amazon S3 supports in
    # an ACL. For more information, see [Access Control List (ACL)
    # Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html) in the *Amazon S3
    # User Guide*.
    #
    # You specify each grantee as a type=value pair, where the type is one of the following:
    #
    # - `id` – if the value specified is the canonical user ID of an Amazon Web Services account
    #
    # - `uri` – if you are granting permissions to a predefined group
    #
    # - `emailAddress` – if the value specified is the email address of an Amazon Web Services account
    #
    # Using email addresses to specify a grantee is only supported in the following Amazon Web
    # Services Regions:
    #
    # - US East (N. Virginia)
    #
    # - US West (N. California)
    #
    # - US West (Oregon)
    #
    # - Asia Pacific (Singapore)
    #
    # - Asia Pacific (Sydney)
    #
    # - Asia Pacific (Tokyo)
    #
    # - Europe (Ireland)
    #
    # - South America (São Paulo)
    #
    # For a list of all the Amazon S3 supported Regions and endpoints, see [Regions and
    # Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region) in the Amazon Web
    # Services General Reference.
    #
    # For example, the following `x-amz-grant-read` header grants the Amazon Web Services accounts
    # identified by account IDs permissions to read object data and its metadata:
    #
    # `x-amz-grant-read: id="11112222333", id="444455556666" `
    #
    # - This functionality is not supported for directory buckets.
    #
    # - This functionality is not supported for Amazon S3 on Outposts.
    property grant_read_acp : String | Nil

    # Specify access permissions explicitly to allows grantee to allow grantee to write the ACL for
    # the applicable object.
    #
    # By default, all objects are private. Only the owner has full access control. When uploading an
    # object, you can use this header to explicitly grant access permissions to specific Amazon Web
    # Services accounts or groups. This header maps to specific permissions that Amazon S3 supports in
    # an ACL. For more information, see [Access Control List (ACL)
    # Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html) in the *Amazon S3
    # User Guide*.
    #
    # You specify each grantee as a type=value pair, where the type is one of the following:
    #
    # - `id` – if the value specified is the canonical user ID of an Amazon Web Services account
    #
    # - `uri` – if you are granting permissions to a predefined group
    #
    # - `emailAddress` – if the value specified is the email address of an Amazon Web Services account
    #
    # Using email addresses to specify a grantee is only supported in the following Amazon Web
    # Services Regions:
    #
    # - US East (N. Virginia)
    #
    # - US West (N. California)
    #
    # - US West (Oregon)
    #
    # - Asia Pacific (Singapore)
    #
    # - Asia Pacific (Sydney)
    #
    # - Asia Pacific (Tokyo)
    #
    # - Europe (Ireland)
    #
    # - South America (São Paulo)
    #
    # For a list of all the Amazon S3 supported Regions and endpoints, see [Regions and
    # Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region) in the Amazon Web
    # Services General Reference.
    #
    # For example, the following `x-amz-grant-read` header grants the Amazon Web Services accounts
    # identified by account IDs permissions to read object data and its metadata:
    #
    # `x-amz-grant-read: id="11112222333", id="444455556666" `
    #
    # - This functionality is not supported for directory buckets.
    #
    # - This functionality is not supported for Amazon S3 on Outposts.
    property grant_write_acp : String | Nil

    # Object key for which the multipart upload is to be initiated.
    property key : String = ""

    # A map of metadata to store with the object in S3.
    property metadata : Hash(String, String) | Nil

    # The server-side encryption algorithm used when you store this object in Amazon S3 or Amazon FSx.
    #
    # - **Directory buckets ** - For directory buckets, there are only two supported options for
    # server-side encryption: server-side encryption with Amazon S3 managed keys (SSE-S3) (`AES256`)
    # and server-side encryption with KMS keys (SSE-KMS) (`aws:kms`). We recommend that the bucket's
    # default encryption uses the desired encryption configuration and you don't override the bucket
    # default encryption in your `CreateSession` requests or `PUT` object requests. Then, new objects
    # are automatically encrypted with the desired encryption settings. For more information, see
    # [Protecting data with server-side
    # encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-serv-side-encryption.html)
    # in the *Amazon S3 User Guide*. For more information about the encryption overriding behaviors in
    # directory buckets, see [Specifying server-side encryption with KMS for new object
    # uploads](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-specifying-kms-encryption.html).
    #
    # In the Zonal endpoint API calls (except
    # [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html) and
    # [UploadPartCopy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html)) using
    # the REST API, the encryption request headers must match the encryption settings that are
    # specified in the `CreateSession` request. You can't override the values of the encryption
    # settings (`x-amz-server-side-encryption`, `x-amz-server-side-encryption-aws-kms-key-id`,
    # `x-amz-server-side-encryption-context`, and `x-amz-server-side-encryption-bucket-key-enabled`)
    # that are specified in the `CreateSession` request. You don't need to explicitly specify these
    # encryption settings values in Zonal endpoint API calls, and Amazon S3 will use the encryption
    # settings values from the `CreateSession` request to protect new objects in the directory bucket.
    #
    # When you use the CLI or the Amazon Web Services SDKs, for `CreateSession`, the session token
    # refreshes automatically to avoid service interruptions when a session expires. The CLI or the
    # Amazon Web Services SDKs use the bucket's default encryption configuration for the
    # `CreateSession` request. It's not supported to override the encryption settings values in the
    # `CreateSession` request. So in the Zonal endpoint API calls (except
    # [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html) and
    # [UploadPartCopy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html)), the
    # encryption request headers must match the default encryption configuration of the directory
    # bucket.
    #
    # - **S3 access points for Amazon FSx ** - When accessing data stored in Amazon FSx file systems
    # using S3 access points, the only valid server side encryption option is `aws:fsx`. All Amazon
    # FSx file systems have encryption configured by default and are encrypted at rest. Data is
    # automatically encrypted before being written to the file system, and automatically decrypted as
    # it is read. These processes are handled transparently by Amazon FSx.
    property server_side_encryption : ServerSideEncryption | Nil

    # By default, Amazon S3 uses the STANDARD Storage Class to store newly created objects. The
    # STANDARD storage class provides high durability and high availability. Depending on performance
    # needs, you can specify a different Storage Class. For more information, see [Storage
    # Classes](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html) in the
    # *Amazon S3 User Guide*.
    #
    # - Directory buckets only support `EXPRESS_ONEZONE` (the S3 Express One Zone storage class) in
    # Availability Zones and `ONEZONE_IA` (the S3 One Zone-Infrequent Access storage class) in
    # Dedicated Local Zones.
    #
    # - Amazon S3 on Outposts only uses the OUTPOSTS Storage Class.
    property storage_class : StorageClass | Nil

    # If the bucket is configured as a website, redirects requests for this object to another object
    # in the same bucket or to an external URL. Amazon S3 stores the value of this header in the
    # object metadata.
    #
    # This functionality is not supported for directory buckets.
    property website_redirect_location : String | Nil

    # Specifies the algorithm to use when encrypting the object (for example, AES256).
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_algorithm : String | Nil

    # Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This
    # value is used to store the object and then it is discarded; Amazon S3 does not store the
    # encryption key. The key must be appropriate for use with the algorithm specified in the
    # `x-amz-server-side-encryption-customer-algorithm` header.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_key : String | Nil

    # Specifies the 128-bit MD5 digest of the customer-provided encryption key according to RFC 1321.
    # Amazon S3 uses this header for a message integrity check to ensure that the encryption key was
    # transmitted without error.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_key_md5 : String | Nil

    # Specifies the KMS key ID (Key ID, Key ARN, or Key Alias) to use for object encryption. If the
    # KMS key doesn't exist in the same account that's issuing the command, you must use the full Key
    # ARN not the Key ID.
    #
    # **General purpose buckets** - If you specify `x-amz-server-side-encryption` with `aws:kms` or
    # `aws:kms:dsse`, this header specifies the ID (Key ID, Key ARN, or Key Alias) of the KMS key to
    # use. If you specify `x-amz-server-side-encryption:aws:kms` or
    # `x-amz-server-side-encryption:aws:kms:dsse`, but do not provide
    # `x-amz-server-side-encryption-aws-kms-key-id`, Amazon S3 uses the Amazon Web Services managed
    # key (`aws/s3`) to protect the data.
    #
    # **Directory buckets** - To encrypt data using SSE-KMS, it's recommended to specify the
    # `x-amz-server-side-encryption` header to `aws:kms`. Then, the
    # `x-amz-server-side-encryption-aws-kms-key-id` header implicitly uses the bucket's default KMS
    # customer managed key ID. If you want to explicitly set the `
    # x-amz-server-side-encryption-aws-kms-key-id` header, it must match the bucket's default customer
    # managed key (using key ID or ARN, not alias). Your SSE-KMS configuration can only support 1
    # [customer managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk) per
    # directory bucket's lifetime. The [Amazon Web Services managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk)
    # (`aws/s3`) isn't supported. Incorrect key specification results in an HTTP `400 Bad Request`
    # error.
    property ssekms_key_id : String | Nil

    # Specifies the Amazon Web Services KMS Encryption Context to use for object encryption. The value
    # of this header is a Base64 encoded string of a UTF-8 encoded JSON, which contains the encryption
    # context as key-value pairs.
    #
    # **Directory buckets** - You can optionally provide an explicit encryption context value. The
    # value must match the default encryption context - the bucket Amazon Resource Name (ARN). An
    # additional encryption context value is not supported.
    property ssekms_encryption_context : String | Nil

    # Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with server-side
    # encryption using Key Management Service (KMS) keys (SSE-KMS).
    #
    # **General purpose buckets** - Setting this header to `true` causes Amazon S3 to use an S3 Bucket
    # Key for object encryption with SSE-KMS. Also, specifying this header with a PUT action doesn't
    # affect bucket-level settings for S3 Bucket Key.
    #
    # **Directory buckets** - S3 Bucket Keys are always enabled for `GET` and `PUT` operations in a
    # directory bucket and can’t be disabled. S3 Bucket Keys aren't supported, when you copy SSE-KMS
    # encrypted objects from general purpose buckets to directory buckets, from directory buckets to
    # general purpose buckets, or between directory buckets, through
    # [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html),
    # [UploadPartCopy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html), [the
    # Copy operation in Batch
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-objects-Batch-Ops),
    # or [the import jobs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-import-job).
    # In this case, Amazon S3 makes a call to KMS every time a copy request is made for a
    # KMS-encrypted object.
    property bucket_key_enabled : Bool | Nil

    property request_payer : RequestPayer | Nil

    # The tag-set for the object. The tag-set must be encoded as URL Query parameters.
    #
    # This functionality is not supported for directory buckets.
    property tagging : String | Nil

    # Specifies the Object Lock mode that you want to apply to the uploaded object.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_mode : ObjectLockMode | Nil

    # Specifies the date and time when you want the Object Lock to expire.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_retain_until_date : Time | Nil

    # Specifies whether you want to apply a legal hold to the uploaded object.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_legal_hold_status : ObjectLockLegalHoldStatus | Nil

    # Specifies the event hold status to apply to the uploaded object. Set to `ON` to enable or `OFF`
    # to disable.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_event_hold : ObjectLockEventHold | Nil

    # Specifies the event hold duration in days to apply to the uploaded object.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_event_hold_duration_days : Int32 | Nil

    # Specifies the event hold duration in years to apply to the uploaded object.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_event_hold_duration_years : Int32 | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    # Indicates the algorithm that you want Amazon S3 to use to create the checksum for the object.
    # For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # Indicates the checksum type that you want Amazon S3 to use to calculate the object’s checksum
    # value. For more information, see [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_type : ChecksumType | Nil

    def initialize(
      @bucket : String,
      @key : String,
      @acl : ObjectCannedACL | Nil = nil,
      @cache_control : String | Nil = nil,
      @content_disposition : String | Nil = nil,
      @content_encoding : String | Nil = nil,
      @content_language : String | Nil = nil,
      @content_type : String | Nil = nil,
      @expires : String | Nil = nil,
      @grant_full_control : String | Nil = nil,
      @grant_read : String | Nil = nil,
      @grant_read_acp : String | Nil = nil,
      @grant_write_acp : String | Nil = nil,
      @metadata : Hash(String, String) | Nil = nil,
      @server_side_encryption : ServerSideEncryption | Nil = nil,
      @storage_class : StorageClass | Nil = nil,
      @website_redirect_location : String | Nil = nil,
      @sse_customer_algorithm : String | Nil = nil,
      @sse_customer_key : String | Nil = nil,
      @sse_customer_key_md5 : String | Nil = nil,
      @ssekms_key_id : String | Nil = nil,
      @ssekms_encryption_context : String | Nil = nil,
      @bucket_key_enabled : Bool | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
      @tagging : String | Nil = nil,
      @object_lock_mode : ObjectLockMode | Nil = nil,
      @object_lock_retain_until_date : Time | Nil = nil,
      @object_lock_legal_hold_status : ObjectLockLegalHoldStatus | Nil = nil,
      @object_lock_event_hold : ObjectLockEventHold | Nil = nil,
      @object_lock_event_hold_duration_days : Int32 | Nil = nil,
      @object_lock_event_hold_duration_years : Int32 | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
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

    def_equals_and_hash(@acl, @bucket, @cache_control, @content_disposition, @content_encoding, @content_language, @content_type, @expires, @grant_full_control, @grant_read, @grant_read_acp, @grant_write_acp, @key, @metadata, @server_side_encryption, @storage_class, @website_redirect_location, @sse_customer_algorithm, @sse_customer_key, @sse_customer_key_md5, @ssekms_key_id, @ssekms_encryption_context, @bucket_key_enabled, @request_payer, @tagging, @object_lock_mode, @object_lock_retain_until_date, @object_lock_legal_hold_status, @object_lock_event_hold, @object_lock_event_hold_duration_days, @object_lock_event_hold_duration_years, @expected_bucket_owner, @checksum_algorithm, @checksum_type)
  end
end
