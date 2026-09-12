private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class CopyObjectRequest
    # The canned access control list (ACL) to apply to the object.
    #
    # When you copy an object, the ACL metadata is not preserved and is set to `private` by default.
    # Only the owner has full access control. To override the default ACL setting, specify a new ACL
    # when you generate a copy request. For more information, see [Using
    # ACLs](https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html).
    #
    # If the destination bucket that you're copying objects to uses the bucket owner enforced setting
    # for S3 Object Ownership, ACLs are disabled and no longer affect permissions. Buckets that use
    # this setting only accept `PUT` requests that don't specify an ACL or `PUT` requests that specify
    # bucket owner full control ACLs, such as the `bucket-owner-full-control` canned ACL or an
    # equivalent form of this ACL expressed in the XML format. For more information, see [Controlling
    # ownership of objects and disabling
    # ACLs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html) in the
    # *Amazon S3 User Guide*.
    #
    # - If your destination bucket uses the bucket owner enforced setting for Object Ownership, all
    # objects written to the bucket by any account will be owned by the bucket owner.
    #
    # - This functionality is not supported for directory buckets.
    #
    # - This functionality is not supported for Amazon S3 on Outposts.
    property acl : ObjectCannedACL | Nil

    # The name of the destination bucket.
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
    # Copying objects across different Amazon Web Services Regions isn't supported when the source or
    # destination bucket is in Amazon Web Services Local Zones. The source and destination buckets
    # must have the same parent Amazon Web Services Region. Otherwise, you get an HTTP `400 Bad
    # Request` error with the error code `InvalidRequest`.
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
    # **S3 on Outposts** - When you use this action with S3 on Outposts, you must use the Outpost
    # bucket access point ARN or the access point alias for the destination bucket. You can only copy
    # objects within the same Outpost bucket. It's not supported to copy objects across different
    # Amazon Web Services Outposts, between buckets on the same Outposts, or between Outposts buckets
    # and any other bucket types. For more information about S3 on Outposts, see [What is S3 on
    # Outposts?](https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html) in the *S3
    # on Outposts guide*. When you use this action with S3 on Outposts through the REST API, you must
    # direct requests to the S3 on Outposts hostname, in the format `
    # *AccessPointName*-*AccountId*.*outpostID*.s3-outposts.*Region*.amazonaws.com`. The hostname
    # isn't required when you use the Amazon Web Services CLI or SDKs.
    property bucket : String = ""

    # Specifies the caching behavior along the request/reply chain.
    property cache_control : String | Nil

    # Indicates the algorithm that you want Amazon S3 to use to create the checksum for the object.
    # For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    #
    # When you copy an object, if the source object has a checksum, that checksum value will be copied
    # to the new object by default. If the `CopyObject` request does not include this
    # `x-amz-checksum-algorithm` header, the checksum algorithm will be copied from the source object
    # to the destination object (if it's present on the source object). You can optionally specify a
    # different checksum algorithm to use with the `x-amz-checksum-algorithm` header. Unrecognized or
    # unsupported values will respond with the HTTP status code `400 Bad Request`.
    #
    # For directory buckets, when you use Amazon Web Services SDKs, `CRC32` is the default checksum
    # algorithm that's used for performance.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # Specifies presentational information for the object. Indicates whether an object should be
    # displayed in a web browser or downloaded as a file. It allows specifying the desired filename
    # for the downloaded file.
    property content_disposition : String | Nil

    # Specifies what content encodings have been applied to the object and thus what decoding
    # mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.
    #
    # For directory buckets, only the `aws-chunked` value is supported in this header field.
    property content_encoding : String | Nil

    # The language the content is in.
    property content_language : String | Nil

    # A standard MIME type that describes the format of the object data.
    property content_type : String | Nil

    # Specifies the source object for the copy operation. The source object can be up to 5 GB. If the
    # source object is an object that was uploaded by using a multipart upload, the object copy will
    # be a single part object after the source object is copied to the destination bucket.
    #
    # You specify the value of the copy source in one of two formats, depending on whether you want to
    # access the source object through an [access
    # point](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points.html):
    #
    # - For objects not accessed through an access point, specify the name of the source bucket and
    # the key of the source object, separated by a slash (/). For example, to copy the object
    # `reports/january.pdf` from the general purpose bucket `awsexamplebucket`, use
    # `awsexamplebucket/reports/january.pdf`. The value must be URL-encoded. To copy the object
    # `reports/january.pdf` from the directory bucket `awsexamplebucket--use1-az5--x-s3`, use
    # `awsexamplebucket--use1-az5--x-s3/reports/january.pdf`. The value must be URL-encoded.
    #
    # - For objects accessed through access points, specify the Amazon Resource Name (ARN) of the
    # object as accessed through the access point, in the format `arn:aws:s3:::accesspoint//object/`.
    # For example, to copy the object `reports/january.pdf` through access point `my-access-point`
    # owned by account `123456789012` in Region `us-west-2`, use the URL encoding of
    # `arn:aws:s3:us-west-2:123456789012:accesspoint/my-access-point/object/reports/january.pdf`. The
    # value must be URL encoded.
    #
    # - Amazon S3 supports copy operations using Access points only when the source and destination
    # buckets are in the same Amazon Web Services Region.
    #
    # - Access points are not supported by directory buckets.
    #
    # Alternatively, for objects accessed through Amazon S3 on Outposts, specify the ARN of the object
    # as accessed in the format `arn:aws:s3-outposts:::outpost//object/`. For example, to copy the
    # object `reports/january.pdf` through outpost `my-outpost` owned by account `123456789012` in
    # Region `us-west-2`, use the URL encoding of
    # `arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/object/reports/january.pdf`. The
    # value must be URL-encoded.
    #
    # If your source bucket versioning is enabled, the `x-amz-copy-source` header by default
    # identifies the current version of an object to copy. If the current version is a delete marker,
    # Amazon S3 behaves as if the object was deleted. To copy a different version, use the `versionId`
    # query parameter. Specifically, append `?versionId=` to the value (for example,
    # `awsexamplebucket/reports/january.pdf?versionId=QUpfdndhfd8438MNFDN93jdnJFkdmqnh893`). If you
    # don't specify a version ID, Amazon S3 copies the latest version of the source object.
    #
    # If you enable versioning on the destination bucket, Amazon S3 generates a unique version ID for
    # the copied object. This version ID is different from the version ID of the source object. Amazon
    # S3 returns the version ID of the copied object in the `x-amz-version-id` response header in the
    # response.
    #
    # If you do not enable versioning or suspend it on the destination bucket, the version ID that
    # Amazon S3 generates in the `x-amz-version-id` response header is always null.
    #
    # **Directory buckets** - S3 Versioning isn't enabled and supported for directory buckets.
    property copy_source : String = ""

    # Copies the object if its entity tag (ETag) matches the specified tag.
    #
    # If both the `x-amz-copy-source-if-match` and `x-amz-copy-source-if-unmodified-since` headers are
    # present in the request and evaluate as follows, Amazon S3 returns `200 OK` and copies the data:
    #
    # - `x-amz-copy-source-if-match` condition evaluates to true
    #
    # - `x-amz-copy-source-if-unmodified-since` condition evaluates to false
    property copy_source_if_match : String | Nil

    # Copies the object if it has been modified since the specified time.
    #
    # If both the `x-amz-copy-source-if-none-match` and `x-amz-copy-source-if-modified-since` headers
    # are present in the request and evaluate as follows, Amazon S3 returns the `412 Precondition
    # Failed` response code:
    #
    # - `x-amz-copy-source-if-none-match` condition evaluates to false
    #
    # - `x-amz-copy-source-if-modified-since` condition evaluates to true
    property copy_source_if_modified_since : Time | Nil

    # Copies the object if its entity tag (ETag) is different than the specified ETag.
    #
    # If both the `x-amz-copy-source-if-none-match` and `x-amz-copy-source-if-modified-since` headers
    # are present in the request and evaluate as follows, Amazon S3 returns the `412 Precondition
    # Failed` response code:
    #
    # - `x-amz-copy-source-if-none-match` condition evaluates to false
    #
    # - `x-amz-copy-source-if-modified-since` condition evaluates to true
    property copy_source_if_none_match : String | Nil

    # Copies the object if it hasn't been modified since the specified time.
    #
    # If both the `x-amz-copy-source-if-match` and `x-amz-copy-source-if-unmodified-since` headers are
    # present in the request and evaluate as follows, Amazon S3 returns `200 OK` and copies the data:
    #
    # - `x-amz-copy-source-if-match` condition evaluates to true
    #
    # - `x-amz-copy-source-if-unmodified-since` condition evaluates to false
    property copy_source_if_unmodified_since : Time | Nil

    # The date and time at which the object is no longer cacheable.
    property expires : String | Nil

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

    # Copies the object if the entity tag (ETag) of the destination object matches the specified tag.
    # If the ETag values do not match, the operation returns a `412 Precondition Failed` error. If a
    # concurrent operation occurs during the upload S3 returns a `409 ConditionalRequestConflict`
    # response. On a 409 failure you should fetch the object's ETag and retry the upload.
    #
    # Expects the ETag value as a string.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232).
    property if_match : String | Nil

    # Copies the object only if the object key name at the destination does not already exist in the
    # bucket specified. Otherwise, Amazon S3 returns a `412 Precondition Failed` error. If a
    # concurrent operation occurs during the upload S3 returns a `409 ConditionalRequestConflict`
    # response. On a 409 failure you should retry the upload.
    #
    # Expects the '*' (asterisk) character.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232).
    property if_none_match : String | Nil

    # The key of the destination object.
    property key : String = ""

    # A map of metadata to store with the object in S3.
    property metadata : Hash(String, String) | Nil

    # Specifies whether the metadata is copied from the source object or replaced with metadata that's
    # provided in the request. When copying an object, you can preserve all metadata (the default) or
    # specify new metadata. If this header isn’t specified, `COPY` is the default behavior.
    #
    # **General purpose bucket** - For general purpose buckets, when you grant permissions, you can
    # use the `s3:x-amz-metadata-directive` condition key to enforce certain metadata behavior when
    # objects are uploaded. For more information, see [Amazon S3 condition key
    # examples](https://docs.aws.amazon.com/AmazonS3/latest/dev/amazon-s3-policy-keys.html) in the
    # *Amazon S3 User Guide*.
    #
    # `x-amz-website-redirect-location` is unique to each object and is not copied when using the
    # `x-amz-metadata-directive` header. To copy the value, you must specify
    # `x-amz-website-redirect-location` in the request header.
    property metadata_directive : MetadataDirective | Nil

    # Specifies whether the object tag-set is copied from the source object or replaced with the
    # tag-set that's provided in the request.
    #
    # The default value is `COPY`.
    #
    # **Directory buckets** - For directory buckets in a `CopyObject` operation, only the empty
    # tag-set is supported. Any requests that attempt to write non-empty tags into directory buckets
    # will receive a `501 Not Implemented` status code. When the destination bucket is a directory
    # bucket, you will receive a `501 Not Implemented` response in any of the following situations:
    #
    # - When you attempt to `COPY` the tag-set from an S3 source object that has non-empty tags.
    #
    # - When you attempt to `REPLACE` the tag-set of a source object and set a non-empty value to
    # `x-amz-tagging`.
    #
    # - When you don't set the `x-amz-tagging-directive` header and the source object has non-empty
    # tags. This is because the default value of `x-amz-tagging-directive` is `COPY`.
    #
    # Because only the empty tag-set is supported for directory buckets in a `CopyObject` operation,
    # the following situations are allowed:
    #
    # - When you attempt to `COPY` the tag-set from a directory bucket source object that has no tags
    # to a general purpose bucket. It copies an empty tag-set to the destination object.
    #
    # - When you attempt to `REPLACE` the tag-set of a directory bucket source object and set the
    # `x-amz-tagging` value of the directory bucket destination object to empty.
    #
    # - When you attempt to `REPLACE` the tag-set of a general purpose bucket source object that has
    # non-empty tags and set the `x-amz-tagging` value of the directory bucket destination object to
    # empty.
    #
    # - When you attempt to `REPLACE` the tag-set of a directory bucket source object and don't set
    # the `x-amz-tagging` value of the directory bucket destination object. This is because the
    # default value of `x-amz-tagging` is the empty value.
    property tagging_directive : TaggingDirective | Nil

    # Specifies whether you want to copy annotations from the source object or exclude them. If this
    # header isn't specified, `COPY` is the default behavior.
    #
    # Valid Values: `COPY | EXCLUDE`
    #
    # You can specify this directive as either an HTTP header (`x-amz-object-annotation-directive`) or
    # as a query string parameter. Use the query string form when generating presigned URLs that need
    # to control annotation copy behavior.
    #
    # When set to `COPY`, you must have `s3:GetObjectAnnotation` permission on the source object and
    # `s3:PutObjectAnnotation` permission on the destination. Each annotation copied is billed as a
    # separate PUT request. If annotations on the source are modified during the copy, Amazon S3
    # returns a retryable error.
    #
    # For directory buckets, annotations are not supported. Use `EXCLUDE` to copy objects to directory
    # buckets without errors. If you specify `COPY` for a directory bucket, the request returns HTTP
    # 501 (Not Implemented).
    #
    # When you copy objects using multipart upload (for example, when the Amazon Web Services CLI or
    # Amazon Web Services SDKs use Transfer Manager for objects larger than approximately 8 MB),
    # annotations are not copied by default. To include annotations, specify `--copy-props default` in
    # the Amazon Web Services CLI or the equivalent SDK configuration. With this opt-in, the SDK reads
    # source annotations, completes the multipart upload, and then writes each annotation to the
    # destination. Between the upload completion and the last annotation write, the destination object
    # exists without all its annotations.
    property annotation_directive : AnnotationDirective | Nil

    # The server-side encryption algorithm used when storing this object in Amazon S3. Unrecognized or
    # unsupported values won’t write a destination object and will receive a `400 Bad Request`
    # response.
    #
    # Amazon S3 automatically encrypts all new objects that are copied to an S3 bucket. When copying
    # an object, if you don't specify encryption information in your copy request, the encryption
    # setting of the target object is set to the default encryption configuration of the destination
    # bucket. By default, all buckets have a base level of encryption configuration that uses
    # server-side encryption with Amazon S3 managed keys (SSE-S3). If the destination bucket has a
    # different default encryption configuration, Amazon S3 uses the corresponding encryption key to
    # encrypt the target object copy.
    #
    # With server-side encryption, Amazon S3 encrypts your data as it writes your data to disks in its
    # data centers and decrypts the data when you access it. For more information about server-side
    # encryption, see [Using Server-Side
    # Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html) in the
    # *Amazon S3 User Guide*.
    #
    # **General purpose buckets **
    #
    # - For general purpose buckets, there are the following supported options for server-side
    # encryption: server-side encryption with Key Management Service (KMS) keys (SSE-KMS), dual-layer
    # server-side encryption with Amazon Web Services KMS keys (DSSE-KMS), and server-side encryption
    # with customer-provided encryption keys (SSE-C). Amazon S3 uses the corresponding KMS key, or a
    # customer-provided key to encrypt the target object copy.
    #
    # - When you perform a `CopyObject` operation, if you want to use a different type of encryption
    # setting for the target object, you can specify appropriate encryption-related headers to encrypt
    # the target object with an Amazon S3 managed key, a KMS key, or a customer-provided key. If the
    # encryption setting in your request is different from the default encryption configuration of the
    # destination bucket, the encryption setting in your request takes precedence.
    #
    # **Directory buckets **
    #
    # - For directory buckets, there are only two supported options for server-side encryption:
    # server-side encryption with Amazon S3 managed keys (SSE-S3) (`AES256`) and server-side
    # encryption with KMS keys (SSE-KMS) (`aws:kms`). We recommend that the bucket's default
    # encryption uses the desired encryption configuration and you don't override the bucket default
    # encryption in your `CreateSession` requests or `PUT` object requests. Then, new objects are
    # automatically encrypted with the desired encryption settings. For more information, see
    # [Protecting data with server-side
    # encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-serv-side-encryption.html)
    # in the *Amazon S3 User Guide*. For more information about the encryption overriding behaviors in
    # directory buckets, see [Specifying server-side encryption with KMS for new object
    # uploads](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-specifying-kms-encryption.html).
    #
    # - To encrypt new object copies to a directory bucket with SSE-KMS, we recommend you specify
    # SSE-KMS as the directory bucket's default encryption configuration with a KMS key (specifically,
    # a [customer managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk)). The
    # [Amazon Web Services managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk)
    # (`aws/s3`) isn't supported. Your SSE-KMS configuration can only support 1 [customer managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk) per
    # directory bucket for the lifetime of the bucket. After you specify a customer managed key for
    # SSE-KMS, you can't override the customer managed key for the bucket's SSE-KMS configuration.
    # Then, when you perform a `CopyObject` operation and want to specify server-side encryption
    # settings for new object copies with SSE-KMS in the encryption-related request headers, you must
    # ensure the encryption key is the same customer managed key that you specified for the directory
    # bucket's default encryption configuration.
    #
    # - **S3 access points for Amazon FSx ** - When accessing data stored in Amazon FSx file systems
    # using S3 access points, the only valid server side encryption option is `aws:fsx`. All Amazon
    # FSx file systems have encryption configured by default and are encrypted at rest. Data is
    # automatically encrypted before being written to the file system, and automatically decrypted as
    # it is read. These processes are handled transparently by Amazon FSx.
    property server_side_encryption : ServerSideEncryption | Nil

    # If the `x-amz-storage-class` header is not used, the copied object will be stored in the
    # `STANDARD` Storage Class by default. The `STANDARD` storage class provides high durability and
    # high availability. Depending on performance needs, you can specify a different Storage Class.
    #
    # - **Directory buckets ** - Directory buckets only support `EXPRESS_ONEZONE` (the S3 Express One
    # Zone storage class) in Availability Zones and `ONEZONE_IA` (the S3 One Zone-Infrequent Access
    # storage class) in Dedicated Local Zones. Unsupported storage class values won't write a
    # destination object and will respond with the HTTP status code `400 Bad Request`.
    #
    # - **Amazon S3 on Outposts ** - S3 on Outposts only uses the `OUTPOSTS` Storage Class.
    #
    # You can use the `CopyObject` action to change the storage class of an object that is already
    # stored in Amazon S3 by using the `x-amz-storage-class` header. For more information, see
    # [Storage Classes](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html) in
    # the *Amazon S3 User Guide*.
    #
    # Before using an object as a source object for the copy operation, you must restore a copy of it
    # if it meets any of the following conditions:
    #
    # - The storage class of the source object is `GLACIER` or `DEEP_ARCHIVE`.
    #
    # - The storage class of the source object is `INTELLIGENT_TIERING` and it's [S3
    # Intelligent-Tiering access
    # tier](https://docs.aws.amazon.com/AmazonS3/latest/userguide/intelligent-tiering-overview.html#intel-tiering-tier-definition)
    # is `Archive Access` or `Deep Archive Access`.
    #
    # For more information, see
    # [RestoreObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html) and
    # [Copying Objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/CopyingObjectsExamples.html)
    # in the *Amazon S3 User Guide*.
    property storage_class : StorageClass | Nil

    # If the destination bucket is configured as a website, redirects requests for this object copy to
    # another object in the same bucket or to an external URL. Amazon S3 stores the value of this
    # header in the object metadata. This value is unique to each object and is not copied when using
    # the `x-amz-metadata-directive` header. Instead, you may opt to provide this header in
    # combination with the `x-amz-metadata-directive` header.
    #
    # This functionality is not supported for directory buckets.
    property website_redirect_location : String | Nil

    # Specifies the algorithm to use when encrypting the object (for example, `AES256`).
    #
    # When you perform a `CopyObject` operation, if you want to use a different type of encryption
    # setting for the target object, you can specify appropriate encryption-related headers to encrypt
    # the target object with an Amazon S3 managed key, a KMS key, or a customer-provided key. If the
    # encryption setting in your request is different from the default encryption configuration of the
    # destination bucket, the encryption setting in your request takes precedence.
    #
    # This functionality is not supported when the destination bucket is a directory bucket.
    property sse_customer_algorithm : String | Nil

    # Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This
    # value is used to store the object and then it is discarded. Amazon S3 does not store the
    # encryption key. The key must be appropriate for use with the algorithm specified in the
    # `x-amz-server-side-encryption-customer-algorithm` header.
    #
    # This functionality is not supported when the destination bucket is a directory bucket.
    property sse_customer_key : String | Nil

    # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.
    #
    # This functionality is not supported when the destination bucket is a directory bucket.
    property sse_customer_key_md5 : String | Nil

    # Specifies the KMS key ID (Key ID, Key ARN, or Key Alias) to use for object encryption. All GET
    # and PUT requests for an object protected by KMS will fail if they're not made via SSL or using
    # SigV4. For information about configuring any of the officially supported Amazon Web Services
    # SDKs and Amazon Web Services CLI, see [Specifying the Signature Version in Request
    # Authentication](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version)
    # in the *Amazon S3 User Guide*.
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
    # use for the destination object encryption. The value of this header is a base64-encoded UTF-8
    # string holding JSON with the encryption context key-value pairs.
    #
    # **General purpose buckets** - This value must be explicitly added to specify encryption context
    # for `CopyObject` requests if you want an additional encryption context for your destination
    # object. The additional encryption context of the source object won't be copied to the
    # destination object. For more information, see [Encryption
    # context](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingKMSEncryption.html#encryption-context)
    # in the *Amazon S3 User Guide*.
    #
    # **Directory buckets** - You can optionally provide an explicit encryption context value. The
    # value must match the default encryption context - the bucket Amazon Resource Name (ARN). An
    # additional encryption context value is not supported.
    property ssekms_encryption_context : String | Nil

    # Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with server-side
    # encryption using Key Management Service (KMS) keys (SSE-KMS). If a target object uses SSE-KMS,
    # you can enable an S3 Bucket Key for the object.
    #
    # Setting this header to `true` causes Amazon S3 to use an S3 Bucket Key for object encryption
    # with SSE-KMS. Specifying this header with a COPY action doesn’t affect bucket-level settings for
    # S3 Bucket Key.
    #
    # For more information, see [Amazon S3 Bucket
    # Keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html) in the *Amazon S3 User
    # Guide*.
    #
    # **Directory buckets** - S3 Bucket Keys aren't supported, when you copy SSE-KMS encrypted objects
    # from general purpose buckets to directory buckets, from directory buckets to general purpose
    # buckets, or between directory buckets, through
    # [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html). In this case,
    # Amazon S3 makes a call to KMS every time a copy request is made for a KMS-encrypted object.
    property bucket_key_enabled : Bool | Nil

    # Specifies the algorithm to use when decrypting the source object (for example, `AES256`).
    #
    # If the source object for the copy is stored in Amazon S3 using SSE-C, you must provide the
    # necessary encryption information in your request so that Amazon S3 can decrypt the object for
    # copying.
    #
    # This functionality is not supported when the source object is in a directory bucket.
    property copy_source_sse_customer_algorithm : String | Nil

    # Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source
    # object. The encryption key provided in this header must be the same one that was used when the
    # source object was created.
    #
    # If the source object for the copy is stored in Amazon S3 using SSE-C, you must provide the
    # necessary encryption information in your request so that Amazon S3 can decrypt the object for
    # copying.
    #
    # This functionality is not supported when the source object is in a directory bucket.
    property copy_source_sse_customer_key : String | Nil

    # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.
    #
    # If the source object for the copy is stored in Amazon S3 using SSE-C, you must provide the
    # necessary encryption information in your request so that Amazon S3 can decrypt the object for
    # copying.
    #
    # This functionality is not supported when the source object is in a directory bucket.
    property copy_source_sse_customer_key_md5 : String | Nil

    property request_payer : RequestPayer | Nil

    # The tag-set for the object copy in the destination bucket. This value must be used in
    # conjunction with the `x-amz-tagging-directive` if you choose `REPLACE` for the
    # `x-amz-tagging-directive`. If you choose `COPY` for the `x-amz-tagging-directive`, you don't
    # need to set the `x-amz-tagging` header, because the tag-set will be copied from the source
    # object directly. The tag-set must be encoded as URL Query parameters.
    #
    # The default value is the empty value.
    #
    # **Directory buckets** - For directory buckets in a `CopyObject` operation, only the empty
    # tag-set is supported. Any requests that attempt to write non-empty tags into directory buckets
    # will receive a `501 Not Implemented` status code. When the destination bucket is a directory
    # bucket, you will receive a `501 Not Implemented` response in any of the following situations:
    #
    # - When you attempt to `COPY` the tag-set from an S3 source object that has non-empty tags.
    #
    # - When you attempt to `REPLACE` the tag-set of a source object and set a non-empty value to
    # `x-amz-tagging`.
    #
    # - When you don't set the `x-amz-tagging-directive` header and the source object has non-empty
    # tags. This is because the default value of `x-amz-tagging-directive` is `COPY`.
    #
    # Because only the empty tag-set is supported for directory buckets in a `CopyObject` operation,
    # the following situations are allowed:
    #
    # - When you attempt to `COPY` the tag-set from a directory bucket source object that has no tags
    # to a general purpose bucket. It copies an empty tag-set to the destination object.
    #
    # - When you attempt to `REPLACE` the tag-set of a directory bucket source object and set the
    # `x-amz-tagging` value of the directory bucket destination object to empty.
    #
    # - When you attempt to `REPLACE` the tag-set of a general purpose bucket source object that has
    # non-empty tags and set the `x-amz-tagging` value of the directory bucket destination object to
    # empty.
    #
    # - When you attempt to `REPLACE` the tag-set of a directory bucket source object and don't set
    # the `x-amz-tagging` value of the directory bucket destination object. This is because the
    # default value of `x-amz-tagging` is the empty value.
    property tagging : String | Nil

    # The Object Lock mode that you want to apply to the object copy.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_mode : ObjectLockMode | Nil

    # The date and time when you want the Object Lock of the object copy to expire.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_retain_until_date : Time | Nil

    # Specifies whether you want to apply a legal hold to the object copy.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_legal_hold_status : ObjectLockLegalHoldStatus | Nil

    # The event hold status to apply to the object copy. Set to `ON` to enable or `OFF` to disable.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_event_hold : ObjectLockEventHold | Nil

    # The event hold duration in days to apply to the object copy. You cannot specify a duration in
    # both days and years.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_event_hold_duration_days : Int32 | Nil

    # The event hold duration in years to apply to the object copy. You cannot specify a duration in
    # both days and years.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_event_hold_duration_years : Int32 | Nil

    # The account ID of the expected destination bucket owner. If the account ID that you provide does
    # not match the actual owner of the destination bucket, the request fails with the HTTP status
    # code `403 Forbidden` (access denied).
    property expected_bucket_owner : String | Nil

    # The account ID of the expected source bucket owner. If the account ID that you provide does not
    # match the actual owner of the source bucket, the request fails with the HTTP status code `403
    # Forbidden` (access denied).
    property expected_source_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @copy_source : String,
      @key : String,
      @acl : ObjectCannedACL | Nil = nil,
      @cache_control : String | Nil = nil,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
      @content_disposition : String | Nil = nil,
      @content_encoding : String | Nil = nil,
      @content_language : String | Nil = nil,
      @content_type : String | Nil = nil,
      @copy_source_if_match : String | Nil = nil,
      @copy_source_if_modified_since : Time | Nil = nil,
      @copy_source_if_none_match : String | Nil = nil,
      @copy_source_if_unmodified_since : Time | Nil = nil,
      @expires : String | Nil = nil,
      @grant_full_control : String | Nil = nil,
      @grant_read : String | Nil = nil,
      @grant_read_acp : String | Nil = nil,
      @grant_write_acp : String | Nil = nil,
      @if_match : String | Nil = nil,
      @if_none_match : String | Nil = nil,
      @metadata : Hash(String, String) | Nil = nil,
      @metadata_directive : MetadataDirective | Nil = nil,
      @tagging_directive : TaggingDirective | Nil = nil,
      @annotation_directive : AnnotationDirective | Nil = nil,
      @server_side_encryption : ServerSideEncryption | Nil = nil,
      @storage_class : StorageClass | Nil = nil,
      @website_redirect_location : String | Nil = nil,
      @sse_customer_algorithm : String | Nil = nil,
      @sse_customer_key : String | Nil = nil,
      @sse_customer_key_md5 : String | Nil = nil,
      @ssekms_key_id : String | Nil = nil,
      @ssekms_encryption_context : String | Nil = nil,
      @bucket_key_enabled : Bool | Nil = nil,
      @copy_source_sse_customer_algorithm : String | Nil = nil,
      @copy_source_sse_customer_key : String | Nil = nil,
      @copy_source_sse_customer_key_md5 : String | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
      @tagging : String | Nil = nil,
      @object_lock_mode : ObjectLockMode | Nil = nil,
      @object_lock_retain_until_date : Time | Nil = nil,
      @object_lock_legal_hold_status : ObjectLockLegalHoldStatus | Nil = nil,
      @object_lock_event_hold : ObjectLockEventHold | Nil = nil,
      @object_lock_event_hold_duration_days : Int32 | Nil = nil,
      @object_lock_event_hold_duration_years : Int32 | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
      @expected_source_bucket_owner : String | Nil = nil,
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
      if value = @copy_source
        raise Core::ValidationError.new("CopySource does not match the required pattern") unless value.matches?(Regex.new("^\\/?.+\\/.+$"))
      end

      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@acl, @bucket, @cache_control, @checksum_algorithm, @content_disposition, @content_encoding, @content_language, @content_type, @copy_source, @copy_source_if_match, @copy_source_if_modified_since, @copy_source_if_none_match, @copy_source_if_unmodified_since, @expires, @grant_full_control, @grant_read, @grant_read_acp, @grant_write_acp, @if_match, @if_none_match, @key, @metadata, @metadata_directive, @tagging_directive, @annotation_directive, @server_side_encryption, @storage_class, @website_redirect_location, @sse_customer_algorithm, @sse_customer_key, @sse_customer_key_md5, @ssekms_key_id, @ssekms_encryption_context, @bucket_key_enabled, @copy_source_sse_customer_algorithm, @copy_source_sse_customer_key, @copy_source_sse_customer_key_md5, @request_payer, @tagging, @object_lock_mode, @object_lock_retain_until_date, @object_lock_legal_hold_status, @object_lock_event_hold, @object_lock_event_hold_duration_days, @object_lock_event_hold_duration_years, @expected_bucket_owner, @expected_source_bucket_owner)
  end
end
