private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class PutObjectRequest
    # The canned ACL to apply to the object. For more information, see [Canned
    # ACL](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL) in the *Amazon
    # S3 User Guide*.
    #
    # When adding a new object, you can use headers to grant ACL-based permissions to individual
    # Amazon Web Services accounts or to predefined groups defined by Amazon S3. These permissions are
    # then added to the ACL on the object. By default, all objects are private. Only the owner has
    # full access control. For more information, see [Access Control List (ACL)
    # Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html) and [Managing ACLs
    # Using the REST API](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-using-rest-api.html) in
    # the *Amazon S3 User Guide*.
    #
    # If the bucket that you're uploading objects to uses the bucket owner enforced setting for S3
    # Object Ownership, ACLs are disabled and no longer affect permissions. Buckets that use this
    # setting only accept PUT requests that don't specify an ACL or PUT requests that specify bucket
    # owner full control ACLs, such as the `bucket-owner-full-control` canned ACL or an equivalent
    # form of this ACL expressed in the XML format. PUT requests that contain other ACLs (for example,
    # custom grants to certain Amazon Web Services accounts) fail and return a `400` error with the
    # error code `AccessControlListNotSupported`. For more information, see [ Controlling ownership of
    # objects and disabling
    # ACLs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html) in the
    # *Amazon S3 User Guide*.
    #
    # - This functionality is not supported for directory buckets.
    #
    # - This functionality is not supported for Amazon S3 on Outposts.
    property acl : ObjectCannedACL | Nil

    # Object data.
    property body : String | Nil

    # The bucket name to which the PUT action was initiated.
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

    # Can be used to specify caching behavior along the request/reply chain. For more information, see
    # [http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9).
    property cache_control : String | Nil

    # Specifies presentational information for the object. For more information, see
    # [https://www.rfc-editor.org/rfc/rfc6266#section-4](https://www.rfc-editor.org/rfc/rfc6266#section-4).
    property content_disposition : String | Nil

    # Specifies what content encodings have been applied to the object and thus what decoding
    # mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.
    # For more information, see
    # [https://www.rfc-editor.org/rfc/rfc9110.html#field.content-encoding](https://www.rfc-editor.org/rfc/rfc9110.html#field.content-encoding).
    property content_encoding : String | Nil

    # The language the content is in.
    property content_language : String | Nil

    # Size of the body in bytes. This parameter is useful when the size of the body cannot be
    # determined automatically. For more information, see
    # [https://www.rfc-editor.org/rfc/rfc9110.html#name-content-length](https://www.rfc-editor.org/rfc/rfc9110.html#name-content-length).
    property content_length : Int64 | Nil

    # The Base64 encoded 128-bit `MD5` digest of the message (without the headers) according to RFC
    # 1864. This header can be used as a message integrity check to verify that the data is the same
    # data that was originally sent. Although it is optional, we recommend using the Content-MD5
    # mechanism as an end-to-end integrity check. For more information about REST request
    # authentication, see [REST
    # Authentication](https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html).
    #
    # The `Content-MD5` or `x-amz-sdk-checksum-algorithm` header is required for any request to upload
    # an object with a retention period configured using Amazon S3 Object Lock. For more information,
    # see [Uploading objects to an Object Lock enabled bucket
    # ](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock-managing.html#object-lock-put-object)
    # in the *Amazon S3 User Guide*.
    #
    # This functionality is not supported for directory buckets.
    property content_md5 : String | Nil

    # A standard MIME type describing the format of the contents. For more information, see
    # [https://www.rfc-editor.org/rfc/rfc9110.html#name-content-type](https://www.rfc-editor.org/rfc/rfc9110.html#name-content-type).
    property content_type : String | Nil

    # Indicates the algorithm used to create the checksum for the object when you use the SDK. This
    # header will not provide any additional functionality if you don't use the SDK. When you send
    # this header, there must be a corresponding `x-amz-checksum-*algorithm* ` or `x-amz-trailer`
    # header sent. Otherwise, Amazon S3 fails the request with the HTTP status code `400 Bad Request`.
    #
    # For the `x-amz-checksum-*algorithm* ` header, replace ` *algorithm* ` with the supported
    # algorithm from the following list:
    #
    # - `CRC32`
    #
    # - `CRC32C`
    #
    # - `CRC64NVME`
    #
    # - `MD5`
    #
    # - `SHA1`
    #
    # - `SHA256`
    #
    # - `SHA512`
    #
    # - `XXHASH3`
    #
    # - `XXHASH64`
    #
    # - `XXHASH128`
    #
    # For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    #
    # If the individual checksum value you provide through `x-amz-checksum-*algorithm* ` doesn't match
    # the checksum algorithm you set through `x-amz-sdk-checksum-algorithm`, Amazon S3 fails the
    # request with a `BadDigest` error.
    #
    # The `Content-MD5` or `x-amz-sdk-checksum-algorithm` header is required for any request to upload
    # an object with a retention period configured using Amazon S3 Object Lock. For more information,
    # see [Uploading objects to an Object Lock enabled bucket
    # ](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock-managing.html#object-lock-put-object)
    # in the *Amazon S3 User Guide*.
    #
    # For directory buckets, when you use Amazon Web Services SDKs, `CRC32` is the default checksum
    # algorithm that's used for performance.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 32-bit `CRC32` checksum
    # of the object. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 32-bit `CRC32C`
    # checksum of the object. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32c : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 64-bit `CRC64NVME`
    # checksum of the object. The `CRC64NVME` checksum is always a full object checksum. For more
    # information, see [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_crc64nvme : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 160-bit `SHA1` digest
    # of the object. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_sha1 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 256-bit `SHA256` digest
    # of the object. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_sha256 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 512-bit `SHA512` digest
    # of the object. For more information, see [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_sha512 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 128-bit `MD5` digest of
    # the object. For more information, see [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_md5 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 64-bit `XXHASH64`
    # checksum of the object. For more information, see [Checking object integrity in the Amazon S3
    # User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash64 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 64-bit `XXHASH3`
    # checksum of the object. For more information, see [Checking object integrity in the Amazon S3
    # User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash3 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 128-bit `XXHASH128`
    # checksum of the object. For more information, see [Checking object integrity in the Amazon S3
    # User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash128 : String | Nil

    # The date and time at which the object is no longer cacheable. For more information, see
    # [https://www.rfc-editor.org/rfc/rfc7234#section-5.3](https://www.rfc-editor.org/rfc/rfc7234#section-5.3).
    property expires : String | Nil

    # Uploads the object only if the ETag (entity tag) value provided during the WRITE operation
    # matches the ETag of the object in S3. If the ETag values do not match, the operation returns a
    # `412 Precondition Failed` error.
    #
    # If a conflicting operation occurs during the upload S3 returns a `409
    # ConditionalRequestConflict` response. On a 409 failure you should fetch the object's ETag and
    # retry the upload.
    #
    # Expects the ETag value as a string.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232), or [Conditional
    # requests](https://docs.aws.amazon.com/AmazonS3/latest/userguide/conditional-requests.html) in
    # the *Amazon S3 User Guide*.
    property if_match : String | Nil

    # Uploads the object only if the object key name does not already exist in the bucket specified.
    # Otherwise, Amazon S3 returns a `412 Precondition Failed` error.
    #
    # If a conflicting operation occurs during the upload S3 returns a `409
    # ConditionalRequestConflict` response. On a 409 failure you should retry the upload.
    #
    # Expects the '*' (asterisk) character.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232), or [Conditional
    # requests](https://docs.aws.amazon.com/AmazonS3/latest/userguide/conditional-requests.html) in
    # the *Amazon S3 User Guide*.
    property if_none_match : String | Nil

    # Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.
    #
    # - This functionality is not supported for directory buckets.
    #
    # - This functionality is not supported for Amazon S3 on Outposts.
    property grant_full_control : String | Nil

    # Allows grantee to read the object data and its metadata.
    #
    # - This functionality is not supported for directory buckets.
    #
    # - This functionality is not supported for Amazon S3 on Outposts.
    property grant_read : String | Nil

    # Allows grantee to read the object ACL.
    #
    # - This functionality is not supported for directory buckets.
    #
    # - This functionality is not supported for Amazon S3 on Outposts.
    property grant_read_acp : String | Nil

    # Allows grantee to write the ACL for the applicable object.
    #
    # - This functionality is not supported for directory buckets.
    #
    # - This functionality is not supported for Amazon S3 on Outposts.
    property grant_write_acp : String | Nil

    # Object key for which the PUT action was initiated.
    property key : String = ""

    # Specifies the offset for appending data to existing objects in bytes. The offset must be equal
    # to the size of the existing object being appended to. If no object exists, setting this header
    # to 0 will create a new object.
    #
    # This functionality is only supported for objects in the Amazon S3 Express One Zone storage class
    # in directory buckets.
    property write_offset_bytes : Int64 | Nil

    # A map of metadata to store with the object in S3.
    property metadata : Hash(String, String) | Nil

    # The server-side encryption algorithm that was used when you store this object in Amazon S3 or
    # Amazon FSx.
    #
    # - **General purpose buckets ** - You have four mutually exclusive options to protect data using
    # server-side encryption in Amazon S3, depending on how you choose to manage the encryption keys.
    # Specifically, the encryption key options are Amazon S3 managed keys (SSE-S3), Amazon Web
    # Services KMS keys (SSE-KMS or DSSE-KMS), and customer-provided keys (SSE-C). Amazon S3 encrypts
    # data with server-side encryption by using Amazon S3 managed keys (SSE-S3) by default. You can
    # optionally tell Amazon S3 to encrypt data at rest by using server-side encryption with other key
    # options. For more information, see [Using Server-Side
    # Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html) in
    # the *Amazon S3 User Guide*.
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
    # object metadata. For information about object metadata, see [Object Key and
    # Metadata](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html) in the *Amazon S3
    # User Guide*.
    #
    # In the following example, the request header sets the redirect to an object (anotherPage.html)
    # in the same bucket:
    #
    # `x-amz-website-redirect-location: /anotherPage.html`
    #
    # In the following example, the request header sets the object redirect to another website:
    #
    # `x-amz-website-redirect-location: http://www.example.com/`
    #
    # For more information about website hosting in Amazon S3, see [Hosting Websites on Amazon
    # S3](https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html) and [How to Configure
    # Website Page
    # Redirects](https://docs.aws.amazon.com/AmazonS3/latest/dev/how-to-page-redirect.html) in the
    # *Amazon S3 User Guide*.
    #
    # This functionality is not supported for directory buckets.
    property website_redirect_location : String | Nil

    # Specifies the algorithm to use when encrypting the object (for example, `AES256`).
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

    # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.
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

    # Specifies the Amazon Web Services KMS Encryption Context as an additional encryption context to
    # use for object encryption. The value of this header is a Base64 encoded string of a UTF-8
    # encoded JSON, which contains the encryption context as key-value pairs. This value is stored as
    # object metadata and automatically gets passed on to Amazon Web Services KMS for future
    # `GetObject` operations on this object.
    #
    # **General purpose buckets** - This value must be explicitly added during `CopyObject` operations
    # if you want an additional encryption context for your object. For more information, see
    # [Encryption
    # context](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingKMSEncryption.html#encryption-context)
    # in the *Amazon S3 User Guide*.
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

    # The tag-set for the object. The tag-set must be encoded as URL Query parameters. (For example,
    # "Key1=Value1")
    #
    # This functionality is not supported for directory buckets.
    property tagging : String | Nil

    # The Object Lock mode that you want to apply to this object.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_mode : ObjectLockMode | Nil

    # The date and time when you want this object's Object Lock to expire. Must be formatted as a
    # timestamp parameter.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_retain_until_date : Time | Nil

    # Specifies whether a legal hold will be applied to this object. For more information about S3
    # Object Lock, see [Object Lock](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html)
    # in the *Amazon S3 User Guide*.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_legal_hold_status : ObjectLockLegalHoldStatus | Nil

    # Specifies the event hold status to apply to this object. Set to `ON` to enable or `OFF` to
    # disable.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_event_hold : ObjectLockEventHold | Nil

    # Specifies the event hold duration in days to apply to this object.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_event_hold_duration_days : Int32 | Nil

    # Specifies the event hold duration in years to apply to this object.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_event_hold_duration_years : Int32 | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @key : String,
      @acl : ObjectCannedACL | Nil = nil,
      @body : String | Nil = nil,
      @cache_control : String | Nil = nil,
      @content_disposition : String | Nil = nil,
      @content_encoding : String | Nil = nil,
      @content_language : String | Nil = nil,
      @content_length : Int64 | Nil = nil,
      @content_md5 : String | Nil = nil,
      @content_type : String | Nil = nil,
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
      @expires : String | Nil = nil,
      @if_match : String | Nil = nil,
      @if_none_match : String | Nil = nil,
      @grant_full_control : String | Nil = nil,
      @grant_read : String | Nil = nil,
      @grant_read_acp : String | Nil = nil,
      @grant_write_acp : String | Nil = nil,
      @write_offset_bytes : Int64 | Nil = nil,
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

    def_equals_and_hash(@acl, @body, @bucket, @cache_control, @content_disposition, @content_encoding, @content_language, @content_length, @content_md5, @content_type, @checksum_algorithm, @checksum_crc32, @checksum_crc32c, @checksum_crc64nvme, @checksum_sha1, @checksum_sha256, @checksum_sha512, @checksum_md5, @checksum_xxhash64, @checksum_xxhash3, @checksum_xxhash128, @expires, @if_match, @if_none_match, @grant_full_control, @grant_read, @grant_read_acp, @grant_write_acp, @key, @write_offset_bytes, @metadata, @server_side_encryption, @storage_class, @website_redirect_location, @sse_customer_algorithm, @sse_customer_key, @sse_customer_key_md5, @ssekms_key_id, @ssekms_encryption_context, @bucket_key_enabled, @request_payer, @tagging, @object_lock_mode, @object_lock_retain_until_date, @object_lock_legal_hold_status, @object_lock_event_hold, @object_lock_event_hold_duration_days, @object_lock_event_hold_duration_years, @expected_bucket_owner)
  end
end
