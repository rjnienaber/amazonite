private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class Client < Core::Client
    Log               = ::Log.for("amazonite.s3.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AmazonS3", "s3", "1.0", EXCEPTION_FACTORY, config)
    end

    # This operation aborts a multipart upload. After a multipart upload is aborted, no additional
    # parts can be uploaded using that upload ID. The storage consumed by any previously uploaded
    # parts will be freed. However, if any part uploads are currently in progress, those part uploads
    # might or might not succeed. As a result, it might be necessary to abort a given multipart upload
    # multiple times in order to completely free all storage consumed by all parts.
    #
    # To verify that all parts have been removed and prevent getting charged for the part storage, you
    # should call the [ListParts](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html)
    # API operation and ensure that the parts list is empty.
    #
    # - **Directory buckets** - If multipart uploads in a directory bucket are in progress, you can't
    # delete the bucket until all the in-progress multipart uploads are aborted or completed. To
    # delete these in-progress multipart uploads, use the `ListMultipartUploads` operation to list the
    # in-progress multipart uploads in the bucket and use the `AbortMultipartUpload` operation to
    # abort all the in-progress multipart uploads.
    #
    # - **Directory buckets** - For directory buckets, you must make requests for this API operation
    # to the Zonal endpoint. These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - For information about permissions required to use the
    # multipart upload, see [Multipart Upload and
    # Permissions](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation on a directory
    # bucket, we recommend that you use the [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) API operation for
    # session-based authorization. Specifically, you grant the `s3express:CreateSession` permission to
    # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
    # `CreateSession` API call on the bucket to obtain a session token. With the session token in your
    # request header, you can make API requests to this operation. After the session token expires,
    # you make another `CreateSession` API call to generate a new session token for use. Amazon Web
    # Services CLI or SDKs create session and refresh the session token automatically to avoid service
    # interruptions when a session expires. For more information about authorization, see [
    # `CreateSession` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html).
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `AbortMultipartUpload`:
    #
    # -
    # [CreateMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html)
    #
    # - [UploadPart](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html)
    #
    # -
    # [CompleteMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html)
    #
    # - [ListParts](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html)
    #
    # -
    # [ListMultipartUploads](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def abort_multipart_upload(input : AS::AbortMultipartUploadRequest) : Core::Response
      Log.info { "performing 'AbortMultipartUpload' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("x-id", "AbortMultipartUpload")
        if value = input.upload_id
          form.add("uploadId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.if_match_initiated_time.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["x-amz-if-match-initiated-time"] = value
      end
      response = rest_request("AbortMultipartUpload", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # Completes a multipart upload by assembling previously uploaded parts.
    #
    # You first initiate the multipart upload and then upload all parts using the
    # [UploadPart](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html) operation or
    # the [UploadPartCopy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html)
    # operation. After successfully uploading all relevant parts of an upload, you call this
    # `CompleteMultipartUpload` operation to complete the upload. Upon receiving this request, Amazon
    # S3 concatenates all the parts in ascending order by part number to create a new object. In the
    # CompleteMultipartUpload request, you must provide the parts list and ensure that the parts list
    # is complete. The CompleteMultipartUpload API operation concatenates the parts that you provide
    # in the list. For each part in the list, you must provide the `PartNumber` value and the `ETag`
    # value that are returned after that part was uploaded.
    #
    # The processing of a CompleteMultipartUpload request could take several minutes to finalize.
    # After Amazon S3 begins processing the request, it sends an HTTP response header that specifies a
    # `200 OK` response. While processing is in progress, Amazon S3 periodically sends white space
    # characters to keep the connection from timing out. A request could fail after the initial `200
    # OK` response has been sent. This means that a `200 OK` response can contain either a success or
    # an error. The error response might be embedded in the `200 OK` response. If you call this API
    # operation directly, make sure to design your application to parse the contents of the response
    # and handle it appropriately. If you use Amazon Web Services SDKs, SDKs handle this condition.
    # The SDKs detect the embedded error and apply error handling per your configuration settings
    # (including automatically retrying the request as appropriate). If the condition persists, the
    # SDKs throw an exception (or, for the SDKs that don't use exceptions, they return an error).
    #
    # Note that if `CompleteMultipartUpload` fails, applications should be prepared to retry any
    # failed requests (including 500 error responses). For more information, see [Amazon S3 Error Best
    # Practices](https://docs.aws.amazon.com/AmazonS3/latest/dev/ErrorBestPractices.html).
    #
    # You can't use `Content-Type: application/x-www-form-urlencoded` for the CompleteMultipartUpload
    # requests. Also, if you don't provide a `Content-Type` header, `CompleteMultipartUpload` can
    # still return a `200 OK` response.
    #
    # For more information about multipart uploads, see [Uploading Objects Using Multipart
    # Upload](https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html) in the *Amazon
    # S3 User Guide*.
    #
    # **Directory buckets** - For directory buckets, you must make requests for this API operation to
    # the Zonal endpoint. These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - For information about permissions required to use the
    # multipart upload API, see [Multipart Upload and
    # Permissions](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html) in the
    # *Amazon S3 User Guide*.
    #
    # If you provide an [additional checksum
    # value](https://docs.aws.amazon.com/AmazonS3/latest/API/API_Checksum.html) in your
    # `MultipartUpload` requests and the object is encrypted with Key Management Service, you must
    # have permission to use the `kms:Decrypt` action for the `CompleteMultipartUpload` request to
    # succeed.
    #
    # - **Directory bucket permissions** - To grant access to this API operation on a directory
    # bucket, we recommend that you use the [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) API operation for
    # session-based authorization. Specifically, you grant the `s3express:CreateSession` permission to
    # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
    # `CreateSession` API call on the bucket to obtain a session token. With the session token in your
    # request header, you can make API requests to this operation. After the session token expires,
    # you make another `CreateSession` API call to generate a new session token for use. Amazon Web
    # Services CLI or SDKs create session and refresh the session token automatically to avoid service
    # interruptions when a session expires. For more information about authorization, see [
    # `CreateSession` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html).
    #
    # If the object is encrypted with SSE-KMS, you must also have the `kms:GenerateDataKey` and
    # `kms:Decrypt` permissions in IAM identity-based policies and KMS key policies for the KMS key.
    #
    # Special errors
    #
    # - Error Code: `EntityTooSmall`
    #
    # - Description: Your proposed upload is smaller than the minimum allowed object size. Each part
    # must be at least 5 MB in size, except the last part.
    #
    # - HTTP Status Code: 400 Bad Request
    #
    # - Error Code: `InvalidPart`
    #
    # - Description: One or more of the specified parts could not be found. The part might not have
    # been uploaded, or the specified ETag might not have matched the uploaded part's ETag.
    #
    # - HTTP Status Code: 400 Bad Request
    #
    # - Error Code: `InvalidPartOrder`
    #
    # - Description: The list of parts was not in ascending order. The parts list must be specified in
    # order by part number.
    #
    # - HTTP Status Code: 400 Bad Request
    #
    # - Error Code: `NoSuchUpload`
    #
    # - Description: The specified multipart upload does not exist. The upload ID might be invalid, or
    # the multipart upload might have been aborted or completed.
    #
    # - HTTP Status Code: 404 Not Found
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `CompleteMultipartUpload`:
    #
    # -
    # [CreateMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html)
    #
    # - [UploadPart](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html)
    #
    # -
    # [AbortMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html)
    #
    # - [ListParts](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html)
    #
    # -
    # [ListMultipartUploads](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def complete_multipart_upload(input : AS::CompleteMultipartUploadRequest) : Core::ParsedResponse(AS::CompleteMultipartUploadOutput)
      Log.info { "performing 'CompleteMultipartUpload' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        if value = input.upload_id
          form.add("uploadId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.checksum_crc32
        headers["x-amz-checksum-crc32"] = value
      end
      if value = input.checksum_crc32c
        headers["x-amz-checksum-crc32c"] = value
      end
      if value = input.checksum_crc64nvme
        headers["x-amz-checksum-crc64nvme"] = value
      end
      if value = input.checksum_sha1
        headers["x-amz-checksum-sha1"] = value
      end
      if value = input.checksum_sha256
        headers["x-amz-checksum-sha256"] = value
      end
      if value = input.checksum_sha512
        headers["x-amz-checksum-sha512"] = value
      end
      if value = input.checksum_md5
        headers["x-amz-checksum-md5"] = value
      end
      if value = input.checksum_xxhash64
        headers["x-amz-checksum-xxhash64"] = value
      end
      if value = input.checksum_xxhash3
        headers["x-amz-checksum-xxhash3"] = value
      end
      if value = input.checksum_xxhash128
        headers["x-amz-checksum-xxhash128"] = value
      end
      if value = input.checksum_type.try(&.to_json_object_key)
        headers["x-amz-checksum-type"] = value
      end
      if value = input.mpu_object_size.try(&.to_s)
        headers["x-amz-mp-object-size"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.if_match
        headers["If-Match"] = value
      end
      if value = input.if_none_match
        headers["If-None-Match"] = value
      end
      if value = input.sse_customer_algorithm
        headers["x-amz-server-side-encryption-customer-algorithm"] = value
      end
      if value = input.sse_customer_key
        headers["x-amz-server-side-encryption-customer-key"] = value
      end
      if value = input.sse_customer_key_md5
        headers["x-amz-server-side-encryption-customer-key-MD5"] = value
      end
      response = rest_request("CompleteMultipartUpload", "POST", path, headers, input.multipart_upload.try(&.to_xml("CompleteMultipartUpload")), "application/xml")
      result = AS::CompleteMultipartUploadOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.expiration = response.headers["x-amz-expiration"]?
      result.server_side_encryption = response.headers["x-amz-server-side-encryption"]?.try { |value| AS::ServerSideEncryption.from_json_object_key?(value) }
      result.version_id = response.headers["x-amz-version-id"]?
      result.ssekms_key_id = response.headers["x-amz-server-side-encryption-aws-kms-key-id"]?
      result.bucket_key_enabled = Core::HeaderValue.bool(response.headers["x-amz-server-side-encryption-bucket-key-enabled"]?)
      result.request_charged = response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) }
      Core::ParsedResponse(AS::CompleteMultipartUploadOutput).new(response, result)
    end

    # Creates a copy of an object that is already stored in Amazon S3.
    #
    # End of support notice: As of October 1, 2025, Amazon S3 has discontinued support for Email
    # Grantee Access Control Lists (ACLs). If you attempt to use an Email Grantee ACL in a request
    # after October 1, 2025, the request will receive an `HTTP 405` (Method Not Allowed) error.
    #
    # This change affects the following Amazon Web Services Regions: US East (N. Virginia), US West
    # (N. California), US West (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific
    # (Tokyo), Europe (Ireland), and South America (São Paulo).
    #
    # You can store individual objects of up to 50 TB in Amazon S3. You create a copy of your object
    # up to 5 GB in size in a single atomic action using this API. However, to copy an object greater
    # than 5 GB, you must use the multipart upload Upload Part - Copy (UploadPartCopy) API. For more
    # information, see [Copy Object Using the REST Multipart Upload
    # API](https://docs.aws.amazon.com/AmazonS3/latest/dev/CopyingObjctsUsingRESTMPUapi.html).
    #
    # You can copy individual objects between general purpose buckets, between directory buckets, and
    # between general purpose buckets and directory buckets.
    #
    # - Amazon S3 supports copy operations using Multi-Region Access Points only as a destination when
    # using the Multi-Region Access Point ARN.
    #
    # - **Directory buckets ** - For directory buckets, you must make requests for this API operation
    # to the Zonal endpoint. These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # - VPC endpoints don't support cross-Region requests (including copies). If you're using VPC
    # endpoints, your source and destination buckets should be in the same Amazon Web Services Region
    # as your VPC endpoint.
    #
    # Both the Region that you want to copy the object from and the Region that you want to copy the
    # object to must be enabled for your account. For more information about how to enable a Region
    # for your account, see [Enable or disable a Region for standalone
    # accounts](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-regions.html#manage-acct-regions-enable-standalone)
    # in the *Amazon Web Services Account Management Guide*.
    #
    # Amazon S3 transfer acceleration does not support cross-Region copies. If you request a
    # cross-Region copy using a transfer acceleration endpoint, you get a `400 Bad Request` error. For
    # more information, see [Transfer
    # Acceleration](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html).
    #
    # Authentication and authorization All `CopyObject` requests must be authenticated and signed by
    # using IAM credentials (access key ID and secret access key for the IAM identities). All headers
    # with the `x-amz-` prefix, including `x-amz-copy-source`, must be signed. For more information,
    # see [REST
    # Authentication](https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html).
    #
    # **Directory buckets** - You must use the IAM credentials to authenticate and authorize your
    # access to the `CopyObject` API operation, instead of using the temporary security credentials
    # through the `CreateSession` API operation.
    #
    # Amazon Web Services CLI or SDKs handles authentication and authorization on your behalf.
    #
    # Permissions You must have *read* access to the source object and *write* access to the
    # destination bucket.
    #
    # - **General purpose bucket permissions** - You must have permissions in an IAM policy based on
    # the source and destination bucket types in a `CopyObject` operation.
    #
    # - If the source object is in a general purpose bucket, you must have ** `s3:GetObject` **
    # permission to read the source object that is being copied.
    #
    # - If the destination bucket is a general purpose bucket, you must have ** `s3:PutObject` **
    # permission to write the object copy to the destination bucket.
    #
    # - **Directory bucket permissions** - You must have permissions in a bucket policy or an IAM
    # identity-based policy based on the source and destination bucket types in a `CopyObject`
    # operation.
    #
    # - If the source object that you want to copy is in a directory bucket, you must have the **
    # `s3express:CreateSession` ** permission in the `Action` element of a policy to read the object.
    # If no session mode is specified, the session will be created with the maximum allowable
    # privilege, attempting `ReadWrite` first, then `ReadOnly` if `ReadWrite` is not permitted. If you
    # want to explicitly restrict the access to be read-only, you can set the `s3express:SessionMode`
    # condition key to `ReadOnly` on the copy source bucket.
    #
    # - If the copy destination is a directory bucket, you must have the ** `s3express:CreateSession`
    # ** permission in the `Action` element of a policy to write the object to the destination. The
    # `s3express:SessionMode` condition key can't be set to `ReadOnly` on the copy destination bucket.
    #
    # If the object is encrypted with SSE-KMS, you must also have the `kms:GenerateDataKey` and
    # `kms:Decrypt` permissions in IAM identity-based policies and KMS key policies for the KMS key.
    #
    # For example policies, see [Example bucket policies for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam-example-bucket-policies.html)
    # and [Amazon Web Services Identity and Access Management (IAM) identity-based policies for S3
    # Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam-identity-policies.html)
    # in the *Amazon S3 User Guide*.
    #
    # Response and special errors When the request is an HTTP 1.1 request, the response is chunk
    # encoded. When the request is not an HTTP 1.1 request, the response would not contain the
    # `Content-Length`. You always need to read the entire response body to check if the copy
    # succeeds.
    #
    # - If the copy is successful, you receive a response with information about the copied object.
    #
    # - A copy request might return an error when Amazon S3 receives the copy request or while Amazon
    # S3 is copying the files. A `200 OK` response can contain either a success or an error.
    #
    # - If the error occurs before the copy action starts, you receive a standard Amazon S3 error.
    #
    # - If the error occurs during the copy operation, the error response is embedded in the `200 OK`
    # response. For example, in a cross-region copy, you may encounter throttling and receive a `200
    # OK` response. For more information, see [Resolve the Error 200 response when copying objects to
    # Amazon S3](https://repost.aws/knowledge-center/s3-resolve-200-internalerror). The `200 OK`
    # status code means the copy was accepted, but it doesn't mean the copy is complete. Another
    # example is when you disconnect from Amazon S3 before the copy is complete, Amazon S3 might
    # cancel the copy and you may receive a `200 OK` response. You must stay connected to Amazon S3
    # until the entire response is successfully received and processed.
    #
    # If you call this API operation directly, make sure to design your application to parse the
    # content of the response and handle it appropriately. If you use Amazon Web Services SDKs, SDKs
    # handle this condition. The SDKs detect the embedded error and apply error handling per your
    # configuration settings (including automatically retrying the request as appropriate). If the
    # condition persists, the SDKs throw an exception (or, for the SDKs that don't use exceptions,
    # they return an error).
    #
    # Charge The copy request charge is based on the storage class and Region that you specify for the
    # destination object. The request can also result in a data retrieval charge for the source if the
    # source storage class bills for data retrieval. If the copy source is in a different region, the
    # data transfer is billed to the copy source account. For pricing information, see [Amazon S3
    # pricing](http://aws.amazon.com/s3/pricing/).
    #
    # HTTP Host header syntax
    #
    # - **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # - **Amazon S3 on Outposts** - When you use this action with S3 on Outposts through the REST API,
    # you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the
    # form ` *AccessPointName*-*AccountId*.*outpostID*.s3-outposts.*Region*.amazonaws.com`. The
    # hostname isn't required when you use the Amazon Web Services CLI or SDKs.
    #
    # The following operations are related to `CopyObject`:
    #
    # - [PutObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)
    #
    # - [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def copy_object(input : AS::CopyObjectRequest) : Core::ParsedResponse(AS::CopyObjectOutput)
      Log.info { "performing 'CopyObject' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("x-id", "CopyObject")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.acl.try(&.to_json_object_key)
        headers["x-amz-acl"] = value
      end
      if value = input.cache_control
        headers["Cache-Control"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-checksum-algorithm"] = value
      end
      if value = input.content_disposition
        headers["Content-Disposition"] = value
      end
      if value = input.content_encoding
        headers["Content-Encoding"] = value
      end
      if value = input.content_language
        headers["Content-Language"] = value
      end
      if value = input.content_type
        headers["Content-Type"] = value
      end
      if value = input.copy_source
        headers["x-amz-copy-source"] = value
      end
      if value = input.copy_source_if_match
        headers["x-amz-copy-source-if-match"] = value
      end
      if value = input.copy_source_if_modified_since.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["x-amz-copy-source-if-modified-since"] = value
      end
      if value = input.copy_source_if_none_match
        headers["x-amz-copy-source-if-none-match"] = value
      end
      if value = input.copy_source_if_unmodified_since.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["x-amz-copy-source-if-unmodified-since"] = value
      end
      if value = input.expires
        headers["Expires"] = value
      end
      if value = input.grant_full_control
        headers["x-amz-grant-full-control"] = value
      end
      if value = input.grant_read
        headers["x-amz-grant-read"] = value
      end
      if value = input.grant_read_acp
        headers["x-amz-grant-read-acp"] = value
      end
      if value = input.grant_write_acp
        headers["x-amz-grant-write-acp"] = value
      end
      if value = input.if_match
        headers["If-Match"] = value
      end
      if value = input.if_none_match
        headers["If-None-Match"] = value
      end
      if value = input.metadata_directive.try(&.to_json_object_key)
        headers["x-amz-metadata-directive"] = value
      end
      if value = input.tagging_directive.try(&.to_json_object_key)
        headers["x-amz-tagging-directive"] = value
      end
      if value = input.annotation_directive.try(&.to_json_object_key)
        headers["x-amz-object-annotation-directive"] = value
      end
      if value = input.server_side_encryption.try(&.to_json_object_key)
        headers["x-amz-server-side-encryption"] = value
      end
      if value = input.storage_class.try(&.to_json_object_key)
        headers["x-amz-storage-class"] = value
      end
      if value = input.website_redirect_location
        headers["x-amz-website-redirect-location"] = value
      end
      if value = input.sse_customer_algorithm
        headers["x-amz-server-side-encryption-customer-algorithm"] = value
      end
      if value = input.sse_customer_key
        headers["x-amz-server-side-encryption-customer-key"] = value
      end
      if value = input.sse_customer_key_md5
        headers["x-amz-server-side-encryption-customer-key-MD5"] = value
      end
      if value = input.ssekms_key_id
        headers["x-amz-server-side-encryption-aws-kms-key-id"] = value
      end
      if value = input.ssekms_encryption_context
        headers["x-amz-server-side-encryption-context"] = value
      end
      if value = input.bucket_key_enabled.try(&.to_s)
        headers["x-amz-server-side-encryption-bucket-key-enabled"] = value
      end
      if value = input.copy_source_sse_customer_algorithm
        headers["x-amz-copy-source-server-side-encryption-customer-algorithm"] = value
      end
      if value = input.copy_source_sse_customer_key
        headers["x-amz-copy-source-server-side-encryption-customer-key"] = value
      end
      if value = input.copy_source_sse_customer_key_md5
        headers["x-amz-copy-source-server-side-encryption-customer-key-MD5"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.tagging
        headers["x-amz-tagging"] = value
      end
      if value = input.object_lock_mode.try(&.to_json_object_key)
        headers["x-amz-object-lock-mode"] = value
      end
      if value = input.object_lock_retain_until_date.try { |time| Core::HeaderValue.format_date_time(time) }
        headers["x-amz-object-lock-retain-until-date"] = value
      end
      if value = input.object_lock_legal_hold_status.try(&.to_json_object_key)
        headers["x-amz-object-lock-legal-hold"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.expected_source_bucket_owner
        headers["x-amz-source-expected-bucket-owner"] = value
      end
      (input.metadata || {} of String => String).each do |key, value|
        headers["x-amz-meta-#{key}"] = value
      end
      response = rest_request("CopyObject", "PUT", path, headers, nil, "application/xml")
      result = AS::CopyObjectOutput.new(
        expiration: response.headers["x-amz-expiration"]?,
        copy_source_version_id: response.headers["x-amz-copy-source-version-id"]?,
        version_id: response.headers["x-amz-version-id"]?,
        server_side_encryption: response.headers["x-amz-server-side-encryption"]?.try { |value| AS::ServerSideEncryption.from_json_object_key?(value) },
        sse_customer_algorithm: response.headers["x-amz-server-side-encryption-customer-algorithm"]?,
        sse_customer_key_md5: response.headers["x-amz-server-side-encryption-customer-key-MD5"]?,
        ssekms_key_id: response.headers["x-amz-server-side-encryption-aws-kms-key-id"]?,
        ssekms_encryption_context: response.headers["x-amz-server-side-encryption-context"]?,
        bucket_key_enabled: Core::HeaderValue.bool(response.headers["x-amz-server-side-encryption-bucket-key-enabled"]?),
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
        copy_object_result: CopyObjectResult.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::CopyObjectOutput).new(response, result)
    end

    # This action creates an Amazon S3 bucket. To create an Amazon S3 on Outposts bucket, see [
    # `CreateBucket` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_CreateBucket.html).
    #
    # Creates a new S3 bucket. To create a bucket, you must set up Amazon S3 and have a valid Amazon
    # Web Services Access Key ID to authenticate requests. Anonymous requests are never allowed to
    # create buckets. By creating the bucket, you become the bucket owner.
    #
    # There are two types of buckets: general purpose buckets and directory buckets. For more
    # information about these bucket types, see [Creating, configuring, and working with Amazon S3
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-buckets-s3.html) in the
    # *Amazon S3 User Guide*.
    #
    # General purpose buckets exist in a global namespace, which means that each bucket name must be
    # unique across all Amazon Web Services accounts in all the Amazon Web Services Regions within a
    # partition. A partition is a grouping of Regions. Amazon Web Services currently has four
    # partitions: `aws` (Standard Regions), `aws-cn` (China Regions), `aws-us-gov` (Amazon Web
    # Services GovCloud (US)), and `aws-eusc` (European Sovereign Cloud). When you create a general
    # purpose bucket, you can choose to create a bucket in the shared global namespace or you can
    # choose to create a bucket in your account regional namespace. Your account regional namespace is
    # a subdivision of the global namespace that only your account can create buckets in. For more
    # information on account regional namespaces, see [Namespaces for general purpose
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/gpbucketnamespaces.html).
    #
    # - **General purpose buckets** - If you send your `CreateBucket` request to the
    # `s3.amazonaws.com` global endpoint, the request goes to the `us-east-1` Region. So the signature
    # calculations in Signature Version 4 must use `us-east-1` as the Region, even if the location
    # constraint in the request specifies another Region where the bucket is to be created. If you
    # create a bucket in a Region other than US East (N. Virginia), your application must be able to
    # handle 307 redirect. For more information, see [Virtual hosting of
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/VirtualHosting.html) in the *Amazon S3
    # User Guide*.
    #
    # - **Directory buckets ** - For directory buckets, you must make requests for this API operation
    # to the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - In addition to the `s3:CreateBucket` permission, the
    # following permissions are required in a policy when your `CreateBucket` request includes
    # specific headers:
    #
    # - **Access control lists (ACLs)** - In your `CreateBucket` request, if you specify an access
    # control list (ACL) and set it to `public-read`, `public-read-write`, `authenticated-read`, or if
    # you explicitly specify any other custom ACLs, both `s3:CreateBucket` and `s3:PutBucketAcl`
    # permissions are required. In your `CreateBucket` request, if you set the ACL to `private`, or if
    # you don't specify any ACLs, only the `s3:CreateBucket` permission is required.
    #
    # - **Object Lock** - In your `CreateBucket` request, if you set
    # `x-amz-bucket-object-lock-enabled` to true, the `s3:PutBucketObjectLockConfiguration` and
    # `s3:PutBucketVersioning` permissions are required.
    #
    # - **S3 Object Ownership** - If your `CreateBucket` request includes the `x-amz-object-ownership`
    # header, then the `s3:PutBucketOwnershipControls` permission is required.
    #
    # To set an ACL on a bucket as part of a `CreateBucket` request, you must explicitly set S3 Object
    # Ownership for the bucket to a different value than the default, `BucketOwnerEnforced`.
    # Additionally, if your desired bucket ACL grants public access, you must first create the bucket
    # (without the bucket ACL) and then explicitly disable Block Public Access on the bucket before
    # using `PutBucketAcl` to set the ACL. If you try to create a bucket with a public ACL, the
    # request will fail.
    #
    # For the majority of modern use cases in S3, we recommend that you keep all Block Public Access
    # settings enabled and keep ACLs disabled. If you would like to share data with users outside of
    # your account, you can use bucket policies as needed. For more information, see [Controlling
    # ownership of objects and disabling ACLs for your bucket
    # ](https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html) and
    # [Blocking public access to your Amazon S3 storage
    # ](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-control-block-public-access.html)
    # in the *Amazon S3 User Guide*.
    #
    # - **S3 Block Public Access** - If your specific use case requires granting public access to your
    # S3 resources, you can disable Block Public Access. Specifically, you can create a new bucket
    # with Block Public Access enabled, then separately call the [ `DeletePublicAccessBlock`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeletePublicAccessBlock.html) API. To use
    # this operation, you must have the `s3:PutBucketPublicAccessBlock` permission. For more
    # information about S3 Block Public Access, see [Blocking public access to your Amazon S3 storage
    # ](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-control-block-public-access.html)
    # in the *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - You must have the `s3express:CreateBucket` permission in an
    # IAM identity-based policy instead of a bucket policy. Cross-account access to this API operation
    # isn't supported. This operation can only be performed by the Amazon Web Services account that
    # owns the resource. For more information about directory bucket policies and permissions, see
    # [Amazon Web Services Identity and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # The permissions for ACLs, Object Lock, S3 Object Ownership, and S3 Block Public Access are not
    # supported for directory buckets. For directory buckets, all Block Public Access settings are
    # enabled at the bucket level and S3 Object Ownership is set to Bucket owner enforced (ACLs
    # disabled). These settings can't be modified.
    #
    # For more information about permissions for creating and working with directory buckets, see
    # [Directory
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-overview.html)
    # in the *Amazon S3 User Guide*. For more information about supported S3 features for directory
    # buckets, see [Features of S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-one-zone.html#s3-express-features)
    # in the *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `CreateBucket`:
    #
    # - [PutObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)
    #
    # - [DeleteBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def create_bucket(input : AS::CreateBucketRequest) : Core::ParsedResponse(AS::CreateBucketOutput)
      Log.info { "performing 'CreateBucket' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      headers = HTTP::Headers.new
      if value = input.acl.try(&.to_json_object_key)
        headers["x-amz-acl"] = value
      end
      if value = input.grant_full_control
        headers["x-amz-grant-full-control"] = value
      end
      if value = input.grant_read
        headers["x-amz-grant-read"] = value
      end
      if value = input.grant_read_acp
        headers["x-amz-grant-read-acp"] = value
      end
      if value = input.grant_write
        headers["x-amz-grant-write"] = value
      end
      if value = input.grant_write_acp
        headers["x-amz-grant-write-acp"] = value
      end
      if value = input.object_lock_enabled_for_bucket.try(&.to_s)
        headers["x-amz-bucket-object-lock-enabled"] = value
      end
      if value = input.object_ownership.try(&.to_json_object_key)
        headers["x-amz-object-ownership"] = value
      end
      if value = input.bucket_namespace.try(&.to_json_object_key)
        headers["x-amz-bucket-namespace"] = value
      end
      response = rest_request("CreateBucket", "PUT", path, headers, input.create_bucket_configuration.try(&.to_xml("CreateBucketConfiguration")), "application/xml")
      result = AS::CreateBucketOutput.new(
        location: response.headers["Location"]?,
        bucket_arn: response.headers["x-amz-bucket-arn"]?,
      )
      Core::ParsedResponse(AS::CreateBucketOutput).new(response, result)
    end

    # Creates an S3 Metadata V2 metadata configuration for a general purpose bucket. For more
    # information, see [Accelerating data discovery with S3
    # Metadata](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-overview.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions To use this operation, you must have the following permissions. For more
    # information, see [Setting up permissions for configuring metadata
    # tables](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-permissions.html)
    # in the *Amazon S3 User Guide*.
    #
    # If you want to encrypt your metadata tables with server-side encryption with Key Management
    # Service (KMS) keys (SSE-KMS), you need additional permissions in your KMS key policy. For more
    # information, see [ Setting up permissions for configuring metadata
    # tables](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-permissions.html)
    # in the *Amazon S3 User Guide*.
    #
    # If you also want to integrate your table bucket with Amazon Web Services analytics services so
    # that you can query your metadata table, you need additional permissions. For more information,
    # see [ Integrating Amazon S3 Tables with Amazon Web Services analytics
    # services](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-integrating-aws.html)
    # in the *Amazon S3 User Guide*.
    #
    # To query your metadata tables, you need additional permissions. For more information, see [
    # Permissions for querying metadata
    # tables](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-bucket-query-permissions.html)
    # in the *Amazon S3 User Guide*.
    #
    # - `s3:CreateBucketMetadataTableConfiguration`
    #
    # The IAM policy action name is the same for the V1 and V2 API operations.
    #
    # - `s3tables:CreateTableBucket`
    #
    # - `s3tables:CreateNamespace`
    #
    # - `s3tables:GetTable`
    #
    # - `s3tables:CreateTable`
    #
    # - `s3tables:PutTablePolicy`
    #
    # - `s3tables:PutTableBucketPolicy`
    #
    # - `s3tables:PutTableEncryption`
    #
    # - `kms:DescribeKey`
    #
    # - `iam:PassRole` - required if you include an `AnnotationTableConfiguration` with an IAM role.
    #
    # The following operations are related to `CreateBucketMetadataConfiguration`:
    #
    # -
    # [DeleteBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetadataConfiguration.html)
    #
    # -
    # [GetBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetadataConfiguration.html)
    #
    # -
    # [UpdateBucketMetadataInventoryTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UpdateBucketMetadataInventoryTableConfiguration.html)
    #
    # -
    # [UpdateBucketMetadataJournalTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UpdateBucketMetadataJournalTableConfiguration.html)
    #
    # -
    # [UpdateBucketMetadataAnnotationTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UpdateBucketMetadataAnnotationTableConfiguration.html)
    #
    # If you include an `AnnotationTableConfiguration` with an IAM role, the role must have a trust
    # policy that allows the Amazon S3 metadata service to assume it, and a permissions policy that
    # grants the actions needed to read annotations from your bucket. The following examples show a
    # trust policy and a permissions policy that you can adapt for your bucket and account.
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def create_bucket_metadata_configuration(input : AS::CreateBucketMetadataConfigurationRequest) : Core::Response
      Log.info { "performing 'CreateBucketMetadataConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("metadataConfiguration", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("CreateBucketMetadataConfiguration", "POST", path, headers, input.metadata_configuration.try(&.to_xml("MetadataConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # We recommend that you create your S3 Metadata configurations by using the V2
    # [CreateBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html)
    # API operation. We no longer recommend using the V1 `CreateBucketMetadataTableConfiguration` API
    # operation.
    #
    # If you created your S3 Metadata configuration before July 15, 2025, we recommend that you delete
    # and re-create your configuration by using
    # [CreateBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html)
    # so that you can expire journal table records and create a live inventory table.
    #
    # Creates a V1 S3 Metadata configuration for a general purpose bucket. For more information, see
    # [Accelerating data discovery with S3
    # Metadata](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-overview.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions To use this operation, you must have the following permissions. For more
    # information, see [Setting up permissions for configuring metadata
    # tables](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-permissions.html)
    # in the *Amazon S3 User Guide*.
    #
    # If you want to encrypt your metadata tables with server-side encryption with Key Management
    # Service (KMS) keys (SSE-KMS), you need additional permissions. For more information, see [
    # Setting up permissions for configuring metadata
    # tables](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-permissions.html)
    # in the *Amazon S3 User Guide*.
    #
    # If you also want to integrate your table bucket with Amazon Web Services analytics services so
    # that you can query your metadata table, you need additional permissions. For more information,
    # see [ Integrating Amazon S3 Tables with Amazon Web Services analytics
    # services](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-integrating-aws.html)
    # in the *Amazon S3 User Guide*.
    #
    # - `s3:CreateBucketMetadataTableConfiguration`
    #
    # - `s3tables:CreateNamespace`
    #
    # - `s3tables:GetTable`
    #
    # - `s3tables:CreateTable`
    #
    # - `s3tables:PutTablePolicy`
    #
    # The following operations are related to `CreateBucketMetadataTableConfiguration`:
    #
    # -
    # [DeleteBucketMetadataTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetadataTableConfiguration.html)
    #
    # -
    # [GetBucketMetadataTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetadataTableConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def create_bucket_metadata_table_configuration(input : AS::CreateBucketMetadataTableConfigurationRequest) : Core::Response
      Log.info { "performing 'CreateBucketMetadataTableConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("metadataTable", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("CreateBucketMetadataTableConfiguration", "POST", path, headers, input.metadata_table_configuration.try(&.to_xml("MetadataTableConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # End of support notice: As of October 1, 2025, Amazon S3 has discontinued support for Email
    # Grantee Access Control Lists (ACLs). If you attempt to use an Email Grantee ACL in a request
    # after October 1, 2025, the request will receive an `HTTP 405` (Method Not Allowed) error.
    #
    # This change affects the following Amazon Web Services Regions: US East (N. Virginia), US West
    # (N. California), US West (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific
    # (Tokyo), Europe (Ireland), and South America (São Paulo).
    #
    # This action initiates a multipart upload and returns an upload ID. This upload ID is used to
    # associate all of the parts in the specific multipart upload. You specify this upload ID in each
    # of your subsequent upload part requests (see
    # [UploadPart](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html)). You also
    # include this upload ID in the final request to either complete or abort the multipart upload
    # request. For more information about multipart uploads, see [Multipart Upload
    # Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html) in the *Amazon S3
    # User Guide*.
    #
    # After you initiate a multipart upload and upload one or more parts, to stop being charged for
    # storing the uploaded parts, you must either complete or abort the multipart upload. Amazon S3
    # frees up the space used to store the parts and stops charging you for storing them only after
    # you either complete or abort a multipart upload.
    #
    # If you have configured a lifecycle rule to abort incomplete multipart uploads, the created
    # multipart upload must be completed within the number of days specified in the bucket lifecycle
    # configuration. Otherwise, the incomplete multipart upload becomes eligible for an abort action
    # and Amazon S3 aborts the multipart upload. For more information, see [Aborting Incomplete
    # Multipart Uploads Using a Bucket Lifecycle
    # Configuration](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config).
    #
    # - **Directory buckets ** - S3 Lifecycle is not supported by directory buckets.
    #
    # - **Directory buckets ** - For directory buckets, you must make requests for this API operation
    # to the Zonal endpoint. These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Request signing For request signing, multipart upload is just a series of regular requests. You
    # initiate a multipart upload, send one or more requests to upload parts, and then complete the
    # multipart upload process. You sign each request individually. There is nothing special about
    # signing multipart upload requests. For more information about signing, see [Authenticating
    # Requests (Amazon Web Services Signature Version
    # 4)](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html) in the
    # *Amazon S3 User Guide*.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - To perform a multipart upload with encryption using
    # an Key Management Service (KMS) KMS key, the requester must have permission to the `kms:Decrypt`
    # and `kms:GenerateDataKey` actions on the key. The requester must also have permissions for the
    # `kms:GenerateDataKey` action for the `CreateMultipartUpload` API. Then, the requester needs
    # permissions for the `kms:Decrypt` action on the `UploadPart` and `UploadPartCopy` APIs. These
    # permissions are required because Amazon S3 must decrypt and read data from the encrypted file
    # parts before it completes the multipart upload. For more information, see [Multipart upload API
    # and
    # permissions](https://docs.aws.amazon.com/AmazonS3/latest/userguide/mpuoverview.html#mpuAndPermissions)
    # and [Protecting data using server-side encryption with Amazon Web Services
    # KMS](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingKMSEncryption.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation on a directory
    # bucket, we recommend that you use the [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) API operation for
    # session-based authorization. Specifically, you grant the `s3express:CreateSession` permission to
    # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
    # `CreateSession` API call on the bucket to obtain a session token. With the session token in your
    # request header, you can make API requests to this operation. After the session token expires,
    # you make another `CreateSession` API call to generate a new session token for use. Amazon Web
    # Services CLI or SDKs create session and refresh the session token automatically to avoid service
    # interruptions when a session expires. For more information about authorization, see [
    # `CreateSession` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html).
    #
    # Encryption
    #
    # - **General purpose buckets** - Server-side encryption is for data encryption at rest. Amazon S3
    # encrypts your data as it writes it to disks in its data centers and decrypts it when you access
    # it. Amazon S3 automatically encrypts all new objects that are uploaded to an S3 bucket. When
    # doing a multipart upload, if you don't specify encryption information in your request, the
    # encryption setting of the uploaded parts is set to the default encryption configuration of the
    # destination bucket. By default, all buckets have a base level of encryption configuration that
    # uses server-side encryption with Amazon S3 managed keys (SSE-S3). If the destination bucket has
    # a default encryption configuration that uses server-side encryption with an Key Management
    # Service (KMS) key (SSE-KMS), or a customer-provided encryption key (SSE-C), Amazon S3 uses the
    # corresponding KMS key, or a customer-provided key to encrypt the uploaded parts. When you
    # perform a CreateMultipartUpload operation, if you want to use a different type of encryption
    # setting for the uploaded parts, you can request that Amazon S3 encrypts the object with a
    # different encryption key (such as an Amazon S3 managed key, a KMS key, or a customer-provided
    # key). When the encryption setting in your request is different from the default encryption
    # configuration of the destination bucket, the encryption setting in your request takes
    # precedence. If you choose to provide your own encryption key, the request headers you provide in
    # [UploadPart](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html) and
    # [UploadPartCopy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html)
    # requests must match the headers you used in the `CreateMultipartUpload` request.
    #
    # - Use KMS keys (SSE-KMS) that include the Amazon Web Services managed key (`aws/s3`) and KMS
    # customer managed keys stored in Key Management Service (KMS) – If you want Amazon Web Services
    # to manage the keys used to encrypt data, specify the following headers in the request.
    #
    # - `x-amz-server-side-encryption`
    #
    # - `x-amz-server-side-encryption-aws-kms-key-id`
    #
    # - `x-amz-server-side-encryption-context`
    #
    # - If you specify `x-amz-server-side-encryption:aws:kms`, but don't provide
    # `x-amz-server-side-encryption-aws-kms-key-id`, Amazon S3 uses the Amazon Web Services managed
    # key (`aws/s3` key) in KMS to protect the data.
    #
    # - To perform a multipart upload with encryption by using an Amazon Web Services KMS key, the
    # requester must have permission to the `kms:Decrypt` and `kms:GenerateDataKey*` actions on the
    # key. These permissions are required because Amazon S3 must decrypt and read data from the
    # encrypted file parts before it completes the multipart upload. For more information, see
    # [Multipart upload API and
    # permissions](https://docs.aws.amazon.com/AmazonS3/latest/userguide/mpuoverview.html#mpuAndPermissions)
    # and [Protecting data using server-side encryption with Amazon Web Services
    # KMS](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingKMSEncryption.html) in the
    # *Amazon S3 User Guide*.
    #
    # - If your Identity and Access Management (IAM) user or role is in the same Amazon Web Services
    # account as the KMS key, then you must have these permissions on the key policy. If your IAM user
    # or role is in a different account from the key, then you must have the permissions on both the
    # key policy and your IAM user or role.
    #
    # - All `GET` and `PUT` requests for an object protected by KMS fail if you don't make them by
    # using Secure Sockets Layer (SSL), Transport Layer Security (TLS), or Signature Version 4. For
    # information about configuring any of the officially supported Amazon Web Services SDKs and
    # Amazon Web Services CLI, see [Specifying the Signature Version in Request
    # Authentication](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version)
    # in the *Amazon S3 User Guide*.
    #
    # For more information about server-side encryption with KMS keys (SSE-KMS), see [Protecting Data
    # Using Server-Side Encryption with KMS
    # keys](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingKMSEncryption.html) in the
    # *Amazon S3 User Guide*.
    #
    # - Use customer-provided encryption keys (SSE-C) – If you want to manage your own encryption
    # keys, provide all the following headers in the request.
    #
    # - `x-amz-server-side-encryption-customer-algorithm`
    #
    # - `x-amz-server-side-encryption-customer-key`
    #
    # - `x-amz-server-side-encryption-customer-key-MD5`
    #
    # For more information about server-side encryption with customer-provided encryption keys
    # (SSE-C), see [ Protecting data using server-side encryption with customer-provided encryption
    # keys
    # (SSE-C)](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ServerSideEncryptionCustomerKeys.html)
    # in the *Amazon S3 User Guide*.
    #
    # - **Directory buckets** - For directory buckets, there are only two supported options for
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
    # For directory buckets, when you perform a `CreateMultipartUpload` operation and an
    # `UploadPartCopy` operation, the request headers you provide in the `CreateMultipartUpload`
    # request must match the default encryption configuration of the destination bucket.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `CreateMultipartUpload`:
    #
    # - [UploadPart](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html)
    #
    # -
    # [CompleteMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html)
    #
    # -
    # [AbortMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html)
    #
    # - [ListParts](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html)
    #
    # -
    # [ListMultipartUploads](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def create_multipart_upload(input : AS::CreateMultipartUploadRequest) : Core::ParsedResponse(AS::CreateMultipartUploadOutput)
      Log.info { "performing 'CreateMultipartUpload' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("uploads", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.acl.try(&.to_json_object_key)
        headers["x-amz-acl"] = value
      end
      if value = input.cache_control
        headers["Cache-Control"] = value
      end
      if value = input.content_disposition
        headers["Content-Disposition"] = value
      end
      if value = input.content_encoding
        headers["Content-Encoding"] = value
      end
      if value = input.content_language
        headers["Content-Language"] = value
      end
      if value = input.content_type
        headers["Content-Type"] = value
      end
      if value = input.expires
        headers["Expires"] = value
      end
      if value = input.grant_full_control
        headers["x-amz-grant-full-control"] = value
      end
      if value = input.grant_read
        headers["x-amz-grant-read"] = value
      end
      if value = input.grant_read_acp
        headers["x-amz-grant-read-acp"] = value
      end
      if value = input.grant_write_acp
        headers["x-amz-grant-write-acp"] = value
      end
      if value = input.server_side_encryption.try(&.to_json_object_key)
        headers["x-amz-server-side-encryption"] = value
      end
      if value = input.storage_class.try(&.to_json_object_key)
        headers["x-amz-storage-class"] = value
      end
      if value = input.website_redirect_location
        headers["x-amz-website-redirect-location"] = value
      end
      if value = input.sse_customer_algorithm
        headers["x-amz-server-side-encryption-customer-algorithm"] = value
      end
      if value = input.sse_customer_key
        headers["x-amz-server-side-encryption-customer-key"] = value
      end
      if value = input.sse_customer_key_md5
        headers["x-amz-server-side-encryption-customer-key-MD5"] = value
      end
      if value = input.ssekms_key_id
        headers["x-amz-server-side-encryption-aws-kms-key-id"] = value
      end
      if value = input.ssekms_encryption_context
        headers["x-amz-server-side-encryption-context"] = value
      end
      if value = input.bucket_key_enabled.try(&.to_s)
        headers["x-amz-server-side-encryption-bucket-key-enabled"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.tagging
        headers["x-amz-tagging"] = value
      end
      if value = input.object_lock_mode.try(&.to_json_object_key)
        headers["x-amz-object-lock-mode"] = value
      end
      if value = input.object_lock_retain_until_date.try { |time| Core::HeaderValue.format_date_time(time) }
        headers["x-amz-object-lock-retain-until-date"] = value
      end
      if value = input.object_lock_legal_hold_status.try(&.to_json_object_key)
        headers["x-amz-object-lock-legal-hold"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-checksum-algorithm"] = value
      end
      if value = input.checksum_type.try(&.to_json_object_key)
        headers["x-amz-checksum-type"] = value
      end
      (input.metadata || {} of String => String).each do |key, value|
        headers["x-amz-meta-#{key}"] = value
      end
      response = rest_request("CreateMultipartUpload", "POST", path, headers, nil, "application/xml")
      result = AS::CreateMultipartUploadOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.abort_date = Core::HeaderValue.http_time(response.headers["x-amz-abort-date"]?)
      result.abort_rule_id = response.headers["x-amz-abort-rule-id"]?
      result.server_side_encryption = response.headers["x-amz-server-side-encryption"]?.try { |value| AS::ServerSideEncryption.from_json_object_key?(value) }
      result.sse_customer_algorithm = response.headers["x-amz-server-side-encryption-customer-algorithm"]?
      result.sse_customer_key_md5 = response.headers["x-amz-server-side-encryption-customer-key-MD5"]?
      result.ssekms_key_id = response.headers["x-amz-server-side-encryption-aws-kms-key-id"]?
      result.ssekms_encryption_context = response.headers["x-amz-server-side-encryption-context"]?
      result.bucket_key_enabled = Core::HeaderValue.bool(response.headers["x-amz-server-side-encryption-bucket-key-enabled"]?)
      result.request_charged = response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) }
      result.checksum_algorithm = response.headers["x-amz-checksum-algorithm"]?.try { |value| AS::ChecksumAlgorithm.from_json_object_key?(value) }
      result.checksum_type = response.headers["x-amz-checksum-type"]?.try { |value| AS::ChecksumType.from_json_object_key?(value) }
      Core::ParsedResponse(AS::CreateMultipartUploadOutput).new(response, result)
    end

    # Creates a session that establishes temporary security credentials to support fast authentication
    # and authorization for the Zonal endpoint API operations on directory buckets. For more
    # information about Zonal endpoint API operations that include the Availability Zone in the
    # request endpoint, see [S3 Express One Zone
    # APIs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-APIs.html) in the *Amazon
    # S3 User Guide*.
    #
    # To make Zonal endpoint API requests on a directory bucket, use the `CreateSession` API
    # operation. Specifically, you grant `s3express:CreateSession` permission to a bucket in a bucket
    # policy or an IAM identity-based policy. Then, you use IAM credentials to make the
    # `CreateSession` API request on the bucket, which returns temporary security credentials that
    # include the access key ID, secret access key, session token, and expiration. These credentials
    # have associated permissions to access the Zonal endpoint API operations. After the session is
    # created, you don’t need to use other policies to grant permissions to each Zonal endpoint API
    # individually. Instead, in your Zonal endpoint API requests, you sign your requests by applying
    # the temporary security credentials of the session to the request headers and following the SigV4
    # protocol for authentication. You also apply the session token to the `x-amz-s3session-token`
    # request header for authorization. Temporary security credentials are scoped to the bucket and
    # expire after 5 minutes. After the expiration time, any calls that you make with those
    # credentials will fail. You must use IAM credentials again to make a `CreateSession` API request
    # that generates a new set of temporary credentials for use. Temporary credentials cannot be
    # extended or refreshed beyond the original specified interval.
    #
    # If you use Amazon Web Services SDKs, SDKs handle the session token refreshes automatically to
    # avoid service interruptions when a session expires. We recommend that you use the Amazon Web
    # Services SDKs to initiate and manage requests to the CreateSession API. For more information,
    # see [Performance guidelines and design
    # patterns](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-optimizing-performance-guidelines-design-patterns.html#s3-express-optimizing-performance-session-authentication)
    # in the *Amazon S3 User Guide*.
    #
    # - You must make requests for this API operation to the Zonal endpoint. These endpoints support
    # virtual-hosted-style requests in the format
    # `https://*bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`. Path-style requests are
    # not supported. For more information about endpoints in Availability Zones, see [Regional and
    # Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # - ** `CopyObject` API operation** - Unlike other Zonal endpoint API operations, the `CopyObject`
    # API operation doesn't use the temporary security credentials returned from the `CreateSession`
    # API operation for authentication and authorization. For information about authentication and
    # authorization of the `CopyObject` API operation on directory buckets, see
    # [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html).
    #
    # - ** `HeadBucket` API operation** - Unlike other Zonal endpoint API operations, the `HeadBucket`
    # API operation doesn't use the temporary security credentials returned from the `CreateSession`
    # API operation for authentication and authorization. For information about authentication and
    # authorization of the `HeadBucket` API operation on directory buckets, see
    # [HeadBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_HeadBucket.html).
    #
    # Permissions To obtain temporary security credentials, you must create a bucket policy or an IAM
    # identity-based policy that grants `s3express:CreateSession` permission to the bucket. In a
    # policy, you can have the `s3express:SessionMode` condition key to control who can create a
    # `ReadWrite` or `ReadOnly` session. For more information about `ReadWrite` or `ReadOnly`
    # sessions, see [ `x-amz-create-session-mode`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html#API_CreateSession_RequestParameters).
    # For example policies, see [Example bucket policies for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam-example-bucket-policies.html)
    # and [Amazon Web Services Identity and Access Management (IAM) identity-based policies for S3
    # Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam-identity-policies.html)
    # in the *Amazon S3 User Guide*.
    #
    # To grant cross-account access to Zonal endpoint API operations, the bucket policy should also
    # grant both accounts the `s3express:CreateSession` permission.
    #
    # If you want to encrypt objects with SSE-KMS, you must also have the `kms:GenerateDataKey` and
    # the `kms:Decrypt` permissions in IAM identity-based policies and KMS key policies for the target
    # KMS key.
    #
    # Encryption For directory buckets, there are only two supported options for server-side
    # encryption: server-side encryption with Amazon S3 managed keys (SSE-S3) (`AES256`) and
    # server-side encryption with KMS keys (SSE-KMS) (`aws:kms`). We recommend that the bucket's
    # default encryption uses the desired encryption configuration and you don't override the bucket
    # default encryption in your `CreateSession` requests or `PUT` object requests. Then, new objects
    # are automatically encrypted with the desired encryption settings. For more information, see
    # [Protecting data with server-side
    # encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-serv-side-encryption.html)
    # in the *Amazon S3 User Guide*. For more information about the encryption overriding behaviors in
    # directory buckets, see [Specifying server-side encryption with KMS for new object
    # uploads](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-specifying-kms-encryption.html).
    #
    # For [Zonal endpoint (object-level) API
    # operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-differences.html#s3-express-differences-api-operations)
    # except [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html) and
    # [UploadPartCopy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html), you
    # authenticate and authorize requests through
    # [CreateSession](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) for low
    # latency. To encrypt new objects in a directory bucket with SSE-KMS, you must specify SSE-KMS as
    # the directory bucket's default encryption configuration with a KMS key (specifically, a
    # [customer managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk)). Then,
    # when a session is created for Zonal endpoint API operations, new objects are automatically
    # encrypted and decrypted with SSE-KMS and S3 Bucket Keys during the session.
    #
    # Only 1 [customer managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk) is
    # supported per directory bucket for the lifetime of the bucket. The [Amazon Web Services managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk)
    # (`aws/s3`) isn't supported. After you specify SSE-KMS as your bucket's default encryption
    # configuration with a customer managed key, you can't change the customer managed key for the
    # bucket's SSE-KMS configuration.
    #
    # In the Zonal endpoint API calls (except
    # [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html) and
    # [UploadPartCopy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html)) using
    # the REST API, you can't override the values of the encryption settings
    # (`x-amz-server-side-encryption`, `x-amz-server-side-encryption-aws-kms-key-id`,
    # `x-amz-server-side-encryption-context`, and `x-amz-server-side-encryption-bucket-key-enabled`)
    # from the `CreateSession` request. You don't need to explicitly specify these encryption settings
    # values in Zonal endpoint API calls, and Amazon S3 will use the encryption settings values from
    # the `CreateSession` request to protect new objects in the directory bucket.
    #
    # When you use the CLI or the Amazon Web Services SDKs, for `CreateSession`, the session token
    # refreshes automatically to avoid service interruptions when a session expires. The CLI or the
    # Amazon Web Services SDKs use the bucket's default encryption configuration for the
    # `CreateSession` request. It's not supported to override the encryption settings values in the
    # `CreateSession` request. Also, in the Zonal endpoint API calls (except
    # [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html) and
    # [UploadPartCopy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html)), it's
    # not supported to override the values of the encryption settings from the `CreateSession`
    # request.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def create_session(input : AS::CreateSessionRequest) : Core::ParsedResponse(AS::CreateSessionOutput)
      Log.info { "performing 'CreateSession' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("session", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.session_mode.try(&.to_json_object_key)
        headers["x-amz-create-session-mode"] = value
      end
      if value = input.server_side_encryption.try(&.to_json_object_key)
        headers["x-amz-server-side-encryption"] = value
      end
      if value = input.ssekms_key_id
        headers["x-amz-server-side-encryption-aws-kms-key-id"] = value
      end
      if value = input.ssekms_encryption_context
        headers["x-amz-server-side-encryption-context"] = value
      end
      if value = input.bucket_key_enabled.try(&.to_s)
        headers["x-amz-server-side-encryption-bucket-key-enabled"] = value
      end
      response = rest_request("CreateSession", "GET", path, headers, nil, "application/xml")
      result = AS::CreateSessionOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.server_side_encryption = response.headers["x-amz-server-side-encryption"]?.try { |value| AS::ServerSideEncryption.from_json_object_key?(value) }
      result.ssekms_key_id = response.headers["x-amz-server-side-encryption-aws-kms-key-id"]?
      result.ssekms_encryption_context = response.headers["x-amz-server-side-encryption-context"]?
      result.bucket_key_enabled = Core::HeaderValue.bool(response.headers["x-amz-server-side-encryption-bucket-key-enabled"]?)
      Core::ParsedResponse(AS::CreateSessionOutput).new(response, result)
    end

    # Deletes the S3 bucket. All objects (including all object versions and delete markers) in the
    # bucket must be deleted before the bucket itself can be deleted.
    #
    # - **Directory buckets** - If multipart uploads in a directory bucket are in progress, you can't
    # delete the bucket until all the in-progress multipart uploads are aborted or completed.
    #
    # - **Directory buckets ** - For directory buckets, you must make requests for this API operation
    # to the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - You must have the `s3:DeleteBucket` permission on the
    # specified bucket in a policy.
    #
    # - **Directory bucket permissions** - You must have the `s3express:DeleteBucket` permission in an
    # IAM identity-based policy instead of a bucket policy. Cross-account access to this API operation
    # isn't supported. This operation can only be performed by the Amazon Web Services account that
    # owns the resource. For more information about directory bucket policies and permissions, see
    # [Amazon Web Services Identity and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `DeleteBucket`:
    #
    # - [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
    #
    # - [DeleteObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket(input : AS::DeleteBucketRequest) : Core::Response
      Log.info { "performing 'DeleteBucket' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucket", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Deletes an analytics configuration for the bucket (specified by the analytics configuration ID).
    #
    # To use this operation, you must have permissions to perform the `s3:PutAnalyticsConfiguration`
    # action. The bucket owner has this permission by default. The bucket owner can grant this
    # permission to others. For more information about permissions, see [Permissions Related to Bucket
    # Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # For information about the Amazon S3 analytics feature, see [Amazon S3 Analytics – Storage Class
    # Analysis](https://docs.aws.amazon.com/AmazonS3/latest/dev/analytics-storage-class.html).
    #
    # The following operations are related to `DeleteBucketAnalyticsConfiguration`:
    #
    # -
    # [GetBucketAnalyticsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAnalyticsConfiguration.html)
    #
    # -
    # [ListBucketAnalyticsConfigurations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketAnalyticsConfigurations.html)
    #
    # -
    # [PutBucketAnalyticsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAnalyticsConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_analytics_configuration(input : AS::DeleteBucketAnalyticsConfigurationRequest) : Core::Response
      Log.info { "performing 'DeleteBucketAnalyticsConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("analytics", "")
        if value = input.id
          form.add("id", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketAnalyticsConfiguration", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Deletes the `cors` configuration information set for the bucket.
    #
    # To use this operation, you must have permission to perform the `s3:PutBucketCORS` action. The
    # bucket owner has this permission by default and can grant this permission to others.
    #
    # For information about `cors`, see [Enabling Cross-Origin Resource
    # Sharing](https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html) in the *Amazon S3 User
    # Guide*.
    #
    # **Related Resources**
    #
    # - [PutBucketCors](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketCors.html)
    #
    # - [RESTOPTIONSobject](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTOPTIONSobject.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_cors(input : AS::DeleteBucketCorsRequest) : Core::Response
      Log.info { "performing 'DeleteBucketCors' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("cors", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketCors", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # This implementation of the DELETE action resets the default encryption for the bucket as
    # server-side encryption with Amazon S3 managed keys (SSE-S3).
    #
    # - **General purpose buckets** - For information about the bucket default encryption feature, see
    # [Amazon S3 Bucket Default
    # Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory buckets** - For directory buckets, there are only two supported options for
    # server-side encryption: SSE-S3 and SSE-KMS. For information about the default encryption
    # configuration in directory buckets, see [Setting default server-side encryption behavior for
    # directory
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-bucket-encryption.html).
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - The `s3:PutEncryptionConfiguration` permission is
    # required in a policy. The bucket owner has this permission by default. The bucket owner can
    # grant this permission to others. For more information about permissions, see [Permissions
    # Related to Bucket
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:PutEncryptionConfiguration` permission in an IAM identity-based policy instead of a
    # bucket policy. Cross-account access to this API operation isn't supported. This operation can
    # only be performed by the Amazon Web Services account that owns the resource. For more
    # information about directory bucket policies and permissions, see [Amazon Web Services Identity
    # and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `DeleteBucketEncryption`:
    #
    # -
    # [PutBucketEncryption](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketEncryption.html)
    #
    # -
    # [GetBucketEncryption](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketEncryption.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_encryption(input : AS::DeleteBucketEncryptionRequest) : Core::Response
      Log.info { "performing 'DeleteBucketEncryption' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("encryption", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketEncryption", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Deletes the S3 Intelligent-Tiering configuration from the specified bucket.
    #
    # The S3 Intelligent-Tiering storage class is designed to optimize storage costs by automatically
    # moving data to the most cost-effective storage access tier, without performance impact or
    # operational overhead. S3 Intelligent-Tiering delivers automatic cost savings in three low
    # latency and high throughput access tiers. To get the lowest storage cost on data that can be
    # accessed in minutes to hours, you can choose to activate additional archiving capabilities.
    #
    # The S3 Intelligent-Tiering storage class is the ideal storage class for data with unknown,
    # changing, or unpredictable access patterns, independent of object size or retention period. If
    # the size of an object is less than 128 KB, it is not monitored and not eligible for
    # auto-tiering. Smaller objects can be stored, but they are always charged at the Frequent Access
    # tier rates in the S3 Intelligent-Tiering storage class.
    #
    # For more information, see [Storage class for automatically optimizing frequently and
    # infrequently accessed
    # objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access).
    #
    # Operations related to `DeleteBucketIntelligentTieringConfiguration` include:
    #
    # -
    # [GetBucketIntelligentTieringConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketIntelligentTieringConfiguration.html)
    #
    # -
    # [PutBucketIntelligentTieringConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketIntelligentTieringConfiguration.html)
    #
    # -
    # [ListBucketIntelligentTieringConfigurations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketIntelligentTieringConfigurations.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_intelligent_tiering_configuration(input : AS::DeleteBucketIntelligentTieringConfigurationRequest) : Core::Response
      Log.info { "performing 'DeleteBucketIntelligentTieringConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("intelligent-tiering", "")
        if value = input.id
          form.add("id", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketIntelligentTieringConfiguration", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # Deletes an S3 Inventory configuration (identified by the inventory ID) from the bucket.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions To use this operation, you must have permissions to perform the
    # `s3:PutInventoryConfiguration` action. The bucket owner has this permission by default. The
    # bucket owner can grant this permission to others. For more information about permissions, see
    # [Permissions Related to Bucket Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # - **General purpose bucket permissions** - The `s3:PutInventoryConfiguration` permission is
    # required in a policy. For more information about general purpose buckets permissions, see [Using
    # Bucket Policies and User
    # Policies](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:PutInventoryConfiguration` permission in an IAM identity-based policy instead of a
    # bucket policy. For more information about directory bucket policies and permissions, see [Amazon
    # Web Services Identity and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # For information about the Amazon S3 inventory feature, see [Amazon S3
    # Inventory](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-inventory.html).
    #
    # After deleting a configuration, Amazon S3 might still deliver one additional inventory report
    # during a brief transition period while the system processes the deletion.
    #
    # Operations related to `DeleteBucketInventoryConfiguration` include:
    #
    # -
    # [GetBucketInventoryConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketInventoryConfiguration.html)
    #
    # -
    # [PutBucketInventoryConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketInventoryConfiguration.html)
    #
    # -
    # [ListBucketInventoryConfigurations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketInventoryConfigurations.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_inventory_configuration(input : AS::DeleteBucketInventoryConfigurationRequest) : Core::Response
      Log.info { "performing 'DeleteBucketInventoryConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("inventory", "")
        if value = input.id
          form.add("id", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketInventoryConfiguration", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # Deletes the lifecycle configuration from the specified bucket. Amazon S3 removes all the
    # lifecycle configuration rules in the lifecycle subresource associated with the bucket. Your
    # objects never expire, and Amazon S3 no longer automatically deletes any objects on the basis of
    # rules contained in the deleted lifecycle configuration.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - By default, all Amazon S3 resources are private,
    # including buckets, objects, and related subresources (for example, lifecycle configuration and
    # website configuration). Only the resource owner (that is, the Amazon Web Services account that
    # created it) can access the resource. The resource owner can optionally grant access permissions
    # to others by writing an access policy. For this operation, a user must have the
    # `s3:PutLifecycleConfiguration` permission.
    #
    # For more information about permissions, see [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # - **Directory bucket permissions** - You must have the `s3express:PutLifecycleConfiguration`
    # permission in an IAM identity-based policy to use this operation. Cross-account access to this
    # API operation isn't supported. The resource owner can optionally grant access permissions to
    # others by creating a role or user for them as long as they are within the same account as the
    # owner and resource.
    #
    # For more information about directory bucket policies and permissions, see [Authorizing Regional
    # endpoint APIs with
    # IAM](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region*.amazonaws.com`.
    #
    # For more information about the object expiration, see [Elements to Describe Lifecycle
    # Actions](https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#intro-lifecycle-rules-actions).
    #
    # Related actions include:
    #
    # -
    # [PutBucketLifecycleConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html)
    #
    # -
    # [GetBucketLifecycleConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycleConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_lifecycle(input : AS::DeleteBucketLifecycleRequest) : Core::Response
      Log.info { "performing 'DeleteBucketLifecycle' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("lifecycle", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketLifecycle", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # Deletes an S3 Metadata configuration from a general purpose bucket. For more information, see
    # [Accelerating data discovery with S3
    # Metadata](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-overview.html)
    # in the *Amazon S3 User Guide*.
    #
    # You can use the V2 `DeleteBucketMetadataConfiguration` API operation with V1 or V2 metadata
    # configurations. However, if you try to use the V1 `DeleteBucketMetadataTableConfiguration` API
    # operation with V2 configurations, you will receive an HTTP `405 Method Not Allowed` error.
    #
    # Permissions To use this operation, you must have the `s3:DeleteBucketMetadataTableConfiguration`
    # permission. For more information, see [Setting up permissions for configuring metadata
    # tables](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-permissions.html)
    # in the *Amazon S3 User Guide*.
    #
    # The IAM policy action name is the same for the V1 and V2 API operations.
    #
    # The following operations are related to `DeleteBucketMetadataConfiguration`:
    #
    # -
    # [CreateBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html)
    #
    # -
    # [GetBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetadataConfiguration.html)
    #
    # -
    # [UpdateBucketMetadataInventoryTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UpdateBucketMetadataInventoryTableConfiguration.html)
    #
    # -
    # [UpdateBucketMetadataJournalTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UpdateBucketMetadataJournalTableConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_metadata_configuration(input : AS::DeleteBucketMetadataConfigurationRequest) : Core::Response
      Log.info { "performing 'DeleteBucketMetadataConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("metadataConfiguration", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketMetadataConfiguration", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # We recommend that you delete your S3 Metadata configurations by using the V2
    # [DeleteBucketMetadataTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetadataTableConfiguration.html)
    # API operation. We no longer recommend using the V1 `DeleteBucketMetadataTableConfiguration` API
    # operation.
    #
    # If you created your S3 Metadata configuration before July 15, 2025, we recommend that you delete
    # and re-create your configuration by using
    # [CreateBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html)
    # so that you can expire journal table records and create a live inventory table.
    #
    # Deletes a V1 S3 Metadata configuration from a general purpose bucket. For more information, see
    # [Accelerating data discovery with S3
    # Metadata](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-overview.html)
    # in the *Amazon S3 User Guide*.
    #
    # You can use the V2 `DeleteBucketMetadataConfiguration` API operation with V1 or V2 metadata
    # table configurations. However, if you try to use the V1 `DeleteBucketMetadataTableConfiguration`
    # API operation with V2 configurations, you will receive an HTTP `405 Method Not Allowed` error.
    #
    # Make sure that you update your processes to use the new V2 API operations
    # (`CreateBucketMetadataConfiguration`, `GetBucketMetadataConfiguration`, and
    # `DeleteBucketMetadataConfiguration`) instead of the V1 API operations.
    #
    # Permissions To use this operation, you must have the `s3:DeleteBucketMetadataTableConfiguration`
    # permission. For more information, see [Setting up permissions for configuring metadata
    # tables](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-permissions.html)
    # in the *Amazon S3 User Guide*.
    #
    # The following operations are related to `DeleteBucketMetadataTableConfiguration`:
    #
    # -
    # [CreateBucketMetadataTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataTableConfiguration.html)
    #
    # -
    # [GetBucketMetadataTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetadataTableConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_metadata_table_configuration(input : AS::DeleteBucketMetadataTableConfigurationRequest) : Core::Response
      Log.info { "performing 'DeleteBucketMetadataTableConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("metadataTable", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketMetadataTableConfiguration", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # Deletes a metrics configuration for the Amazon CloudWatch request metrics (specified by the
    # metrics configuration ID) from the bucket. Note that this doesn't include the daily storage
    # metrics.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions To use this operation, you must have permissions to perform the
    # `s3:PutMetricsConfiguration` action. The bucket owner has this permission by default. The bucket
    # owner can grant this permission to others. For more information about permissions, see
    # [Permissions Related to Bucket Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # - **General purpose bucket permissions** - The `s3:PutMetricsConfiguration` permission is
    # required in a policy. For more information about general purpose buckets permissions, see [Using
    # Bucket Policies and User
    # Policies](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:PutMetricsConfiguration` permission in an IAM identity-based policy instead of a
    # bucket policy. Cross-account access to this API operation isn't supported. This operation can
    # only be performed by the Amazon Web Services account that owns the resource. For more
    # information about directory bucket policies and permissions, see [Amazon Web Services Identity
    # and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # For information about CloudWatch request metrics for Amazon S3, see [Monitoring Metrics with
    # Amazon CloudWatch](https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html).
    #
    # The following operations are related to `DeleteBucketMetricsConfiguration`:
    #
    # -
    # [GetBucketMetricsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetricsConfiguration.html)
    #
    # -
    # [PutBucketMetricsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketMetricsConfiguration.html)
    #
    # -
    # [ListBucketMetricsConfigurations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketMetricsConfigurations.html)
    #
    # - [Monitoring Metrics with Amazon
    # CloudWatch](https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_metrics_configuration(input : AS::DeleteBucketMetricsConfigurationRequest) : Core::Response
      Log.info { "performing 'DeleteBucketMetricsConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("metrics", "")
        if value = input.id
          form.add("id", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketMetricsConfiguration", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Removes `OwnershipControls` for an Amazon S3 bucket. To use this operation, you must have the
    # `s3:PutBucketOwnershipControls` permission. For more information about Amazon S3 permissions,
    # see [Specifying Permissions in a
    # Policy](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html).
    #
    # For information about Amazon S3 Object Ownership, see [Using Object
    # Ownership](https://docs.aws.amazon.com/AmazonS3/latest/dev/about-object-ownership.html).
    #
    # The following operations are related to `DeleteBucketOwnershipControls`:
    #
    # - GetBucketOwnershipControls
    #
    # - PutBucketOwnershipControls
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_ownership_controls(input : AS::DeleteBucketOwnershipControlsRequest) : Core::Response
      Log.info { "performing 'DeleteBucketOwnershipControls' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("ownershipControls", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketOwnershipControls", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # Deletes the policy of a specified bucket.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions If you are using an identity other than the root user of the Amazon Web Services
    # account that owns the bucket, the calling identity must both have the `DeleteBucketPolicy`
    # permissions on the specified bucket and belong to the bucket owner's account in order to use
    # this operation.
    #
    # If you don't have `DeleteBucketPolicy` permissions, Amazon S3 returns a `403 Access Denied`
    # error. If you have the correct permissions, but you're not using an identity that belongs to the
    # bucket owner's account, Amazon S3 returns a `405 Method Not Allowed` error.
    #
    # To ensure that bucket owners don't inadvertently lock themselves out of their own buckets, the
    # root principal in a bucket owner's Amazon Web Services account can perform the
    # `GetBucketPolicy`, `PutBucketPolicy`, and `DeleteBucketPolicy` API actions, even if their bucket
    # policy explicitly denies the root principal's access. Bucket owner root principals can only be
    # blocked from performing these API actions by VPC endpoint policies and Amazon Web Services
    # Organizations policies.
    #
    # - **General purpose bucket permissions** - The `s3:DeleteBucketPolicy` permission is required in
    # a policy. For more information about general purpose buckets bucket policies, see [Using Bucket
    # Policies and User
    # Policies](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:DeleteBucketPolicy` permission in an IAM identity-based policy instead of a bucket
    # policy. Cross-account access to this API operation isn't supported. This operation can only be
    # performed by the Amazon Web Services account that owns the resource. For more information about
    # directory bucket policies and permissions, see [Amazon Web Services Identity and Access
    # Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `DeleteBucketPolicy`
    #
    # - [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
    #
    # - [DeleteObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_policy(input : AS::DeleteBucketPolicyRequest) : Core::Response
      Log.info { "performing 'DeleteBucketPolicy' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("policy", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketPolicy", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Deletes the replication configuration from the bucket.
    #
    # To use this operation, you must have permissions to perform the `s3:PutReplicationConfiguration`
    # action. The bucket owner has these permissions by default and can grant it to others. For more
    # information about permissions, see [Permissions Related to Bucket Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # It can take a while for the deletion of a replication configuration to fully propagate.
    #
    # For information about replication configuration, see
    # [Replication](https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html) in the *Amazon
    # S3 User Guide*.
    #
    # The following operations are related to `DeleteBucketReplication`:
    #
    # -
    # [PutBucketReplication](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketReplication.html)
    #
    # -
    # [GetBucketReplication](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketReplication.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_replication(input : AS::DeleteBucketReplicationRequest) : Core::Response
      Log.info { "performing 'DeleteBucketReplication' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("replication", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketReplication", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Deletes tags from the general purpose bucket if attribute based access control (ABAC) is not
    # enabled for the bucket. When you [enable ABAC for a general purpose
    # bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/buckets-tagging-enable-abac.html),
    # you can no longer use this operation for that bucket and must use
    # [UntagResource](https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_UntagResource.html)
    # instead.
    #
    # To use this operation, you must have permission to perform the `s3:PutBucketTagging` action. By
    # default, the bucket owner has this permission and can grant this permission to others.
    #
    # The following operations are related to `DeleteBucketTagging`:
    #
    # - [GetBucketTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketTagging.html)
    #
    # - [PutBucketTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketTagging.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_tagging(input : AS::DeleteBucketTaggingRequest) : Core::Response
      Log.info { "performing 'DeleteBucketTagging' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("tagging", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketTagging", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # This action removes the website configuration for a bucket. Amazon S3 returns a `200 OK`
    # response upon successfully deleting a website configuration on the specified bucket. You will
    # get a `200 OK` response if the website configuration you are trying to delete does not exist on
    # the bucket. Amazon S3 returns a `404` response if the bucket specified in the request does not
    # exist.
    #
    # This DELETE action requires the `S3:DeleteBucketWebsite` permission. By default, only the bucket
    # owner can delete the website configuration attached to a bucket. However, bucket owners can
    # grant other users permission to delete the website configuration by writing a bucket policy
    # granting them the `S3:DeleteBucketWebsite` permission.
    #
    # For more information about hosting websites, see [Hosting Websites on Amazon
    # S3](https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html).
    #
    # The following operations are related to `DeleteBucketWebsite`:
    #
    # - [GetBucketWebsite](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketWebsite.html)
    #
    # - [PutBucketWebsite](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketWebsite.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_bucket_website(input : AS::DeleteBucketWebsiteRequest) : Core::Response
      Log.info { "performing 'DeleteBucketWebsite' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("website", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteBucketWebsite", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # Removes an object from a bucket. The behavior depends on the bucket's versioning state:
    #
    # - If bucket versioning is not enabled, the operation permanently deletes the object.
    #
    # - If bucket versioning is enabled, the operation inserts a delete marker, which becomes the
    # current version of the object. To permanently delete an object in a versioned bucket, you must
    # include the object’s `versionId` in the request. For more information about versioning-enabled
    # buckets, see [Deleting object versions from a versioning-enabled
    # bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/DeletingObjectVersions.html).
    #
    # - If bucket versioning is suspended, the operation removes the object that has a null
    # `versionId`, if there is one, and inserts a delete marker that becomes the current version of
    # the object. If there isn't an object with a null `versionId`, and all versions of the object
    # have a `versionId`, Amazon S3 does not remove the object and only inserts a delete marker. To
    # permanently delete an object that has a `versionId`, you must include the object’s `versionId`
    # in the request. For more information about versioning-suspended buckets, see [Deleting objects
    # from versioning-suspended
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/DeletingObjectsfromVersioningSuspendedBuckets.html).
    #
    # - **Directory buckets** - S3 Versioning isn't enabled and supported for directory buckets. For
    # this API operation, only the `null` value of the version ID is supported by directory buckets.
    # You can only specify `null` to the `versionId` query parameter in the request.
    #
    # - **Directory buckets** - For directory buckets, you must make requests for this API operation
    # to the Zonal endpoint. These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # To remove a specific version, you must use the `versionId` query parameter. Using this query
    # parameter permanently deletes the version. If the object deleted is a delete marker, Amazon S3
    # sets the response header `x-amz-delete-marker` to true.
    #
    # If the object you want to delete is in a bucket where the bucket versioning configuration is MFA
    # Delete enabled, you must include the `x-amz-mfa` request header in the DELETE `versionId`
    # request. Requests that include `x-amz-mfa` must use HTTPS. For more information about MFA
    # Delete, see [Using MFA
    # Delete](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMFADelete.html) in the *Amazon S3
    # User Guide*. To see sample requests that use versioning, see [Sample
    # Request](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectDELETE.html#ExampleVersionObjectDelete).
    #
    # **Directory buckets** - MFA delete is not supported by directory buckets.
    #
    # You can delete objects by explicitly calling DELETE Object or calling
    # ([PutBucketLifecycle](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycle.html))
    # to enable Amazon S3 to remove them for you. If you want to block users or accounts from removing
    # or deleting objects from your bucket, you must deny them the `s3:DeleteObject`,
    # `s3:DeleteObjectVersion`, and `s3:PutLifeCycleConfiguration` actions.
    #
    # **Directory buckets** - S3 Lifecycle is not supported by directory buckets.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - The following permissions are required in your
    # policies when your `DeleteObjects` request includes specific headers.
    #
    # - ** `s3:DeleteObject` ** - To delete an object from a bucket, you must always have the
    # `s3:DeleteObject` permission.
    #
    # - ** `s3:DeleteObjectVersion` ** - To delete a specific version of an object from a
    # versioning-enabled bucket, you must have the `s3:DeleteObjectVersion` permission.
    #
    # If the `s3:DeleteObject` or `s3:DeleteObjectVersion` permissions are explicitly denied in your
    # bucket policy, attempts to delete any unversioned objects result in a `403 Access Denied` error.
    #
    # - **Directory bucket permissions** - To grant access to this API operation on a directory
    # bucket, we recommend that you use the [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) API operation for
    # session-based authorization. Specifically, you grant the `s3express:CreateSession` permission to
    # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
    # `CreateSession` API call on the bucket to obtain a session token. With the session token in your
    # request header, you can make API requests to this operation. After the session token expires,
    # you make another `CreateSession` API call to generate a new session token for use. Amazon Web
    # Services CLI or SDKs create session and refresh the session token automatically to avoid service
    # interruptions when a session expires. For more information about authorization, see [
    # `CreateSession` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html).
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # The following action is related to `DeleteObject`:
    #
    # - [PutObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    #
    # The `If-Match` header is supported for both general purpose and directory buckets.
    # `IfMatchLastModifiedTime` and `IfMatchSize` is only supported for directory buckets.
    def delete_object(input : AS::DeleteObjectRequest) : Core::Response
      Log.info { "performing 'DeleteObject' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("x-id", "DeleteObject")
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.mfa
        headers["x-amz-mfa"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.bypass_governance_retention.try(&.to_s)
        headers["x-amz-bypass-governance-retention"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.if_match
        headers["If-Match"] = value
      end
      if value = input.if_match_last_modified_time.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["x-amz-if-match-last-modified-time"] = value
      end
      if value = input.if_match_size.try(&.to_s)
        headers["x-amz-if-match-size"] = value
      end
      response = rest_request("DeleteObject", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # Deletes a specific annotation from an Amazon S3 object. Use the `x-amz-object-if-match` header
    # to perform a conditional delete that only succeeds if the object's ETag matches the provided
    # value, preventing race conditions during concurrent updates.
    #
    # Deleting an annotation is permanent. Annotations are not independently versioned, so there is no
    # delete marker or way to recover a deleted annotation.
    #
    # To use this operation, you must have the `s3:DeleteObjectAnnotation` permission. If the object
    # is protected by Object Lock in governance mode, you must also include the
    # `x-amz-bypass-governance-retention` header.
    #
    # Annotations are not supported by the following features: S3 Inventory Reports, API Gateway, S3
    # Storage Lens, Amazon S3 File Gateway, Amazon FSx, S3 on Outposts, and S3 Express One Zone
    # (directory buckets).
    #
    # The following operations are related to `DeleteObjectAnnotation`:
    #
    # -
    # [PutObjectAnnotation](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectAnnotation.html)
    #
    # -
    # [GetObjectAnnotation](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAnnotation.html)
    #
    # -
    # [ListObjectAnnotations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectAnnotations.html)
    def delete_object_annotation(input : AS::DeleteObjectAnnotationRequest) : Core::Response
      Log.info { "performing 'DeleteObjectAnnotation' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("annotation", "")
        if value = input.annotation_name
          form.add("annotationName", value)
        end
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.object_if_match
        headers["x-amz-object-if-match"] = value
      end
      response = rest_request("DeleteObjectAnnotation", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # This operation enables you to delete multiple objects from a bucket using a single HTTP request.
    # If you know the object keys that you want to delete, then this operation provides a suitable
    # alternative to sending individual delete requests, reducing per-request overhead.
    #
    # The request can contain a list of up to 1,000 keys that you want to delete. In the XML, you
    # provide the object key names, and optionally, version IDs if you want to delete a specific
    # version of the object from a versioning-enabled bucket. For each key, Amazon S3 performs a
    # delete operation and returns the result of that delete, success or failure, in the response. If
    # the object specified in the request isn't found, Amazon S3 confirms the deletion by returning
    # the result as deleted.
    #
    # - **Directory buckets** - S3 Versioning isn't enabled and supported for directory buckets.
    #
    # - **Directory buckets** - For directory buckets, you must make requests for this API operation
    # to the Zonal endpoint. These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # The operation supports two modes for the response: verbose and quiet. By default, the operation
    # uses verbose mode in which the response includes the result of deletion of each key in your
    # request. In quiet mode the response includes only keys where the delete operation encountered an
    # error. For a successful deletion in a quiet mode, the operation does not return any information
    # about the delete in the response body.
    #
    # When performing this action on an MFA Delete enabled bucket, that attempts to delete any
    # versioned objects, you must include an MFA token. If you do not provide one, the entire request
    # will fail, even if there are non-versioned objects you are trying to delete. If you provide an
    # invalid token, whether there are versioned keys in the request or not, the entire Multi-Object
    # Delete request will fail. For information about MFA Delete, see [MFA
    # Delete](https://docs.aws.amazon.com/AmazonS3/latest/dev/Versioning.html#MultiFactorAuthenticationDelete)
    # in the *Amazon S3 User Guide*.
    #
    # **Directory buckets** - MFA delete is not supported by directory buckets.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - The following permissions are required in your
    # policies when your `DeleteObjects` request includes specific headers.
    #
    # - ** `s3:DeleteObject` ** - To delete an object from a bucket, you must always specify the
    # `s3:DeleteObject` permission.
    #
    # - ** `s3:DeleteObjectVersion` ** - To delete a specific version of an object from a
    # versioning-enabled bucket, you must specify the `s3:DeleteObjectVersion` permission.
    #
    # If the `s3:DeleteObject` or `s3:DeleteObjectVersion` permissions are explicitly denied in your
    # bucket policy, attempts to delete any unversioned objects result in a `403 Access Denied` error.
    #
    # - **Directory bucket permissions** - To grant access to this API operation on a directory
    # bucket, we recommend that you use the [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) API operation for
    # session-based authorization. Specifically, you grant the `s3express:CreateSession` permission to
    # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
    # `CreateSession` API call on the bucket to obtain a session token. With the session token in your
    # request header, you can make API requests to this operation. After the session token expires,
    # you make another `CreateSession` API call to generate a new session token for use. Amazon Web
    # Services CLI or SDKs create session and refresh the session token automatically to avoid service
    # interruptions when a session expires. For more information about authorization, see [
    # `CreateSession` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html).
    #
    # Content-MD5 request header
    #
    # - **General purpose bucket** - The Content-MD5 request header is required for all Multi-Object
    # Delete requests. Amazon S3 uses the header value to ensure that your request body has not been
    # altered in transit.
    #
    # - **Directory bucket** - The Content-MD5 request header or a additional checksum request header
    # (including `x-amz-checksum-crc32`, `x-amz-checksum-crc32c`, `x-amz-checksum-sha1`, or
    # `x-amz-checksum-sha256`) is required for all Multi-Object Delete requests.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `DeleteObjects`:
    #
    # -
    # [CreateMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html)
    #
    # - [UploadPart](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html)
    #
    # -
    # [CompleteMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html)
    #
    # - [ListParts](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html)
    #
    # -
    # [AbortMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_objects(input : AS::DeleteObjectsRequest) : Core::ParsedResponse(AS::DeleteObjectsOutput)
      Log.info { "performing 'DeleteObjects' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("delete", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.mfa
        headers["x-amz-mfa"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.bypass_governance_retention.try(&.to_s)
        headers["x-amz-bypass-governance-retention"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      response = rest_request("DeleteObjects", "POST", path, headers, input.delete.try(&.to_xml("Delete")), "application/xml")
      result = AS::DeleteObjectsOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.request_charged = response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) }
      Core::ParsedResponse(AS::DeleteObjectsOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Removes the entire tag set from the specified object. For more information about managing object
    # tags, see [ Object
    # Tagging](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-tagging.html).
    #
    # To use this operation, you must have permission to perform the `s3:DeleteObjectTagging` action.
    #
    # To delete tags of a specific object version, add the `versionId` query parameter in the request.
    # You will need permission for the `s3:DeleteObjectVersionTagging` action.
    #
    # The following operations are related to `DeleteObjectTagging`:
    #
    # - [PutObjectTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectTagging.html)
    #
    # - [GetObjectTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_object_tagging(input : AS::DeleteObjectTaggingRequest) : Core::Response
      Log.info { "performing 'DeleteObjectTagging' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("tagging", "")
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeleteObjectTagging", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Removes the `PublicAccessBlock` configuration for an Amazon S3 bucket. This operation removes
    # the bucket-level configuration only. The effective public access behavior will still be governed
    # by account-level settings (which may inherit from organization-level policies). To use this
    # operation, you must have the `s3:PutBucketPublicAccessBlock` permission. For more information
    # about permissions, see [Permissions Related to Bucket Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # The following operations are related to `DeletePublicAccessBlock`:
    #
    # - [Using Amazon S3 Block Public
    # Access](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html)
    #
    # -
    # [GetPublicAccessBlock](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetPublicAccessBlock.html)
    #
    # -
    # [PutPublicAccessBlock](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutPublicAccessBlock.html)
    #
    # -
    # [GetBucketPolicyStatus](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketPolicyStatus.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def delete_public_access_block(input : AS::DeletePublicAccessBlockRequest) : Core::Response
      Log.info { "performing 'DeletePublicAccessBlock' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("publicAccessBlock", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("DeletePublicAccessBlock", "DELETE", path, headers, nil, "application/xml")
      Core::Response.new(response)
    end

    # Returns the attribute-based access control (ABAC) property of the general purpose bucket. If
    # ABAC is enabled on your bucket, you can use tags on the bucket for access control. For more
    # information, see [Enabling ABAC in general purpose
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/buckets-tagging-enable-abac.html).
    def get_bucket_abac(input : AS::GetBucketAbacRequest) : Core::ParsedResponse(AS::GetBucketAbacOutput)
      Log.info { "performing 'GetBucketAbac' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("abac", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketAbac", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketAbacOutput.new(
        abac_status: AbacStatus.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetBucketAbacOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # This implementation of the GET action uses the `accelerate` subresource to return the Transfer
    # Acceleration state of a bucket, which is either `Enabled` or `Suspended`. Amazon S3 Transfer
    # Acceleration is a bucket-level feature that enables you to perform faster data transfers to and
    # from Amazon S3.
    #
    # To use this operation, you must have permission to perform the `s3:GetAccelerateConfiguration`
    # action. The bucket owner has this permission by default. The bucket owner can grant this
    # permission to others. For more information about permissions, see [Permissions Related to Bucket
    # Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html) in the
    # *Amazon S3 User Guide*.
    #
    # You set the Transfer Acceleration state of an existing bucket to `Enabled` or `Suspended` by
    # using the
    # [PutBucketAccelerateConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAccelerateConfiguration.html)
    # operation.
    #
    # A GET `accelerate` request does not return a state value for a bucket that has no transfer
    # acceleration state. A bucket has no Transfer Acceleration state if a state has never been set on
    # the bucket.
    #
    # For more information about transfer acceleration, see [Transfer
    # Acceleration](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html) in the
    # Amazon S3 User Guide.
    #
    # The following operations are related to `GetBucketAccelerateConfiguration`:
    #
    # -
    # [PutBucketAccelerateConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAccelerateConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_accelerate_configuration(input : AS::GetBucketAccelerateConfigurationRequest) : Core::ParsedResponse(AS::GetBucketAccelerateConfigurationOutput)
      Log.info { "performing 'GetBucketAccelerateConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("accelerate", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      response = rest_request("GetBucketAccelerateConfiguration", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketAccelerateConfigurationOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.request_charged = response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) }
      Core::ParsedResponse(AS::GetBucketAccelerateConfigurationOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # This implementation of the `GET` action uses the `acl` subresource to return the access control
    # list (ACL) of a bucket. To use `GET` to return the ACL of the bucket, you must have the
    # `READ_ACP` access to the bucket. If `READ_ACP` permission is granted to the anonymous user, you
    # can return the ACL of the bucket without using an authorization header.
    #
    # When you use this API operation with an access point, provide the alias of the access point in
    # place of the bucket name.
    #
    # When you use this API operation with an Object Lambda access point, provide the alias of the
    # Object Lambda access point in place of the bucket name. If the Object Lambda access point alias
    # in a request is not valid, the error code `InvalidAccessPointAliasError` is returned. For more
    # information about `InvalidAccessPointAliasError`, see [List of Error
    # Codes](https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ErrorCodeList).
    #
    # If your bucket uses the bucket owner enforced setting for S3 Object Ownership, requests to read
    # ACLs are still supported and return the `bucket-owner-full-control` ACL with the owner being the
    # account that created the bucket. For more information, see [ Controlling object ownership and
    # disabling
    # ACLs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html) in the
    # *Amazon S3 User Guide*.
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    #
    # The following operations are related to `GetBucketAcl`:
    #
    # - [ListObjects](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjects.html)
    def get_bucket_acl(input : AS::GetBucketAclRequest) : Core::ParsedResponse(AS::GetBucketAclOutput)
      Log.info { "performing 'GetBucketAcl' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("acl", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketAcl", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketAclOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::GetBucketAclOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # This implementation of the GET action returns an analytics configuration (identified by the
    # analytics configuration ID) from the bucket.
    #
    # To use this operation, you must have permissions to perform the `s3:GetAnalyticsConfiguration`
    # action. The bucket owner has this permission by default. The bucket owner can grant this
    # permission to others. For more information about permissions, see [ Permissions Related to
    # Bucket Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html) in the
    # *Amazon S3 User Guide*.
    #
    # For information about Amazon S3 analytics feature, see [Amazon S3 Analytics – Storage Class
    # Analysis](https://docs.aws.amazon.com/AmazonS3/latest/dev/analytics-storage-class.html) in the
    # *Amazon S3 User Guide*.
    #
    # The following operations are related to `GetBucketAnalyticsConfiguration`:
    #
    # -
    # [DeleteBucketAnalyticsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketAnalyticsConfiguration.html)
    #
    # -
    # [ListBucketAnalyticsConfigurations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketAnalyticsConfigurations.html)
    #
    # -
    # [PutBucketAnalyticsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAnalyticsConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_analytics_configuration(input : AS::GetBucketAnalyticsConfigurationRequest) : Core::ParsedResponse(AS::GetBucketAnalyticsConfigurationOutput)
      Log.info { "performing 'GetBucketAnalyticsConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("analytics", "")
        form.add("x-id", "GetBucketAnalyticsConfiguration")
        if value = input.id
          form.add("id", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketAnalyticsConfiguration", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketAnalyticsConfigurationOutput.new(
        analytics_configuration: AnalyticsConfiguration.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetBucketAnalyticsConfigurationOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns the Cross-Origin Resource Sharing (CORS) configuration information set for the bucket.
    #
    # To use this operation, you must have permission to perform the `s3:GetBucketCORS` action. By
    # default, the bucket owner has this permission and can grant it to others.
    #
    # When you use this API operation with an access point, provide the alias of the access point in
    # place of the bucket name.
    #
    # When you use this API operation with an Object Lambda access point, provide the alias of the
    # Object Lambda access point in place of the bucket name. If the Object Lambda access point alias
    # in a request is not valid, the error code `InvalidAccessPointAliasError` is returned. For more
    # information about `InvalidAccessPointAliasError`, see [List of Error
    # Codes](https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ErrorCodeList).
    #
    # For more information about CORS, see [ Enabling Cross-Origin Resource
    # Sharing](https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html).
    #
    # The following operations are related to `GetBucketCors`:
    #
    # - [PutBucketCors](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketCors.html)
    #
    # - [DeleteBucketCors](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketCors.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_cors(input : AS::GetBucketCorsRequest) : Core::ParsedResponse(AS::GetBucketCorsOutput)
      Log.info { "performing 'GetBucketCors' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("cors", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketCors", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketCorsOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::GetBucketCorsOutput).new(response, result)
    end

    # Returns the default encryption configuration for an Amazon S3 bucket. By default, all buckets
    # have a default encryption configuration that uses server-side encryption with Amazon S3 managed
    # keys (SSE-S3). This operation also returns the
    # [BucketKeyEnabled](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ServerSideEncryptionRule.html#AmazonS3-Type-ServerSideEncryptionRule-BucketKeyEnabled)
    # and
    # [BlockedEncryptionTypes](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ServerSideEncryptionRule.html#AmazonS3-Type-ServerSideEncryptionRule-BlockedEncryptionTypes)
    # statuses.
    #
    # - **General purpose buckets** - For information about the bucket default encryption feature, see
    # [Amazon S3 Bucket Default
    # Encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-encryption.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory buckets** - For directory buckets, there are only two supported options for
    # server-side encryption: SSE-S3 and SSE-KMS. For information about the default encryption
    # configuration in directory buckets, see [Setting default server-side encryption behavior for
    # directory
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-bucket-encryption.html).
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - The `s3:GetEncryptionConfiguration` permission is
    # required in a policy. The bucket owner has this permission by default. The bucket owner can
    # grant this permission to others. For more information about permissions, see [Permissions
    # Related to Bucket
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:GetEncryptionConfiguration` permission in an IAM identity-based policy instead of a
    # bucket policy. Cross-account access to this API operation isn't supported. This operation can
    # only be performed by the Amazon Web Services account that owns the resource. For more
    # information about directory bucket policies and permissions, see [Amazon Web Services Identity
    # and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `GetBucketEncryption`:
    #
    # -
    # [PutBucketEncryption](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketEncryption.html)
    #
    # -
    # [DeleteBucketEncryption](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketEncryption.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_encryption(input : AS::GetBucketEncryptionRequest) : Core::ParsedResponse(AS::GetBucketEncryptionOutput)
      Log.info { "performing 'GetBucketEncryption' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("encryption", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketEncryption", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketEncryptionOutput.new(
        server_side_encryption_configuration: ServerSideEncryptionConfiguration.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetBucketEncryptionOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Gets the S3 Intelligent-Tiering configuration from the specified bucket.
    #
    # The S3 Intelligent-Tiering storage class is designed to optimize storage costs by automatically
    # moving data to the most cost-effective storage access tier, without performance impact or
    # operational overhead. S3 Intelligent-Tiering delivers automatic cost savings in three low
    # latency and high throughput access tiers. To get the lowest storage cost on data that can be
    # accessed in minutes to hours, you can choose to activate additional archiving capabilities.
    #
    # The S3 Intelligent-Tiering storage class is the ideal storage class for data with unknown,
    # changing, or unpredictable access patterns, independent of object size or retention period. If
    # the size of an object is less than 128 KB, it is not monitored and not eligible for
    # auto-tiering. Smaller objects can be stored, but they are always charged at the Frequent Access
    # tier rates in the S3 Intelligent-Tiering storage class.
    #
    # For more information, see [Storage class for automatically optimizing frequently and
    # infrequently accessed
    # objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access).
    #
    # Operations related to `GetBucketIntelligentTieringConfiguration` include:
    #
    # -
    # [DeleteBucketIntelligentTieringConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketIntelligentTieringConfiguration.html)
    #
    # -
    # [PutBucketIntelligentTieringConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketIntelligentTieringConfiguration.html)
    #
    # -
    # [ListBucketIntelligentTieringConfigurations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketIntelligentTieringConfigurations.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_intelligent_tiering_configuration(input : AS::GetBucketIntelligentTieringConfigurationRequest) : Core::ParsedResponse(AS::GetBucketIntelligentTieringConfigurationOutput)
      Log.info { "performing 'GetBucketIntelligentTieringConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("intelligent-tiering", "")
        form.add("x-id", "GetBucketIntelligentTieringConfiguration")
        if value = input.id
          form.add("id", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketIntelligentTieringConfiguration", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketIntelligentTieringConfigurationOutput.new(
        intelligent_tiering_configuration: IntelligentTieringConfiguration.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetBucketIntelligentTieringConfigurationOutput).new(response, result)
    end

    # Returns an S3 Inventory configuration (identified by the inventory configuration ID) from the
    # bucket.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions To use this operation, you must have permissions to perform the
    # `s3:GetInventoryConfiguration` action. The bucket owner has this permission by default. The
    # bucket owner can grant this permission to others. For more information about permissions, see
    # [Permissions Related to Bucket Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # - **General purpose bucket permissions** - The `s3:GetInventoryConfiguration` permission is
    # required in a policy. For more information about general purpose buckets permissions, see [Using
    # Bucket Policies and User
    # Policies](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:GetInventoryConfiguration` permission in an IAM identity-based policy instead of a
    # bucket policy. For more information about directory bucket policies and permissions, see [Amazon
    # Web Services Identity and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # For information about the Amazon S3 inventory feature, see [Amazon S3
    # Inventory](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-inventory.html).
    #
    # The following operations are related to `GetBucketInventoryConfiguration`:
    #
    # -
    # [DeleteBucketInventoryConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketInventoryConfiguration.html)
    #
    # -
    # [ListBucketInventoryConfigurations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketInventoryConfigurations.html)
    #
    # -
    # [PutBucketInventoryConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketInventoryConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_inventory_configuration(input : AS::GetBucketInventoryConfigurationRequest) : Core::ParsedResponse(AS::GetBucketInventoryConfigurationOutput)
      Log.info { "performing 'GetBucketInventoryConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("inventory", "")
        form.add("x-id", "GetBucketInventoryConfiguration")
        if value = input.id
          form.add("id", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketInventoryConfiguration", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketInventoryConfigurationOutput.new(
        inventory_configuration: InventoryConfiguration.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetBucketInventoryConfigurationOutput).new(response, result)
    end

    # Returns the lifecycle configuration information set on the bucket. For information about
    # lifecycle configuration, see [Object Lifecycle
    # Management](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html).
    #
    # Bucket lifecycle configuration now supports specifying a lifecycle rule using an object key name
    # prefix, one or more object tags, object size, or any combination of these. Accordingly, this
    # section describes the latest API, which is compatible with the new functionality. The previous
    # version of the API supported filtering based only on an object key name prefix, which is
    # supported for general purpose buckets for backward compatibility. For the related API
    # description, see
    # [GetBucketLifecycle](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycle.html).
    #
    # Lifecyle configurations for directory buckets only support expiring objects and cancelling
    # multipart uploads. Expiring of versioned objects, transitions and tag filters are not supported.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - By default, all Amazon S3 resources are private,
    # including buckets, objects, and related subresources (for example, lifecycle configuration and
    # website configuration). Only the resource owner (that is, the Amazon Web Services account that
    # created it) can access the resource. The resource owner can optionally grant access permissions
    # to others by writing an access policy. For this operation, a user must have the
    # `s3:GetLifecycleConfiguration` permission.
    #
    # For more information about permissions, see [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # - **Directory bucket permissions** - You must have the `s3express:GetLifecycleConfiguration`
    # permission in an IAM identity-based policy to use this operation. Cross-account access to this
    # API operation isn't supported. The resource owner can optionally grant access permissions to
    # others by creating a role or user for them as long as they are within the same account as the
    # owner and resource.
    #
    # For more information about directory bucket policies and permissions, see [Authorizing Regional
    # endpoint APIs with
    # IAM](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region*.amazonaws.com`.
    #
    # `GetBucketLifecycleConfiguration` has the following special error:
    #
    # - Error code: `NoSuchLifecycleConfiguration`
    #
    # - Description: The lifecycle configuration does not exist.
    #
    # - HTTP Status Code: 404 Not Found
    #
    # - SOAP Fault Code Prefix: Client
    #
    # The following operations are related to `GetBucketLifecycleConfiguration`:
    #
    # -
    # [GetBucketLifecycle](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycle.html)
    #
    # -
    # [PutBucketLifecycle](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycle.html)
    #
    # -
    # [DeleteBucketLifecycle](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketLifecycle.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_lifecycle_configuration(input : AS::GetBucketLifecycleConfigurationRequest) : Core::ParsedResponse(AS::GetBucketLifecycleConfigurationOutput)
      Log.info { "performing 'GetBucketLifecycleConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("lifecycle", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketLifecycleConfiguration", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketLifecycleConfigurationOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.transition_default_minimum_object_size = response.headers["x-amz-transition-default-minimum-object-size"]?.try { |value| AS::TransitionDefaultMinimumObjectSize.from_json_object_key?(value) }
      Core::ParsedResponse(AS::GetBucketLifecycleConfigurationOutput).new(response, result)
    end

    # Using the `GetBucketLocation` operation is no longer a best practice. To return the Region that
    # a bucket resides in, we recommend that you use the
    # [HeadBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_HeadBucket.html) operation
    # instead. For backward compatibility, Amazon S3 continues to support the `GetBucketLocation`
    # operation.
    #
    # Returns the Region the bucket resides in. You set the bucket's Region using the
    # `LocationConstraint` request parameter in a `CreateBucket` request. For more information, see
    # [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html).
    #
    # In a bucket's home Region, calls to the `GetBucketLocation` operation are governed by the
    # bucket's policy. In other Regions, the bucket policy doesn't apply, which means that
    # cross-account access won't be authorized. However, calls to the `HeadBucket` operation always
    # return the bucket’s location through an HTTP response header, whether access to the bucket is
    # authorized or not. Therefore, we recommend using the `HeadBucket` operation for bucket Region
    # discovery and to avoid using the `GetBucketLocation` operation.
    #
    # When you use this API operation with an access point, provide the alias of the access point in
    # place of the bucket name.
    #
    # When you use this API operation with an Object Lambda access point, provide the alias of the
    # Object Lambda access point in place of the bucket name. If the Object Lambda access point alias
    # in a request is not valid, the error code `InvalidAccessPointAliasError` is returned. For more
    # information about `InvalidAccessPointAliasError`, see [List of Error
    # Codes](https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ErrorCodeList).
    #
    # This operation is not supported for directory buckets.
    #
    # The following operations are related to `GetBucketLocation`:
    #
    # - [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)
    #
    # - [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_location(input : AS::GetBucketLocationRequest) : Core::ParsedResponse(AS::GetBucketLocationOutput)
      Log.info { "performing 'GetBucketLocation' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("location", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketLocation", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketLocationOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::GetBucketLocationOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns the logging status of a bucket and the permissions users have to view and modify that
    # status.
    #
    # The following operations are related to `GetBucketLogging`:
    #
    # - [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
    #
    # - [PutBucketLogging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLogging.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_logging(input : AS::GetBucketLoggingRequest) : Core::ParsedResponse(AS::GetBucketLoggingOutput)
      Log.info { "performing 'GetBucketLogging' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("logging", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketLogging", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketLoggingOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::GetBucketLoggingOutput).new(response, result)
    end

    # Retrieves the S3 Metadata configuration for a general purpose bucket. For more information, see
    # [Accelerating data discovery with S3
    # Metadata](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-overview.html)
    # in the *Amazon S3 User Guide*.
    #
    # You can use the V2 `GetBucketMetadataConfiguration` API operation with V1 or V2 metadata
    # configurations. However, if you try to use the V1 `GetBucketMetadataTableConfiguration` API
    # operation with V2 configurations, you will receive an HTTP `405 Method Not Allowed` error.
    #
    # Permissions To use this operation, you must have the `s3:GetBucketMetadataTableConfiguration`
    # permission. For more information, see [Setting up permissions for configuring metadata
    # tables](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-permissions.html)
    # in the *Amazon S3 User Guide*.
    #
    # The IAM policy action name is the same for the V1 and V2 API operations.
    #
    # The following operations are related to `GetBucketMetadataConfiguration`:
    #
    # -
    # [CreateBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html)
    #
    # -
    # [DeleteBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetadataConfiguration.html)
    #
    # -
    # [UpdateBucketMetadataInventoryTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UpdateBucketMetadataInventoryTableConfiguration.html)
    #
    # -
    # [UpdateBucketMetadataJournalTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UpdateBucketMetadataJournalTableConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_metadata_configuration(input : AS::GetBucketMetadataConfigurationRequest) : Core::ParsedResponse(AS::GetBucketMetadataConfigurationOutput)
      Log.info { "performing 'GetBucketMetadataConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("metadataConfiguration", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketMetadataConfiguration", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketMetadataConfigurationOutput.new(
        get_bucket_metadata_configuration_result: GetBucketMetadataConfigurationResult.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetBucketMetadataConfigurationOutput).new(response, result)
    end

    # We recommend that you retrieve your S3 Metadata configurations by using the V2
    # [GetBucketMetadataTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetadataTableConfiguration.html)
    # API operation. We no longer recommend using the V1 `GetBucketMetadataTableConfiguration` API
    # operation.
    #
    # If you created your S3 Metadata configuration before July 15, 2025, we recommend that you delete
    # and re-create your configuration by using
    # [CreateBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html)
    # so that you can expire journal table records and create a live inventory table.
    #
    # Retrieves the V1 S3 Metadata configuration for a general purpose bucket. For more information,
    # see [Accelerating data discovery with S3
    # Metadata](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-overview.html)
    # in the *Amazon S3 User Guide*.
    #
    # You can use the V2 `GetBucketMetadataConfiguration` API operation with V1 or V2 metadata table
    # configurations. However, if you try to use the V1 `GetBucketMetadataTableConfiguration` API
    # operation with V2 configurations, you will receive an HTTP `405 Method Not Allowed` error.
    #
    # Make sure that you update your processes to use the new V2 API operations
    # (`CreateBucketMetadataConfiguration`, `GetBucketMetadataConfiguration`, and
    # `DeleteBucketMetadataConfiguration`) instead of the V1 API operations.
    #
    # Permissions To use this operation, you must have the `s3:GetBucketMetadataTableConfiguration`
    # permission. For more information, see [Setting up permissions for configuring metadata
    # tables](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-permissions.html)
    # in the *Amazon S3 User Guide*.
    #
    # The following operations are related to `GetBucketMetadataTableConfiguration`:
    #
    # -
    # [CreateBucketMetadataTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataTableConfiguration.html)
    #
    # -
    # [DeleteBucketMetadataTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetadataTableConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_metadata_table_configuration(input : AS::GetBucketMetadataTableConfigurationRequest) : Core::ParsedResponse(AS::GetBucketMetadataTableConfigurationOutput)
      Log.info { "performing 'GetBucketMetadataTableConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("metadataTable", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketMetadataTableConfiguration", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketMetadataTableConfigurationOutput.new(
        get_bucket_metadata_table_configuration_result: GetBucketMetadataTableConfigurationResult.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetBucketMetadataTableConfigurationOutput).new(response, result)
    end

    # Gets a metrics configuration (specified by the metrics configuration ID) from the bucket. Note
    # that this doesn't include the daily storage metrics.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions To use this operation, you must have permissions to perform the
    # `s3:GetMetricsConfiguration` action. The bucket owner has this permission by default. The bucket
    # owner can grant this permission to others. For more information about permissions, see
    # [Permissions Related to Bucket Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # - **General purpose bucket permissions** - The `s3:GetMetricsConfiguration` permission is
    # required in a policy. For more information about general purpose buckets permissions, see [Using
    # Bucket Policies and User
    # Policies](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:GetMetricsConfiguration` permission in an IAM identity-based policy instead of a
    # bucket policy. Cross-account access to this API operation isn't supported. This operation can
    # only be performed by the Amazon Web Services account that owns the resource. For more
    # information about directory bucket policies and permissions, see [Amazon Web Services Identity
    # and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # For information about CloudWatch request metrics for Amazon S3, see [Monitoring Metrics with
    # Amazon CloudWatch](https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html).
    #
    # The following operations are related to `GetBucketMetricsConfiguration`:
    #
    # -
    # [PutBucketMetricsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketMetricsConfiguration.html)
    #
    # -
    # [DeleteBucketMetricsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetricsConfiguration.html)
    #
    # -
    # [ListBucketMetricsConfigurations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketMetricsConfigurations.html)
    #
    # - [Monitoring Metrics with Amazon
    # CloudWatch](https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_metrics_configuration(input : AS::GetBucketMetricsConfigurationRequest) : Core::ParsedResponse(AS::GetBucketMetricsConfigurationOutput)
      Log.info { "performing 'GetBucketMetricsConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("metrics", "")
        form.add("x-id", "GetBucketMetricsConfiguration")
        if value = input.id
          form.add("id", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketMetricsConfiguration", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketMetricsConfigurationOutput.new(
        metrics_configuration: MetricsConfiguration.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetBucketMetricsConfigurationOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns the notification configuration of a bucket.
    #
    # If notifications are not enabled on the bucket, the action returns an empty
    # `NotificationConfiguration` element.
    #
    # By default, you must be the bucket owner to read the notification configuration of a bucket.
    # However, the bucket owner can use a bucket policy to grant permission to other users to read
    # this configuration with the `s3:GetBucketNotification` permission.
    #
    # When you use this API operation with an access point, provide the alias of the access point in
    # place of the bucket name.
    #
    # When you use this API operation with an Object Lambda access point, provide the alias of the
    # Object Lambda access point in place of the bucket name. If the Object Lambda access point alias
    # in a request is not valid, the error code `InvalidAccessPointAliasError` is returned. For more
    # information about `InvalidAccessPointAliasError`, see [List of Error
    # Codes](https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ErrorCodeList).
    #
    # For more information about setting and reading the notification configuration on a bucket, see
    # [Setting Up Notification of Bucket
    # Events](https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html). For more
    # information about bucket policies, see [Using Bucket
    # Policies](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html).
    #
    # The following action is related to `GetBucketNotification`:
    #
    # -
    # [PutBucketNotification](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketNotification.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_notification_configuration(input : AS::GetBucketNotificationConfigurationRequest) : Core::ParsedResponse(AS::NotificationConfiguration)
      Log.info { "performing 'GetBucketNotificationConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("notification", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketNotificationConfiguration", "GET", path, headers, nil, "application/xml")
      result = AS::NotificationConfiguration.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::NotificationConfiguration).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Retrieves `OwnershipControls` for an Amazon S3 bucket. To use this operation, you must have the
    # `s3:GetBucketOwnershipControls` permission. For more information about Amazon S3 permissions,
    # see [Specifying permissions in a
    # policy](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html).
    #
    # A bucket doesn't have `OwnershipControls` settings in the following cases:
    #
    # - The bucket was created before the `BucketOwnerEnforced` ownership setting was introduced and
    # you've never explicitly applied this value
    #
    # - You've manually deleted the bucket ownership control value using the
    # `DeleteBucketOwnershipControls` API operation.
    #
    # By default, Amazon S3 sets `OwnershipControls` for all newly created buckets.
    #
    # For information about Amazon S3 Object Ownership, see [Using Object
    # Ownership](https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html).
    #
    # The following operations are related to `GetBucketOwnershipControls`:
    #
    # - PutBucketOwnershipControls
    #
    # - DeleteBucketOwnershipControls
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_ownership_controls(input : AS::GetBucketOwnershipControlsRequest) : Core::ParsedResponse(AS::GetBucketOwnershipControlsOutput)
      Log.info { "performing 'GetBucketOwnershipControls' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("ownershipControls", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketOwnershipControls", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketOwnershipControlsOutput.new(
        ownership_controls: OwnershipControls.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetBucketOwnershipControlsOutput).new(response, result)
    end

    # Returns the policy of a specified bucket.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions If you are using an identity other than the root user of the Amazon Web Services
    # account that owns the bucket, the calling identity must both have the `GetBucketPolicy`
    # permissions on the specified bucket and belong to the bucket owner's account in order to use
    # this operation.
    #
    # If you don't have `GetBucketPolicy` permissions, Amazon S3 returns a `403 Access Denied` error.
    # If you have the correct permissions, but you're not using an identity that belongs to the bucket
    # owner's account, Amazon S3 returns a `405 Method Not Allowed` error.
    #
    # To ensure that bucket owners don't inadvertently lock themselves out of their own buckets, the
    # root principal in a bucket owner's Amazon Web Services account can perform the
    # `GetBucketPolicy`, `PutBucketPolicy`, and `DeleteBucketPolicy` API actions, even if their bucket
    # policy explicitly denies the root principal's access. Bucket owner root principals can only be
    # blocked from performing these API actions by VPC endpoint policies and Amazon Web Services
    # Organizations policies.
    #
    # - **General purpose bucket permissions** - The `s3:GetBucketPolicy` permission is required in a
    # policy. For more information about general purpose buckets bucket policies, see [Using Bucket
    # Policies and User
    # Policies](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:GetBucketPolicy` permission in an IAM identity-based policy instead of a bucket
    # policy. Cross-account access to this API operation isn't supported. This operation can only be
    # performed by the Amazon Web Services account that owns the resource. For more information about
    # directory bucket policies and permissions, see [Amazon Web Services Identity and Access
    # Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # Example bucket policies **General purpose buckets example bucket policies** - See [Bucket policy
    # examples](https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html) in
    # the *Amazon S3 User Guide*.
    #
    # **Directory bucket example bucket policies** - See [Example bucket policies for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam-example-bucket-policies.html)
    # in the *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # The following action is related to `GetBucketPolicy`:
    #
    # - [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_policy(input : AS::GetBucketPolicyRequest) : Core::ParsedResponse(AS::GetBucketPolicyOutput)
      Log.info { "performing 'GetBucketPolicy' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("policy", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketPolicy", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketPolicyOutput.new(
        policy: response.body,
      )
      Core::ParsedResponse(AS::GetBucketPolicyOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Retrieves the policy status for an Amazon S3 bucket, indicating whether the bucket is public. In
    # order to use this operation, you must have the `s3:GetBucketPolicyStatus` permission. For more
    # information about Amazon S3 permissions, see [Specifying Permissions in a
    # Policy](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html).
    #
    # For more information about when Amazon S3 considers a bucket public, see [The Meaning of
    # "Public"](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status).
    #
    # The following operations are related to `GetBucketPolicyStatus`:
    #
    # - [Using Amazon S3 Block Public
    # Access](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html)
    #
    # -
    # [GetPublicAccessBlock](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetPublicAccessBlock.html)
    #
    # -
    # [PutPublicAccessBlock](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutPublicAccessBlock.html)
    #
    # -
    # [DeletePublicAccessBlock](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeletePublicAccessBlock.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_policy_status(input : AS::GetBucketPolicyStatusRequest) : Core::ParsedResponse(AS::GetBucketPolicyStatusOutput)
      Log.info { "performing 'GetBucketPolicyStatus' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("policyStatus", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketPolicyStatus", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketPolicyStatusOutput.new(
        policy_status: PolicyStatus.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetBucketPolicyStatusOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns the replication configuration of a bucket.
    #
    # It can take a while to propagate the put or delete a replication configuration to all Amazon S3
    # systems. Therefore, a get request soon after put or delete can return a wrong result.
    #
    # For information about replication configuration, see
    # [Replication](https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html) in the *Amazon
    # S3 User Guide*.
    #
    # This action requires permissions for the `s3:GetReplicationConfiguration` action. For more
    # information about permissions, see [Using Bucket Policies and User
    # Policies](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html).
    #
    # If you include the `Filter` element in a replication configuration, you must also include the
    # `DeleteMarkerReplication` and `Priority` elements. The response also returns those elements.
    #
    # For information about `GetBucketReplication` errors, see [List of replication-related error
    # codes](https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ReplicationErrorCodeList)
    #
    # The following operations are related to `GetBucketReplication`:
    #
    # -
    # [PutBucketReplication](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketReplication.html)
    #
    # -
    # [DeleteBucketReplication](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketReplication.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_replication(input : AS::GetBucketReplicationRequest) : Core::ParsedResponse(AS::GetBucketReplicationOutput)
      Log.info { "performing 'GetBucketReplication' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("replication", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketReplication", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketReplicationOutput.new(
        replication_configuration: ReplicationConfiguration.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetBucketReplicationOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns the request payment configuration of a bucket. To use this version of the operation, you
    # must be the bucket owner. For more information, see [Requester Pays
    # Buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html).
    #
    # The following operations are related to `GetBucketRequestPayment`:
    #
    # - [ListObjects](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjects.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_request_payment(input : AS::GetBucketRequestPaymentRequest) : Core::ParsedResponse(AS::GetBucketRequestPaymentOutput)
      Log.info { "performing 'GetBucketRequestPayment' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("requestPayment", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketRequestPayment", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketRequestPaymentOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::GetBucketRequestPaymentOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns the tag set associated with the general purpose bucket.
    #
    # To use this operation, you must have permission to perform the `s3:GetBucketTagging` action. By
    # default, the bucket owner has this permission and can grant this permission to others.
    #
    # `GetBucketTagging` has the following special error:
    #
    # - Error code: `NoSuchTagSet`
    #
    # - Description: There is no tag set associated with the bucket.
    #
    # The following operations are related to `GetBucketTagging`:
    #
    # - [PutBucketTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketTagging.html)
    #
    # -
    # [DeleteBucketTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketTagging.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_tagging(input : AS::GetBucketTaggingRequest) : Core::ParsedResponse(AS::GetBucketTaggingOutput)
      Log.info { "performing 'GetBucketTagging' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("tagging", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketTagging", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketTaggingOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::GetBucketTaggingOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns the versioning state of a bucket.
    #
    # To retrieve the versioning state of a bucket, you must be the bucket owner.
    #
    # This implementation also returns the MFA Delete status of the versioning state. If the MFA
    # Delete status is `enabled`, the bucket owner must use an authentication device to change the
    # versioning state of the bucket.
    #
    # The following operations are related to `GetBucketVersioning`:
    #
    # - [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)
    #
    # - [PutObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)
    #
    # - [DeleteObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_versioning(input : AS::GetBucketVersioningRequest) : Core::ParsedResponse(AS::GetBucketVersioningOutput)
      Log.info { "performing 'GetBucketVersioning' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("versioning", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketVersioning", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketVersioningOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::GetBucketVersioningOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns the website configuration for a bucket. To host website on Amazon S3, you can configure
    # a bucket as website by adding a website configuration. For more information about hosting
    # websites, see [Hosting Websites on Amazon
    # S3](https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html).
    #
    # This GET action requires the `S3:GetBucketWebsite` permission. By default, only the bucket owner
    # can read the bucket website configuration. However, bucket owners can allow other users to read
    # the website configuration by writing a bucket policy granting them the `S3:GetBucketWebsite`
    # permission.
    #
    # The following operations are related to `GetBucketWebsite`:
    #
    # -
    # [DeleteBucketWebsite](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketWebsite.html)
    #
    # - [PutBucketWebsite](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketWebsite.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_bucket_website(input : AS::GetBucketWebsiteRequest) : Core::ParsedResponse(AS::GetBucketWebsiteOutput)
      Log.info { "performing 'GetBucketWebsite' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("website", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetBucketWebsite", "GET", path, headers, nil, "application/xml")
      result = AS::GetBucketWebsiteOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::GetBucketWebsiteOutput).new(response, result)
    end

    # Retrieves an object from Amazon S3.
    #
    # In the `GetObject` request, specify the full key name for the object.
    #
    # **General purpose buckets** - Both the virtual-hosted-style requests and the path-style requests
    # are supported. For a virtual hosted-style request example, if you have the object
    # `photos/2006/February/sample.jpg`, specify the object key name as
    # `/photos/2006/February/sample.jpg`. For a path-style request example, if you have the object
    # `photos/2006/February/sample.jpg` in the bucket named `examplebucket`, specify the object key
    # name as `/examplebucket/photos/2006/February/sample.jpg`. For more information about request
    # types, see [HTTP Host Header Bucket
    # Specification](https://docs.aws.amazon.com/AmazonS3/latest/dev/VirtualHosting.html#VirtualHostingSpecifyBucket)
    # in the *Amazon S3 User Guide*.
    #
    # **Directory buckets** - Only virtual-hosted-style requests are supported. For a virtual
    # hosted-style request example, if you have the object `photos/2006/February/sample.jpg` in the
    # bucket named `amzn-s3-demo-bucket--usw2-az1--x-s3`, specify the object key name as
    # `/photos/2006/February/sample.jpg`. Also, when you make requests to this API operation, your
    # requests are sent to the Zonal endpoint. These endpoints support virtual-hosted-style requests
    # in the format `https://*bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name*
    # `. Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - You must have the required permissions in a policy.
    # To use `GetObject`, you must have the `READ` access to the object (or version). If you grant
    # `READ` access to the anonymous user, the `GetObject` operation returns the object without using
    # an authorization header. For more information, see [Specifying permissions in a
    # policy](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html) in the
    # *Amazon S3 User Guide*.
    #
    # If you include a `versionId` in your request header, you must have the `s3:GetObjectVersion`
    # permission to access a specific version of an object. The `s3:GetObject` permission is not
    # required in this scenario.
    #
    # If you request the current version of an object without a specific `versionId` in the request
    # header, only the `s3:GetObject` permission is required. The `s3:GetObjectVersion` permission is
    # not required in this scenario.
    #
    # If the object that you request doesn’t exist, the error that Amazon S3 returns depends on
    # whether you also have the `s3:ListBucket` permission.
    #
    # - If you have the `s3:ListBucket` permission on the bucket, Amazon S3 returns an HTTP status
    # code `404 Not Found` error.
    #
    # - If you don’t have the `s3:ListBucket` permission, Amazon S3 returns an HTTP status code `403
    # Access Denied` error.
    #
    # - **Directory bucket permissions** - To grant access to this API operation on a directory
    # bucket, we recommend that you use the [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) API operation for
    # session-based authorization. Specifically, you grant the `s3express:CreateSession` permission to
    # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
    # `CreateSession` API call on the bucket to obtain a session token. With the session token in your
    # request header, you can make API requests to this operation. After the session token expires,
    # you make another `CreateSession` API call to generate a new session token for use. Amazon Web
    # Services CLI or SDKs create session and refresh the session token automatically to avoid service
    # interruptions when a session expires. For more information about authorization, see [
    # `CreateSession` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html).
    #
    # If the object is encrypted using SSE-KMS, you must also have the `kms:GenerateDataKey` and
    # `kms:Decrypt` permissions in IAM identity-based policies and KMS key policies for the KMS key.
    #
    # Storage classes If the object you are retrieving is stored in the S3 Glacier Flexible Retrieval
    # storage class, the S3 Glacier Deep Archive storage class, the S3 Intelligent-Tiering Archive
    # Access tier, or the S3 Intelligent-Tiering Deep Archive Access tier, before you can retrieve the
    # object you must first restore a copy using
    # [RestoreObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html).
    # Otherwise, this operation returns an `InvalidObjectState` error. For information about restoring
    # archived objects, see [Restoring Archived
    # Objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/restoring-objects.html) in the *Amazon
    # S3 User Guide*.
    #
    # **Directory buckets ** - Directory buckets only support `EXPRESS_ONEZONE` (the S3 Express One
    # Zone storage class) in Availability Zones and `ONEZONE_IA` (the S3 One Zone-Infrequent Access
    # storage class) in Dedicated Local Zones. Unsupported storage class values won't write a
    # destination object and will respond with the HTTP status code `400 Bad Request`.
    #
    # Encryption Encryption request headers, like `x-amz-server-side-encryption`, should not be sent
    # for the `GetObject` requests, if your object uses server-side encryption with Amazon S3 managed
    # encryption keys (SSE-S3), server-side encryption with Key Management Service (KMS) keys
    # (SSE-KMS), or dual-layer server-side encryption with Amazon Web Services KMS keys (DSSE-KMS). If
    # you include the header in your `GetObject` requests for the object that uses these types of
    # keys, you’ll get an HTTP `400 Bad Request` error.
    #
    # **Directory buckets** - For directory buckets, there are only two supported options for
    # server-side encryption: SSE-S3 and SSE-KMS. SSE-C isn't supported. For more information, see
    # [Protecting data with server-side
    # encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-serv-side-encryption.html)
    # in the *Amazon S3 User Guide*.
    #
    # Overriding response header values through the request There are times when you want to override
    # certain response header values of a `GetObject` response. For example, you might override the
    # `Content-Disposition` response header value through your `GetObject` request.
    #
    # You can override values for a set of response headers. These modified response header values are
    # included only in a successful response, that is, when the HTTP status code `200 OK` is returned.
    # The headers you can override using the following query parameters in the request are a subset of
    # the headers that Amazon S3 accepts when you create an object.
    #
    # The response headers that you can override for the `GetObject` response are `Cache-Control`,
    # `Content-Disposition`, `Content-Encoding`, `Content-Language`, `Content-Type`, and `Expires`.
    #
    # To override values for a set of response headers in the `GetObject` response, you can use the
    # following query parameters in the request.
    #
    # - `response-cache-control`
    #
    # - `response-content-disposition`
    #
    # - `response-content-encoding`
    #
    # - `response-content-language`
    #
    # - `response-content-type`
    #
    # - `response-expires`
    #
    # When you use these parameters, you must sign the request by using either an Authorization header
    # or a presigned URL. These parameters cannot be used with an unsigned (anonymous) request.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `GetObject`:
    #
    # - [ListBuckets](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBuckets.html)
    #
    # - [GetObjectAcl](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAcl.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_object(input : AS::GetObjectRequest) : Core::ParsedResponse(AS::GetObjectOutput)
      Log.info { "performing 'GetObject' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("x-id", "GetObject")
        if value = input.response_cache_control
          form.add("response-cache-control", value)
        end
        if value = input.response_content_disposition
          form.add("response-content-disposition", value)
        end
        if value = input.response_content_encoding
          form.add("response-content-encoding", value)
        end
        if value = input.response_content_language
          form.add("response-content-language", value)
        end
        if value = input.response_content_type
          form.add("response-content-type", value)
        end
        if value = input.response_expires.try { |time| Core::HeaderValue.format_http_time(time) }
          form.add("response-expires", value)
        end
        if value = input.version_id
          form.add("versionId", value)
        end
        if value = input.part_number.try(&.to_s)
          form.add("partNumber", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.if_match
        headers["If-Match"] = value
      end
      if value = input.if_modified_since.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["If-Modified-Since"] = value
      end
      if value = input.if_none_match
        headers["If-None-Match"] = value
      end
      if value = input.if_unmodified_since.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["If-Unmodified-Since"] = value
      end
      if value = input.range
        headers["Range"] = value
      end
      if value = input.sse_customer_algorithm
        headers["x-amz-server-side-encryption-customer-algorithm"] = value
      end
      if value = input.sse_customer_key
        headers["x-amz-server-side-encryption-customer-key"] = value
      end
      if value = input.sse_customer_key_md5
        headers["x-amz-server-side-encryption-customer-key-MD5"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.checksum_mode.try(&.to_json_object_key)
        headers["x-amz-checksum-mode"] = value
      end
      response = rest_request("GetObject", "GET", path, headers, nil, "application/xml")
      result = AS::GetObjectOutput.new(
        delete_marker: Core::HeaderValue.bool(response.headers["x-amz-delete-marker"]?),
        accept_ranges: response.headers["accept-ranges"]?,
        expiration: response.headers["x-amz-expiration"]?,
        restore: response.headers["x-amz-restore"]?,
        last_modified: Core::HeaderValue.http_time(response.headers["Last-Modified"]?),
        content_length: Core::HeaderValue.i64(response.headers["Content-Length"]?),
        e_tag: response.headers["ETag"]?,
        checksum_crc32: response.headers["x-amz-checksum-crc32"]?,
        checksum_crc32c: response.headers["x-amz-checksum-crc32c"]?,
        checksum_crc64nvme: response.headers["x-amz-checksum-crc64nvme"]?,
        checksum_sha1: response.headers["x-amz-checksum-sha1"]?,
        checksum_sha256: response.headers["x-amz-checksum-sha256"]?,
        checksum_sha512: response.headers["x-amz-checksum-sha512"]?,
        checksum_md5: response.headers["x-amz-checksum-md5"]?,
        checksum_xxhash64: response.headers["x-amz-checksum-xxhash64"]?,
        checksum_xxhash3: response.headers["x-amz-checksum-xxhash3"]?,
        checksum_xxhash128: response.headers["x-amz-checksum-xxhash128"]?,
        checksum_type: response.headers["x-amz-checksum-type"]?.try { |value| AS::ChecksumType.from_json_object_key?(value) },
        missing_meta: Core::HeaderValue.i32(response.headers["x-amz-missing-meta"]?),
        version_id: response.headers["x-amz-version-id"]?,
        cache_control: response.headers["Cache-Control"]?,
        content_disposition: response.headers["Content-Disposition"]?,
        content_encoding: response.headers["Content-Encoding"]?,
        content_language: response.headers["Content-Language"]?,
        content_range: response.headers["Content-Range"]?,
        content_type: response.headers["Content-Type"]?,
        expires: response.headers["Expires"]?,
        website_redirect_location: response.headers["x-amz-website-redirect-location"]?,
        server_side_encryption: response.headers["x-amz-server-side-encryption"]?.try { |value| AS::ServerSideEncryption.from_json_object_key?(value) },
        metadata: Core::HeaderValue.prefixed(response.headers, "x-amz-meta-"),
        sse_customer_algorithm: response.headers["x-amz-server-side-encryption-customer-algorithm"]?,
        sse_customer_key_md5: response.headers["x-amz-server-side-encryption-customer-key-MD5"]?,
        ssekms_key_id: response.headers["x-amz-server-side-encryption-aws-kms-key-id"]?,
        bucket_key_enabled: Core::HeaderValue.bool(response.headers["x-amz-server-side-encryption-bucket-key-enabled"]?),
        storage_class: response.headers["x-amz-storage-class"]?.try { |value| AS::StorageClass.from_json_object_key?(value) },
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
        replication_status: response.headers["x-amz-replication-status"]?.try { |value| AS::ReplicationStatus.from_json_object_key?(value) },
        parts_count: Core::HeaderValue.i32(response.headers["x-amz-mp-parts-count"]?),
        tag_count: Core::HeaderValue.i32(response.headers["x-amz-tagging-count"]?),
        object_lock_mode: response.headers["x-amz-object-lock-mode"]?.try { |value| AS::ObjectLockMode.from_json_object_key?(value) },
        object_lock_retain_until_date: Core::HeaderValue.date_time(response.headers["x-amz-object-lock-retain-until-date"]?),
        object_lock_legal_hold_status: response.headers["x-amz-object-lock-legal-hold"]?.try { |value| AS::ObjectLockLegalHoldStatus.from_json_object_key?(value) },
        body: response.body,
      )
      Core::ParsedResponse(AS::GetObjectOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns the access control list (ACL) of an object. To use this operation, you must have
    # `s3:GetObjectAcl` permissions or `READ_ACP` access to the object. For more information, see
    # [Mapping of ACL permissions and access policy
    # permissions](https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html#acl-access-policy-permission-mapping)
    # in the *Amazon S3 User Guide*
    #
    # This functionality is not supported for Amazon S3 on Outposts.
    #
    # By default, GET returns ACL information about the current version of an object. To return ACL
    # information about a different version, use the versionId subresource.
    #
    # If your bucket uses the bucket owner enforced setting for S3 Object Ownership, requests to read
    # ACLs are still supported and return the `bucket-owner-full-control` ACL with the owner being the
    # account that created the bucket. For more information, see [ Controlling object ownership and
    # disabling
    # ACLs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html) in the
    # *Amazon S3 User Guide*.
    #
    # The following operations are related to `GetObjectAcl`:
    #
    # - [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)
    #
    # -
    # [GetObjectAttributes](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAttributes.html)
    #
    # - [DeleteObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html)
    #
    # - [PutObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_object_acl(input : AS::GetObjectAclRequest) : Core::ParsedResponse(AS::GetObjectAclOutput)
      Log.info { "performing 'GetObjectAcl' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("acl", "")
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetObjectAcl", "GET", path, headers, nil, "application/xml")
      result = AS::GetObjectAclOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.request_charged = response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) }
      Core::ParsedResponse(AS::GetObjectAclOutput).new(response, result)
    end

    # Retrieves an annotation from an Amazon S3 object. To use this operation, you must have the
    # `s3:GetObjectAnnotation` permission.
    #
    # If checksum mode is enabled via the `x-amz-checksum-mode` header, Amazon S3 returns the stored
    # checksum in the response headers for client-side validation.
    #
    # Annotations are not supported by the following features: S3 Inventory Reports, API Gateway, S3
    # Storage Lens, Amazon S3 File Gateway, Amazon FSx, S3 on Outposts, and S3 Express One Zone
    # (directory buckets).
    #
    # The following operations are related to `GetObjectAnnotation`:
    #
    # -
    # [PutObjectAnnotation](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectAnnotation.html)
    #
    # -
    # [ListObjectAnnotations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectAnnotations.html)
    #
    # -
    # [DeleteObjectAnnotation](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObjectAnnotation.html)
    def get_object_annotation(input : AS::GetObjectAnnotationRequest) : Core::ParsedResponse(AS::GetObjectAnnotationOutput)
      Log.info { "performing 'GetObjectAnnotation' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("annotation", "")
        form.add("x-id", "GetObjectAnnotation")
        if value = input.annotation_name
          form.add("annotationName", value)
        end
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.checksum_mode.try(&.to_json_object_key)
        headers["x-amz-checksum-mode"] = value
      end
      response = rest_request("GetObjectAnnotation", "GET", path, headers, nil, "application/xml")
      result = AS::GetObjectAnnotationOutput.new(
        object_version_id: response.headers["x-amz-object-version-id"]?,
        last_modified: Core::HeaderValue.http_time(response.headers["Last-Modified"]?),
        content_length: Core::HeaderValue.i64(response.headers["Content-Length"]?),
        e_tag: response.headers["ETag"]?,
        checksum_crc32: response.headers["x-amz-checksum-crc32"]?,
        checksum_crc32c: response.headers["x-amz-checksum-crc32c"]?,
        checksum_crc64nvme: response.headers["x-amz-checksum-crc64nvme"]?,
        checksum_sha1: response.headers["x-amz-checksum-sha1"]?,
        checksum_sha256: response.headers["x-amz-checksum-sha256"]?,
        checksum_sha512: response.headers["x-amz-checksum-sha512"]?,
        checksum_md5: response.headers["x-amz-checksum-md5"]?,
        checksum_xxhash64: response.headers["x-amz-checksum-xxhash64"]?,
        checksum_xxhash3: response.headers["x-amz-checksum-xxhash3"]?,
        checksum_xxhash128: response.headers["x-amz-checksum-xxhash128"]?,
        checksum_type: response.headers["x-amz-checksum-type"]?.try { |value| AS::ChecksumType.from_json_object_key?(value) },
        server_side_encryption: response.headers["x-amz-server-side-encryption"]?.try { |value| AS::ServerSideEncryption.from_json_object_key?(value) },
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
        replication_status: response.headers["x-amz-replication-status"]?.try { |value| AS::ReplicationStatus.from_json_object_key?(value) },
        annotation_payload: response.body,
      )
      Core::ParsedResponse(AS::GetObjectAnnotationOutput).new(response, result)
    end

    # Retrieves all of the metadata from an object without returning the object itself. This operation
    # is useful if you're interested only in an object's metadata.
    #
    # `GetObjectAttributes` combines the functionality of `HeadObject` and `ListParts`. All of the
    # data returned with both of those individual calls can be returned with a single call to
    # `GetObjectAttributes`.
    #
    # **Directory buckets** - For directory buckets, you must make requests for this API operation to
    # the Zonal endpoint. These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - To use `GetObjectAttributes`, you must have READ
    # access to the object.
    #
    # The other permissions that you need to use this operation depend on whether the bucket is
    # versioned and if a version ID is passed in the `GetObjectAttributes` request.
    #
    # - If you pass a version ID in your request, you need both the `s3:GetObjectVersion` and
    # `s3:GetObjectVersionAttributes` permissions.
    #
    # - If you do not pass a version ID in your request, you need the `s3:GetObject` and
    # `s3:GetObjectAttributes` permissions.
    #
    # For more information, see [Specifying Permissions in a
    # Policy](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html) in the
    # *Amazon S3 User Guide*.
    #
    # If the object that you request does not exist, the error Amazon S3 returns depends on whether
    # you also have the `s3:ListBucket` permission.
    #
    # - If you have the `s3:ListBucket` permission on the bucket, Amazon S3 returns an HTTP status
    # code `404 Not Found` ("no such key") error.
    #
    # - If you don't have the `s3:ListBucket` permission, Amazon S3 returns an HTTP status code `403
    # Forbidden` ("access denied") error.
    #
    # - **Directory bucket permissions** - To grant access to this API operation on a directory
    # bucket, we recommend that you use the [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) API operation for
    # session-based authorization. Specifically, you grant the `s3express:CreateSession` permission to
    # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
    # `CreateSession` API call on the bucket to obtain a session token. With the session token in your
    # request header, you can make API requests to this operation. After the session token expires,
    # you make another `CreateSession` API call to generate a new session token for use. Amazon Web
    # Services CLI or SDKs create session and refresh the session token automatically to avoid service
    # interruptions when a session expires. For more information about authorization, see [
    # `CreateSession` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html).
    #
    # If the object is encrypted with SSE-KMS, you must also have the `kms:GenerateDataKey` and
    # `kms:Decrypt` permissions in IAM identity-based policies and KMS key policies for the KMS key.
    #
    # Encryption Encryption request headers, like `x-amz-server-side-encryption`, should not be sent
    # for `HEAD` requests if your object uses server-side encryption with Key Management Service (KMS)
    # keys (SSE-KMS), dual-layer server-side encryption with Amazon Web Services KMS keys (DSSE-KMS),
    # or server-side encryption with Amazon S3 managed encryption keys (SSE-S3). The
    # `x-amz-server-side-encryption` header is used when you `PUT` an object to S3 and want to specify
    # the encryption method. If you include this header in a `GET` request for an object that uses
    # these types of keys, you’ll get an HTTP `400 Bad Request` error. It's because the encryption
    # method can't be changed when you retrieve the object.
    #
    # If you encrypted an object when you stored the object in Amazon S3 by using server-side
    # encryption with customer-provided encryption keys (SSE-C), then when you retrieve the metadata
    # from the object, you must use the following headers. These headers provide the server with the
    # encryption key required to retrieve the object's metadata. The headers are:
    #
    # - `x-amz-server-side-encryption-customer-algorithm`
    #
    # - `x-amz-server-side-encryption-customer-key`
    #
    # - `x-amz-server-side-encryption-customer-key-MD5`
    #
    # For more information about SSE-C, see [Server-Side Encryption (Using Customer-Provided
    # Encryption
    # Keys)](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html) in
    # the *Amazon S3 User Guide*.
    #
    # **Directory bucket permissions** - For directory buckets, there are only two supported options
    # for server-side encryption: server-side encryption with Amazon S3 managed keys (SSE-S3)
    # (`AES256`) and server-side encryption with KMS keys (SSE-KMS) (`aws:kms`). We recommend that the
    # bucket's default encryption uses the desired encryption configuration and you don't override the
    # bucket default encryption in your `CreateSession` requests or `PUT` object requests. Then, new
    # objects are automatically encrypted with the desired encryption settings. For more information,
    # see [Protecting data with server-side
    # encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-serv-side-encryption.html)
    # in the *Amazon S3 User Guide*. For more information about the encryption overriding behaviors in
    # directory buckets, see [Specifying server-side encryption with KMS for new object
    # uploads](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-specifying-kms-encryption.html).
    #
    # Versioning **Directory buckets** - S3 Versioning isn't enabled and supported for directory
    # buckets. For this API operation, only the `null` value of the version ID is supported by
    # directory buckets. You can only specify `null` to the `versionId` query parameter in the
    # request.
    #
    # Conditional request headers Consider the following when using request headers:
    #
    # - If both of the `If-Match` and `If-Unmodified-Since` headers are present in the request as
    # follows, then Amazon S3 returns the HTTP status code `200 OK` and the data requested:
    #
    # - `If-Match` condition evaluates to `true`.
    #
    # - `If-Unmodified-Since` condition evaluates to `false`.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232).
    #
    # - If both of the `If-None-Match` and `If-Modified-Since` headers are present in the request as
    # follows, then Amazon S3 returns the HTTP status code `304 Not Modified`:
    #
    # - `If-None-Match` condition evaluates to `false`.
    #
    # - `If-Modified-Since` condition evaluates to `true`.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232).
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # The following actions are related to `GetObjectAttributes`:
    #
    # - [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)
    #
    # - [GetObjectAcl](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAcl.html)
    #
    # -
    # [GetObjectLegalHold](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectLegalHold.html)
    #
    # -
    # [GetObjectLockConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectLockConfiguration.html)
    #
    # -
    # [GetObjectRetention](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectRetention.html)
    #
    # - [GetObjectTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html)
    #
    # - [HeadObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_HeadObject.html)
    #
    # - [ListParts](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_object_attributes(input : AS::GetObjectAttributesRequest) : Core::ParsedResponse(AS::GetObjectAttributesOutput)
      Log.info { "performing 'GetObjectAttributes' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("attributes", "")
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.max_parts.try(&.to_s)
        headers["x-amz-max-parts"] = value
      end
      if value = input.part_number_marker
        headers["x-amz-part-number-marker"] = value
      end
      if value = input.sse_customer_algorithm
        headers["x-amz-server-side-encryption-customer-algorithm"] = value
      end
      if value = input.sse_customer_key
        headers["x-amz-server-side-encryption-customer-key"] = value
      end
      if value = input.sse_customer_key_md5
        headers["x-amz-server-side-encryption-customer-key-MD5"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.object_attributes
        headers["x-amz-object-attributes"] = value.map { |item| item.to_json_object_key }.join(",")
      end
      response = rest_request("GetObjectAttributes", "GET", path, headers, nil, "application/xml")
      result = AS::GetObjectAttributesOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.delete_marker = Core::HeaderValue.bool(response.headers["x-amz-delete-marker"]?)
      result.last_modified = Core::HeaderValue.http_time(response.headers["Last-Modified"]?)
      result.version_id = response.headers["x-amz-version-id"]?
      result.request_charged = response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) }
      Core::ParsedResponse(AS::GetObjectAttributesOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Gets an object's current legal hold status. For more information, see [Locking
    # Objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html).
    #
    # This functionality is not supported for Amazon S3 on Outposts.
    #
    # The following action is related to `GetObjectLegalHold`:
    #
    # -
    # [GetObjectAttributes](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAttributes.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_object_legal_hold(input : AS::GetObjectLegalHoldRequest) : Core::ParsedResponse(AS::GetObjectLegalHoldOutput)
      Log.info { "performing 'GetObjectLegalHold' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("legal-hold", "")
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetObjectLegalHold", "GET", path, headers, nil, "application/xml")
      result = AS::GetObjectLegalHoldOutput.new(
        legal_hold: ObjectLockLegalHold.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetObjectLegalHoldOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Gets the Object Lock configuration for a bucket. The rule specified in the Object Lock
    # configuration will be applied by default to every new object placed in the specified bucket. For
    # more information, see [Locking
    # Objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html).
    #
    # The following action is related to `GetObjectLockConfiguration`:
    #
    # -
    # [GetObjectAttributes](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAttributes.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_object_lock_configuration(input : AS::GetObjectLockConfigurationRequest) : Core::ParsedResponse(AS::GetObjectLockConfigurationOutput)
      Log.info { "performing 'GetObjectLockConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("object-lock", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetObjectLockConfiguration", "GET", path, headers, nil, "application/xml")
      result = AS::GetObjectLockConfigurationOutput.new(
        object_lock_configuration: ObjectLockConfiguration.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetObjectLockConfigurationOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Retrieves an object's retention settings. For more information, see [Locking
    # Objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html).
    #
    # This functionality is not supported for Amazon S3 on Outposts.
    #
    # The following action is related to `GetObjectRetention`:
    #
    # -
    # [GetObjectAttributes](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAttributes.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_object_retention(input : AS::GetObjectRetentionRequest) : Core::ParsedResponse(AS::GetObjectRetentionOutput)
      Log.info { "performing 'GetObjectRetention' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("retention", "")
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetObjectRetention", "GET", path, headers, nil, "application/xml")
      result = AS::GetObjectRetentionOutput.new(
        retention: ObjectLockRetention.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetObjectRetentionOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns the tag-set of an object. You send the GET request against the tagging subresource
    # associated with the object.
    #
    # To use this operation, you must have permission to perform the `s3:GetObjectTagging` action. By
    # default, the GET action returns information about current version of an object. For a versioned
    # bucket, you can have multiple versions of an object in your bucket. To retrieve tags of any
    # other version, use the versionId query parameter. You also need permission for the
    # `s3:GetObjectVersionTagging` action.
    #
    # By default, the bucket owner has this permission and can grant this permission to others.
    #
    # For information about the Amazon S3 object tagging feature, see [Object
    # Tagging](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-tagging.html).
    #
    # The following actions are related to `GetObjectTagging`:
    #
    # -
    # [DeleteObjectTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObjectTagging.html)
    #
    # -
    # [GetObjectAttributes](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAttributes.html)
    #
    # - [PutObjectTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectTagging.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_object_tagging(input : AS::GetObjectTaggingRequest) : Core::ParsedResponse(AS::GetObjectTaggingOutput)
      Log.info { "performing 'GetObjectTagging' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("tagging", "")
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      response = rest_request("GetObjectTagging", "GET", path, headers, nil, "application/xml")
      result = AS::GetObjectTaggingOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.version_id = response.headers["x-amz-version-id"]?
      Core::ParsedResponse(AS::GetObjectTaggingOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns torrent files from a bucket. BitTorrent can save you bandwidth when you're distributing
    # large files.
    #
    # You can get torrent only for objects that are less than 5 GB in size, and that are not encrypted
    # using server-side encryption with a customer-provided encryption key.
    #
    # To use GET, you must have READ access to the object.
    #
    # This functionality is not supported for Amazon S3 on Outposts.
    #
    # The following action is related to `GetObjectTorrent`:
    #
    # - [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_object_torrent(input : AS::GetObjectTorrentRequest) : Core::ParsedResponse(AS::GetObjectTorrentOutput)
      Log.info { "performing 'GetObjectTorrent' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("torrent", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetObjectTorrent", "GET", path, headers, nil, "application/xml")
      result = AS::GetObjectTorrentOutput.new(
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
        body: response.body,
      )
      Core::ParsedResponse(AS::GetObjectTorrentOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Retrieves the `PublicAccessBlock` configuration for an Amazon S3 bucket. This operation returns
    # the bucket-level configuration only. To understand the effective public access behavior, you
    # must also consider account-level settings (which may inherit from organization-level policies).
    # To use this operation, you must have the `s3:GetBucketPublicAccessBlock` permission. For more
    # information about Amazon S3 permissions, see [Specifying Permissions in a
    # Policy](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html).
    #
    # When Amazon S3 evaluates the `PublicAccessBlock` configuration for a bucket or an object, it
    # checks the `PublicAccessBlock` configuration for both the bucket (or the bucket that contains
    # the object) and the bucket owner's account. Account-level settings automatically inherit from
    # organization-level policies when present. If the `PublicAccessBlock` settings are different
    # between the bucket and the account, Amazon S3 uses the most restrictive combination of the
    # bucket-level and account-level settings.
    #
    # For more information about when Amazon S3 considers a bucket or an object public, see [The
    # Meaning of
    # "Public"](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status).
    #
    # The following operations are related to `GetPublicAccessBlock`:
    #
    # - [Using Amazon S3 Block Public
    # Access](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html)
    #
    # -
    # [PutPublicAccessBlock](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutPublicAccessBlock.html)
    #
    # -
    # [GetPublicAccessBlock](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetPublicAccessBlock.html)
    #
    # -
    # [DeletePublicAccessBlock](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeletePublicAccessBlock.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def get_public_access_block(input : AS::GetPublicAccessBlockRequest) : Core::ParsedResponse(AS::GetPublicAccessBlockOutput)
      Log.info { "performing 'GetPublicAccessBlock' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("publicAccessBlock", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("GetPublicAccessBlock", "GET", path, headers, nil, "application/xml")
      result = AS::GetPublicAccessBlockOutput.new(
        public_access_block_configuration: PublicAccessBlockConfiguration.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::GetPublicAccessBlockOutput).new(response, result)
    end

    # You can use this operation to determine if a bucket exists and if you have permission to access
    # it. The action returns a `200 OK` HTTP status code if the bucket exists and you have permission
    # to access it. You can make a `HeadBucket` call on any bucket name to any Region in the
    # partition, and regardless of the permissions on the bucket, you will receive a response header
    # with the correct bucket location so that you can then make a proper, signed request to the
    # appropriate Regional endpoint.
    #
    # If the bucket doesn't exist or you don't have permission to access it, the `HEAD` request
    # returns a generic `400 Bad Request`, `403 Forbidden`, or `404 Not Found` HTTP status code. A
    # message body isn't included, so you can't determine the exception beyond these HTTP response
    # codes.
    #
    # Authentication and authorization **General purpose buckets** - Request to public buckets that
    # grant the s3:ListBucket permission publicly do not need to be signed. All other `HeadBucket`
    # requests must be authenticated and signed by using IAM credentials (access key ID and secret
    # access key for the IAM identities). All headers with the `x-amz-` prefix, including
    # `x-amz-copy-source`, must be signed. For more information, see [REST
    # Authentication](https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html).
    #
    # **Directory buckets** - You must use IAM credentials to authenticate and authorize your access
    # to the `HeadBucket` API operation, instead of using the temporary security credentials through
    # the `CreateSession` API operation.
    #
    # Amazon Web Services CLI or SDKs handles authentication and authorization on your behalf.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - To use this operation, you must have permissions to
    # perform the `s3:ListBucket` action. The bucket owner has this permission by default and can
    # grant this permission to others. For more information about permissions, see [Managing access
    # permissions to your Amazon S3
    # resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - You must have the ** `s3express:CreateSession` **
    # permission in the `Action` element of a policy. If no session mode is specified, the session
    # will be created with the maximum allowable privilege, attempting `ReadWrite` first, then
    # `ReadOnly` if `ReadWrite` is not permitted. If you want to explicitly restrict the access to be
    # read-only, you can set the `s3express:SessionMode` condition key to `ReadOnly` on the bucket.
    #
    # For more information about example bucket policies, see [Example bucket policies for S3 Express
    # One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam-example-bucket-policies.html)
    # and [Amazon Web Services Identity and Access Management (IAM) identity-based policies for S3
    # Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam-identity-policies.html)
    # in the *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # You must make requests for this API operation to the Zonal endpoint. These endpoints support
    # virtual-hosted-style requests in the format
    # `https://*bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`. Path-style requests are
    # not supported. For more information about endpoints in Availability Zones, see [Regional and
    # Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def head_bucket(input : AS::HeadBucketRequest) : Core::ParsedResponse(AS::HeadBucketOutput)
      Log.info { "performing 'HeadBucket' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("HeadBucket", "HEAD", path, headers, nil, "application/xml")
      result = AS::HeadBucketOutput.new(
        bucket_arn: response.headers["x-amz-bucket-arn"]?,
        bucket_location_type: response.headers["x-amz-bucket-location-type"]?.try { |value| AS::LocationType.from_json_object_key?(value) },
        bucket_location_name: response.headers["x-amz-bucket-location-name"]?,
        bucket_region: response.headers["x-amz-bucket-region"]?,
        access_point_alias: Core::HeaderValue.bool(response.headers["x-amz-access-point-alias"]?),
      )
      Core::ParsedResponse(AS::HeadBucketOutput).new(response, result)
    end

    # The `HEAD` operation retrieves metadata from an object without returning the object itself. This
    # operation is useful if you're interested only in an object's metadata.
    #
    # A `HEAD` request has the same options as a `GET` operation on an object. The response is
    # identical to the `GET` response except that there is no response body. Because of this, if the
    # `HEAD` request generates an error, it returns a generic code, such as `400 Bad Request`, `403
    # Forbidden`, `404 Not Found`, `405 Method Not Allowed`, `412 Precondition Failed`, or `304 Not
    # Modified`. It's not possible to retrieve the exact exception of these error codes.
    #
    # Request headers are limited to 8 KB in size. For more information, see [Common Request
    # Headers](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTCommonRequestHeaders.html).
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - To use `HEAD`, you must have the `s3:GetObject`
    # permission. You need the relevant read object (or version) permission for this operation. For
    # more information, see [Actions, resources, and condition keys for Amazon
    # S3](https://docs.aws.amazon.com/AmazonS3/latest/dev/list_amazons3.html) in the *Amazon S3 User
    # Guide*. For more information about the permissions to S3 API operations by S3 resource types,
    # see [Required permissions for Amazon S3 API
    # operations](/AmazonS3/latest/userguide/using-with-s3-policy-actions.html) in the *Amazon S3 User
    # Guide*.
    #
    # If the object you request doesn't exist, the error that Amazon S3 returns depends on whether you
    # also have the `s3:ListBucket` permission.
    #
    # - If you have the `s3:ListBucket` permission on the bucket, Amazon S3 returns an HTTP status
    # code `404 Not Found` error.
    #
    # - If you don’t have the `s3:ListBucket` permission, Amazon S3 returns an HTTP status code `403
    # Forbidden` error.
    #
    # - **Directory bucket permissions** - To grant access to this API operation on a directory
    # bucket, we recommend that you use the [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) API operation for
    # session-based authorization. Specifically, you grant the `s3express:CreateSession` permission to
    # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
    # `CreateSession` API call on the bucket to obtain a session token. With the session token in your
    # request header, you can make API requests to this operation. After the session token expires,
    # you make another `CreateSession` API call to generate a new session token for use. Amazon Web
    # Services CLI or SDKs create session and refresh the session token automatically to avoid service
    # interruptions when a session expires. For more information about authorization, see [
    # `CreateSession` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html).
    #
    # If you enable `x-amz-checksum-mode` in the request and the object is encrypted with Amazon Web
    # Services Key Management Service (Amazon Web Services KMS), you must also have the
    # `kms:GenerateDataKey` and `kms:Decrypt` permissions in IAM identity-based policies and KMS key
    # policies for the KMS key to retrieve the checksum of the object.
    #
    # Encryption Encryption request headers, like `x-amz-server-side-encryption`, should not be sent
    # for `HEAD` requests if your object uses server-side encryption with Key Management Service (KMS)
    # keys (SSE-KMS), dual-layer server-side encryption with Amazon Web Services KMS keys (DSSE-KMS),
    # or server-side encryption with Amazon S3 managed encryption keys (SSE-S3). The
    # `x-amz-server-side-encryption` header is used when you `PUT` an object to S3 and want to specify
    # the encryption method. If you include this header in a `HEAD` request for an object that uses
    # these types of keys, you’ll get an HTTP `400 Bad Request` error. It's because the encryption
    # method can't be changed when you retrieve the object.
    #
    # If you encrypt an object by using server-side encryption with customer-provided encryption keys
    # (SSE-C) when you store the object in Amazon S3, then when you retrieve the metadata from the
    # object, you must use the following headers to provide the encryption key for the server to be
    # able to retrieve the object's metadata. The headers are:
    #
    # - `x-amz-server-side-encryption-customer-algorithm`
    #
    # - `x-amz-server-side-encryption-customer-key`
    #
    # - `x-amz-server-side-encryption-customer-key-MD5`
    #
    # For more information about SSE-C, see [Server-Side Encryption (Using Customer-Provided
    # Encryption
    # Keys)](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html) in
    # the *Amazon S3 User Guide*.
    #
    # **Directory bucket ** - For directory buckets, there are only two supported options for
    # server-side encryption: SSE-S3 and SSE-KMS. SSE-C isn't supported. For more information, see
    # [Protecting data with server-side
    # encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-serv-side-encryption.html)
    # in the *Amazon S3 User Guide*.
    #
    # Versioning
    #
    # - If the current version of the object is a delete marker, Amazon S3 behaves as if the object
    # was deleted and includes `x-amz-delete-marker: true` in the response.
    #
    # - If the specified version is a delete marker, the response returns a `405 Method Not Allowed`
    # error and the `Last-Modified: timestamp` response header.
    #
    # - **Directory buckets** - Delete marker is not supported for directory buckets.
    #
    # - **Directory buckets** - S3 Versioning isn't enabled and supported for directory buckets. For
    # this API operation, only the `null` value of the version ID is supported by directory buckets.
    # You can only specify `null` to the `versionId` query parameter in the request.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # For directory buckets, you must make requests for this API operation to the Zonal endpoint.
    # These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # The following actions are related to `HeadObject`:
    #
    # - [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)
    #
    # -
    # [GetObjectAttributes](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAttributes.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def head_object(input : AS::HeadObjectRequest) : Core::ParsedResponse(AS::HeadObjectOutput)
      Log.info { "performing 'HeadObject' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        if value = input.response_cache_control
          form.add("response-cache-control", value)
        end
        if value = input.response_content_disposition
          form.add("response-content-disposition", value)
        end
        if value = input.response_content_encoding
          form.add("response-content-encoding", value)
        end
        if value = input.response_content_language
          form.add("response-content-language", value)
        end
        if value = input.response_content_type
          form.add("response-content-type", value)
        end
        if value = input.response_expires.try { |time| Core::HeaderValue.format_http_time(time) }
          form.add("response-expires", value)
        end
        if value = input.version_id
          form.add("versionId", value)
        end
        if value = input.part_number.try(&.to_s)
          form.add("partNumber", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.if_match
        headers["If-Match"] = value
      end
      if value = input.if_modified_since.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["If-Modified-Since"] = value
      end
      if value = input.if_none_match
        headers["If-None-Match"] = value
      end
      if value = input.if_unmodified_since.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["If-Unmodified-Since"] = value
      end
      if value = input.range
        headers["Range"] = value
      end
      if value = input.sse_customer_algorithm
        headers["x-amz-server-side-encryption-customer-algorithm"] = value
      end
      if value = input.sse_customer_key
        headers["x-amz-server-side-encryption-customer-key"] = value
      end
      if value = input.sse_customer_key_md5
        headers["x-amz-server-side-encryption-customer-key-MD5"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.checksum_mode.try(&.to_json_object_key)
        headers["x-amz-checksum-mode"] = value
      end
      response = rest_request("HeadObject", "HEAD", path, headers, nil, "application/xml")
      result = AS::HeadObjectOutput.new(
        delete_marker: Core::HeaderValue.bool(response.headers["x-amz-delete-marker"]?),
        accept_ranges: response.headers["accept-ranges"]?,
        expiration: response.headers["x-amz-expiration"]?,
        restore: response.headers["x-amz-restore"]?,
        archive_status: response.headers["x-amz-archive-status"]?.try { |value| AS::ArchiveStatus.from_json_object_key?(value) },
        last_modified: Core::HeaderValue.http_time(response.headers["Last-Modified"]?),
        content_length: Core::HeaderValue.i64(response.headers["Content-Length"]?),
        checksum_crc32: response.headers["x-amz-checksum-crc32"]?,
        checksum_crc32c: response.headers["x-amz-checksum-crc32c"]?,
        checksum_crc64nvme: response.headers["x-amz-checksum-crc64nvme"]?,
        checksum_sha1: response.headers["x-amz-checksum-sha1"]?,
        checksum_sha256: response.headers["x-amz-checksum-sha256"]?,
        checksum_sha512: response.headers["x-amz-checksum-sha512"]?,
        checksum_md5: response.headers["x-amz-checksum-md5"]?,
        checksum_xxhash64: response.headers["x-amz-checksum-xxhash64"]?,
        checksum_xxhash3: response.headers["x-amz-checksum-xxhash3"]?,
        checksum_xxhash128: response.headers["x-amz-checksum-xxhash128"]?,
        checksum_type: response.headers["x-amz-checksum-type"]?.try { |value| AS::ChecksumType.from_json_object_key?(value) },
        e_tag: response.headers["ETag"]?,
        missing_meta: Core::HeaderValue.i32(response.headers["x-amz-missing-meta"]?),
        version_id: response.headers["x-amz-version-id"]?,
        cache_control: response.headers["Cache-Control"]?,
        content_disposition: response.headers["Content-Disposition"]?,
        content_encoding: response.headers["Content-Encoding"]?,
        content_language: response.headers["Content-Language"]?,
        content_type: response.headers["Content-Type"]?,
        content_range: response.headers["Content-Range"]?,
        expires: response.headers["Expires"]?,
        website_redirect_location: response.headers["x-amz-website-redirect-location"]?,
        server_side_encryption: response.headers["x-amz-server-side-encryption"]?.try { |value| AS::ServerSideEncryption.from_json_object_key?(value) },
        metadata: Core::HeaderValue.prefixed(response.headers, "x-amz-meta-"),
        sse_customer_algorithm: response.headers["x-amz-server-side-encryption-customer-algorithm"]?,
        sse_customer_key_md5: response.headers["x-amz-server-side-encryption-customer-key-MD5"]?,
        ssekms_key_id: response.headers["x-amz-server-side-encryption-aws-kms-key-id"]?,
        bucket_key_enabled: Core::HeaderValue.bool(response.headers["x-amz-server-side-encryption-bucket-key-enabled"]?),
        storage_class: response.headers["x-amz-storage-class"]?.try { |value| AS::StorageClass.from_json_object_key?(value) },
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
        replication_status: response.headers["x-amz-replication-status"]?.try { |value| AS::ReplicationStatus.from_json_object_key?(value) },
        parts_count: Core::HeaderValue.i32(response.headers["x-amz-mp-parts-count"]?),
        tag_count: Core::HeaderValue.i32(response.headers["x-amz-tagging-count"]?),
        object_lock_mode: response.headers["x-amz-object-lock-mode"]?.try { |value| AS::ObjectLockMode.from_json_object_key?(value) },
        object_lock_retain_until_date: Core::HeaderValue.date_time(response.headers["x-amz-object-lock-retain-until-date"]?),
        object_lock_legal_hold_status: response.headers["x-amz-object-lock-legal-hold"]?.try { |value| AS::ObjectLockLegalHoldStatus.from_json_object_key?(value) },
      )
      Core::ParsedResponse(AS::HeadObjectOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Lists the analytics configurations for the bucket. You can have up to 1,000 analytics
    # configurations per bucket.
    #
    # This action supports list pagination and does not return more than 100 configurations at a time.
    # You should always check the `IsTruncated` element in the response. If there are no more
    # configurations to list, `IsTruncated` is set to false. If there are more configurations to list,
    # `IsTruncated` is set to true, and there will be a value in `NextContinuationToken`. You use the
    # `NextContinuationToken` value to continue the pagination of the list by passing the value in
    # continuation-token in the request to `GET` the next page.
    #
    # To use this operation, you must have permissions to perform the `s3:GetAnalyticsConfiguration`
    # action. The bucket owner has this permission by default. The bucket owner can grant this
    # permission to others. For more information about permissions, see [Permissions Related to Bucket
    # Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # For information about Amazon S3 analytics feature, see [Amazon S3 Analytics – Storage Class
    # Analysis](https://docs.aws.amazon.com/AmazonS3/latest/dev/analytics-storage-class.html).
    #
    # The following operations are related to `ListBucketAnalyticsConfigurations`:
    #
    # -
    # [GetBucketAnalyticsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAnalyticsConfiguration.html)
    #
    # -
    # [DeleteBucketAnalyticsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketAnalyticsConfiguration.html)
    #
    # -
    # [PutBucketAnalyticsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAnalyticsConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def list_bucket_analytics_configurations(input : AS::ListBucketAnalyticsConfigurationsRequest) : Core::ParsedResponse(AS::ListBucketAnalyticsConfigurationsOutput)
      Log.info { "performing 'ListBucketAnalyticsConfigurations' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("analytics", "")
        form.add("x-id", "ListBucketAnalyticsConfigurations")
        if value = input.continuation_token
          form.add("continuation-token", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("ListBucketAnalyticsConfigurations", "GET", path, headers, nil, "application/xml")
      result = AS::ListBucketAnalyticsConfigurationsOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::ListBucketAnalyticsConfigurationsOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Lists the S3 Intelligent-Tiering configuration from the specified bucket.
    #
    # The S3 Intelligent-Tiering storage class is designed to optimize storage costs by automatically
    # moving data to the most cost-effective storage access tier, without performance impact or
    # operational overhead. S3 Intelligent-Tiering delivers automatic cost savings in three low
    # latency and high throughput access tiers. To get the lowest storage cost on data that can be
    # accessed in minutes to hours, you can choose to activate additional archiving capabilities.
    #
    # The S3 Intelligent-Tiering storage class is the ideal storage class for data with unknown,
    # changing, or unpredictable access patterns, independent of object size or retention period. If
    # the size of an object is less than 128 KB, it is not monitored and not eligible for
    # auto-tiering. Smaller objects can be stored, but they are always charged at the Frequent Access
    # tier rates in the S3 Intelligent-Tiering storage class.
    #
    # For more information, see [Storage class for automatically optimizing frequently and
    # infrequently accessed
    # objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access).
    #
    # Operations related to `ListBucketIntelligentTieringConfigurations` include:
    #
    # -
    # [DeleteBucketIntelligentTieringConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketIntelligentTieringConfiguration.html)
    #
    # -
    # [PutBucketIntelligentTieringConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketIntelligentTieringConfiguration.html)
    #
    # -
    # [GetBucketIntelligentTieringConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketIntelligentTieringConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def list_bucket_intelligent_tiering_configurations(input : AS::ListBucketIntelligentTieringConfigurationsRequest) : Core::ParsedResponse(AS::ListBucketIntelligentTieringConfigurationsOutput)
      Log.info { "performing 'ListBucketIntelligentTieringConfigurations' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("intelligent-tiering", "")
        form.add("x-id", "ListBucketIntelligentTieringConfigurations")
        if value = input.continuation_token
          form.add("continuation-token", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("ListBucketIntelligentTieringConfigurations", "GET", path, headers, nil, "application/xml")
      result = AS::ListBucketIntelligentTieringConfigurationsOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::ListBucketIntelligentTieringConfigurationsOutput).new(response, result)
    end

    # Returns a list of S3 Inventory configurations for the bucket. You can have up to 1,000 inventory
    # configurations per bucket.
    #
    # This action supports list pagination and does not return more than 100 configurations at a time.
    # Always check the `IsTruncated` element in the response. If there are no more configurations to
    # list, `IsTruncated` is set to false. If there are more configurations to list, `IsTruncated` is
    # set to true, and there is a value in `NextContinuationToken`. You use the
    # `NextContinuationToken` value to continue the pagination of the list by passing the value in
    # continuation-token in the request to `GET` the next page.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions To use this operation, you must have permissions to perform the
    # `s3:GetInventoryConfiguration` action. The bucket owner has this permission by default. The
    # bucket owner can grant this permission to others. For more information about permissions, see
    # [Permissions Related to Bucket Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # - **General purpose bucket permissions** - The `s3:GetInventoryConfiguration` permission is
    # required in a policy. For more information about general purpose buckets permissions, see [Using
    # Bucket Policies and User
    # Policies](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:GetInventoryConfiguration` permission in an IAM identity-based policy instead of a
    # bucket policy. For more information about directory bucket policies and permissions, see [Amazon
    # Web Services Identity and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # For information about the Amazon S3 inventory feature, see [Amazon S3
    # Inventory](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-inventory.html)
    #
    # The following operations are related to `ListBucketInventoryConfigurations`:
    #
    # -
    # [GetBucketInventoryConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketInventoryConfiguration.html)
    #
    # -
    # [DeleteBucketInventoryConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketInventoryConfiguration.html)
    #
    # -
    # [PutBucketInventoryConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketInventoryConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def list_bucket_inventory_configurations(input : AS::ListBucketInventoryConfigurationsRequest) : Core::ParsedResponse(AS::ListBucketInventoryConfigurationsOutput)
      Log.info { "performing 'ListBucketInventoryConfigurations' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("inventory", "")
        form.add("x-id", "ListBucketInventoryConfigurations")
        if value = input.continuation_token
          form.add("continuation-token", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("ListBucketInventoryConfigurations", "GET", path, headers, nil, "application/xml")
      result = AS::ListBucketInventoryConfigurationsOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::ListBucketInventoryConfigurationsOutput).new(response, result)
    end

    # Lists the metrics configurations for the bucket. The metrics configurations are only for the
    # request metrics of the bucket and do not provide information on daily storage metrics. You can
    # have up to 1,000 configurations per bucket.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # This action supports list pagination and does not return more than 100 configurations at a time.
    # Always check the `IsTruncated` element in the response. If there are no more configurations to
    # list, `IsTruncated` is set to false. If there are more configurations to list, `IsTruncated` is
    # set to true, and there is a value in `NextContinuationToken`. You use the
    # `NextContinuationToken` value to continue the pagination of the list by passing the value in
    # `continuation-token` in the request to `GET` the next page.
    #
    # Permissions To use this operation, you must have permissions to perform the
    # `s3:GetMetricsConfiguration` action. The bucket owner has this permission by default. The bucket
    # owner can grant this permission to others. For more information about permissions, see
    # [Permissions Related to Bucket Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # - **General purpose bucket permissions** - The `s3:GetMetricsConfiguration` permission is
    # required in a policy. For more information about general purpose buckets permissions, see [Using
    # Bucket Policies and User
    # Policies](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:GetMetricsConfiguration` permission in an IAM identity-based policy instead of a
    # bucket policy. Cross-account access to this API operation isn't supported. This operation can
    # only be performed by the Amazon Web Services account that owns the resource. For more
    # information about directory bucket policies and permissions, see [Amazon Web Services Identity
    # and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # For more information about metrics configurations and CloudWatch request metrics, see
    # [Monitoring Metrics with Amazon
    # CloudWatch](https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html).
    #
    # The following operations are related to `ListBucketMetricsConfigurations`:
    #
    # -
    # [PutBucketMetricsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketMetricsConfiguration.html)
    #
    # -
    # [GetBucketMetricsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetricsConfiguration.html)
    #
    # -
    # [DeleteBucketMetricsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetricsConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def list_bucket_metrics_configurations(input : AS::ListBucketMetricsConfigurationsRequest) : Core::ParsedResponse(AS::ListBucketMetricsConfigurationsOutput)
      Log.info { "performing 'ListBucketMetricsConfigurations' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("metrics", "")
        form.add("x-id", "ListBucketMetricsConfigurations")
        if value = input.continuation_token
          form.add("continuation-token", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("ListBucketMetricsConfigurations", "GET", path, headers, nil, "application/xml")
      result = AS::ListBucketMetricsConfigurationsOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::ListBucketMetricsConfigurationsOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns a list of all buckets owned by the authenticated sender of the request. To grant IAM
    # permission to use this operation, you must add the `s3:ListAllMyBuckets` policy action.
    #
    # For information about Amazon S3 buckets, see [Creating, configuring, and working with Amazon S3
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-buckets-s3.html).
    #
    # We strongly recommend using only paginated `ListBuckets` requests. Unpaginated `ListBuckets`
    # requests are only supported for Amazon Web Services accounts set to the default general purpose
    # bucket quota of 10,000. If you have an approved general purpose bucket quota above 10,000, you
    # must send paginated `ListBuckets` requests to list your account’s buckets. All unpaginated
    # `ListBuckets` requests will be rejected for Amazon Web Services accounts with a general purpose
    # bucket quota greater than 10,000.
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def list_buckets(input : AS::ListBucketsRequest) : Core::ParsedResponse(AS::ListBucketsOutput)
      Log.info { "performing 'ListBuckets' operation" }
      input.validate! if config.validate_input?
      path = "/"
      query = URI::Params.build do |form|
        form.add("x-id", "ListBuckets")
        if value = input.max_buckets.try(&.to_s)
          form.add("max-buckets", value)
        end
        if value = input.continuation_token
          form.add("continuation-token", value)
        end
        if value = input.prefix
          form.add("prefix", value)
        end
        if value = input.bucket_region
          form.add("bucket-region", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListBuckets", "GET", path, headers, nil, "application/xml")
      result = AS::ListBucketsOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::ListBucketsOutput).new(response, result)
    end

    # Returns a list of all Amazon S3 directory buckets owned by the authenticated sender of the
    # request. For more information about directory buckets, see [Directory
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-overview.html)
    # in the *Amazon S3 User Guide*.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions You must have the `s3express:ListAllMyDirectoryBuckets` permission in an IAM
    # identity-based policy instead of a bucket policy. Cross-account access to this API operation
    # isn't supported. This operation can only be performed by the Amazon Web Services account that
    # owns the resource. For more information about directory bucket policies and permissions, see
    # [Amazon Web Services Identity and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region*.amazonaws.com`.
    #
    # The `BucketRegion` response element is not part of the `ListDirectoryBuckets` Response Syntax.
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def list_directory_buckets(input : AS::ListDirectoryBucketsRequest) : Core::ParsedResponse(AS::ListDirectoryBucketsOutput)
      Log.info { "performing 'ListDirectoryBuckets' operation" }
      input.validate! if config.validate_input?
      path = "/"
      query = URI::Params.build do |form|
        form.add("x-id", "ListDirectoryBuckets")
        if value = input.continuation_token
          form.add("continuation-token", value)
        end
        if value = input.max_directory_buckets.try(&.to_s)
          form.add("max-directory-buckets", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListDirectoryBuckets", "GET", path, headers, nil, "application/xml")
      result = AS::ListDirectoryBucketsOutput.from_xml(XML.parse(response.body).root.not_nil!)
      Core::ParsedResponse(AS::ListDirectoryBucketsOutput).new(response, result)
    end

    # This operation lists in-progress multipart uploads in a bucket. An in-progress multipart upload
    # is a multipart upload that has been initiated by the `CreateMultipartUpload` request, but has
    # not yet been completed or aborted.
    #
    # **Directory buckets** - If multipart uploads in a directory bucket are in progress, you can't
    # delete the bucket until all the in-progress multipart uploads are aborted or completed. To
    # delete these in-progress multipart uploads, use the `ListMultipartUploads` operation to list the
    # in-progress multipart uploads in the bucket and use the `AbortMultipartUpload` operation to
    # abort all the in-progress multipart uploads.
    #
    # The `ListMultipartUploads` operation returns a maximum of 1,000 multipart uploads in the
    # response. The limit of 1,000 multipart uploads is also the default value. You can further limit
    # the number of uploads in a response by specifying the `max-uploads` request parameter. If there
    # are more than 1,000 multipart uploads that satisfy your `ListMultipartUploads` request, the
    # response returns an `IsTruncated` element with the value of `true`, a `NextKeyMarker` element,
    # and a `NextUploadIdMarker` element. To list the remaining multipart uploads, you need to make
    # subsequent `ListMultipartUploads` requests. In these requests, include two query parameters:
    # `key-marker` and `upload-id-marker`. Set the value of `key-marker` to the `NextKeyMarker` value
    # from the previous response. Similarly, set the value of `upload-id-marker` to the
    # `NextUploadIdMarker` value from the previous response.
    #
    # **Directory buckets** - The `upload-id-marker` element and the `NextUploadIdMarker` element
    # aren't supported by directory buckets. To list the additional multipart uploads, you only need
    # to set the value of `key-marker` to the `NextKeyMarker` value from the previous response.
    #
    # For more information about multipart uploads, see [Uploading Objects Using Multipart
    # Upload](https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html) in the *Amazon
    # S3 User Guide*.
    #
    # **Directory buckets** - For directory buckets, you must make requests for this API operation to
    # the Zonal endpoint. These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - For information about permissions required to use the
    # multipart upload API, see [Multipart Upload and
    # Permissions](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation on a directory
    # bucket, we recommend that you use the [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) API operation for
    # session-based authorization. Specifically, you grant the `s3express:CreateSession` permission to
    # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
    # `CreateSession` API call on the bucket to obtain a session token. With the session token in your
    # request header, you can make API requests to this operation. After the session token expires,
    # you make another `CreateSession` API call to generate a new session token for use. Amazon Web
    # Services CLI or SDKs create session and refresh the session token automatically to avoid service
    # interruptions when a session expires. For more information about authorization, see [
    # `CreateSession` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html).
    #
    # Sorting of multipart uploads in response
    #
    # - **General purpose bucket** - In the `ListMultipartUploads` response, the multipart uploads are
    # sorted based on two criteria:
    #
    # - Key-based sorting - Multipart uploads are initially sorted in ascending order based on their
    # object keys.
    #
    # - Time-based sorting - For uploads that share the same object key, they are further sorted in
    # ascending order based on the upload initiation time. Among uploads with the same key, the one
    # that was initiated first will appear before the ones that were initiated later.
    #
    # - **Directory bucket** - In the `ListMultipartUploads` response, the multipart uploads aren't
    # sorted lexicographically based on the object keys.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `ListMultipartUploads`:
    #
    # -
    # [CreateMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html)
    #
    # - [UploadPart](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html)
    #
    # -
    # [CompleteMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html)
    #
    # - [ListParts](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html)
    #
    # -
    # [AbortMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def list_multipart_uploads(input : AS::ListMultipartUploadsRequest) : Core::ParsedResponse(AS::ListMultipartUploadsOutput)
      Log.info { "performing 'ListMultipartUploads' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("uploads", "")
        if value = input.delimiter
          form.add("delimiter", value)
        end
        if value = input.encoding_type.try(&.to_json_object_key)
          form.add("encoding-type", value)
        end
        if value = input.key_marker
          form.add("key-marker", value)
        end
        if value = input.max_uploads.try(&.to_s)
          form.add("max-uploads", value)
        end
        if value = input.prefix
          form.add("prefix", value)
        end
        if value = input.upload_id_marker
          form.add("upload-id-marker", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      response = rest_request("ListMultipartUploads", "GET", path, headers, nil, "application/xml")
      result = AS::ListMultipartUploadsOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.request_charged = response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) }
      Core::ParsedResponse(AS::ListMultipartUploadsOutput).new(response, result)
    end

    # Lists the annotations attached to an Amazon S3 object. Results are paginated, with a maximum of
    # 1,000 annotations per object. Use the `AnnotationPrefix` parameter to filter the results by name
    # prefix.
    #
    # To use this operation, you must have the `s3:ListObjectAnnotations` permission.
    #
    # Annotations are not supported by the following features: S3 Inventory Reports, API Gateway, S3
    # Storage Lens, Amazon S3 File Gateway, Amazon FSx, S3 on Outposts, and S3 Express One Zone
    # (directory buckets).
    #
    # The following operations are related to `ListObjectAnnotations`:
    #
    # -
    # [PutObjectAnnotation](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectAnnotation.html)
    #
    # -
    # [GetObjectAnnotation](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAnnotation.html)
    #
    # -
    # [DeleteObjectAnnotation](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObjectAnnotation.html)
    def list_object_annotations(input : AS::ListObjectAnnotationsRequest) : Core::ParsedResponse(AS::ListObjectAnnotationsOutput)
      Log.info { "performing 'ListObjectAnnotations' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("annotation", "")
        form.add("x-id", "ListObjectAnnotations")
        if value = input.version_id
          form.add("versionId", value)
        end
        if value = input.max_annotation_results.try(&.to_s)
          form.add("max-annotation-results", value)
        end
        if value = input.annotation_prefix
          form.add("annotation-prefix", value)
        end
        if value = input.continuation_token
          form.add("continuation-token", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("ListObjectAnnotations", "GET", path, headers, nil, "application/xml")
      result = AS::ListObjectAnnotationsOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.object_version_id = response.headers["x-amz-object-version-id"]?
      result.request_charged = response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) }
      Core::ParsedResponse(AS::ListObjectAnnotationsOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns some or all (up to 1,000) of the objects in a bucket. You can use the request parameters
    # as selection criteria to return a subset of the objects in a bucket. A 200 OK response can
    # contain valid or invalid XML. Be sure to design your application to parse the contents of the
    # response and handle it appropriately.
    #
    # This action has been revised. We recommend that you use the newer version,
    # [ListObjectsV2](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html), when
    # developing applications. For backward compatibility, Amazon S3 continues to support
    # `ListObjects`.
    #
    # The following operations are related to `ListObjects`:
    #
    # - [ListObjectsV2](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html)
    #
    # - [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)
    #
    # - [PutObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)
    #
    # - [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
    #
    # - [ListBuckets](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBuckets.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def list_objects(input : AS::ListObjectsRequest) : Core::ParsedResponse(AS::ListObjectsOutput)
      Log.info { "performing 'ListObjects' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        if value = input.delimiter
          form.add("delimiter", value)
        end
        if value = input.encoding_type.try(&.to_json_object_key)
          form.add("encoding-type", value)
        end
        if value = input.marker
          form.add("marker", value)
        end
        if value = input.max_keys.try(&.to_s)
          form.add("max-keys", value)
        end
        if value = input.prefix
          form.add("prefix", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.optional_object_attributes
        headers["x-amz-optional-object-attributes"] = value.map { |item| item.to_json_object_key }.join(",")
      end
      response = rest_request("ListObjects", "GET", path, headers, nil, "application/xml")
      result = AS::ListObjectsOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.request_charged = response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) }
      Core::ParsedResponse(AS::ListObjectsOutput).new(response, result)
    end

    # Returns some or all (up to 1,000) of the objects in a bucket with each request. You can use the
    # request parameters as selection criteria to return a subset of the objects in a bucket. A `200
    # OK` response can contain valid or invalid XML. Make sure to design your application to parse the
    # contents of the response and handle it appropriately. For more information about listing
    # objects, see [Listing object keys
    # programmatically](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ListingKeysUsingAPIs.html)
    # in the *Amazon S3 User Guide*. To get a list of your buckets, see
    # [ListBuckets](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBuckets.html).
    #
    # - **General purpose bucket** - For general purpose buckets, `ListObjectsV2` doesn't return
    # prefixes that are related only to in-progress multipart uploads.
    #
    # - **Directory buckets** - For directory buckets, `ListObjectsV2` response includes the prefixes
    # that are related only to in-progress multipart uploads.
    #
    # - **Directory buckets** - For directory buckets, you must make requests for this API operation
    # to the Zonal endpoint. These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - To use this operation, you must have READ access to
    # the bucket. You must have permission to perform the `s3:ListBucket` action. The bucket owner has
    # this permission by default and can grant this permission to others. For more information about
    # permissions, see [Permissions Related to Bucket Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation on a directory
    # bucket, we recommend that you use the [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) API operation for
    # session-based authorization. Specifically, you grant the `s3express:CreateSession` permission to
    # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
    # `CreateSession` API call on the bucket to obtain a session token. With the session token in your
    # request header, you can make API requests to this operation. After the session token expires,
    # you make another `CreateSession` API call to generate a new session token for use. Amazon Web
    # Services CLI or SDKs create session and refresh the session token automatically to avoid service
    # interruptions when a session expires. For more information about authorization, see [
    # `CreateSession` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html).
    #
    # Sorting order of returned objects
    #
    # - **General purpose bucket** - For general purpose buckets, `ListObjectsV2` returns objects in
    # lexicographical order based on their key names.
    #
    # - **Directory bucket** - For directory buckets, `ListObjectsV2` does not return objects in
    # lexicographical order.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # This section describes the latest revision of this action. We recommend that you use this
    # revised API operation for application development. For backward compatibility, Amazon S3
    # continues to support the prior version of this API operation,
    # [ListObjects](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjects.html).
    #
    # The following operations are related to `ListObjectsV2`:
    #
    # - [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)
    #
    # - [PutObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)
    #
    # - [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def list_objects_v2(input : AS::ListObjectsV2Request) : Core::ParsedResponse(AS::ListObjectsV2Output)
      Log.info { "performing 'ListObjectsV2' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("list-type", "2")
        if value = input.delimiter
          form.add("delimiter", value)
        end
        if value = input.encoding_type.try(&.to_json_object_key)
          form.add("encoding-type", value)
        end
        if value = input.max_keys.try(&.to_s)
          form.add("max-keys", value)
        end
        if value = input.prefix
          form.add("prefix", value)
        end
        if value = input.continuation_token
          form.add("continuation-token", value)
        end
        if value = input.fetch_owner.try(&.to_s)
          form.add("fetch-owner", value)
        end
        if value = input.start_after
          form.add("start-after", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.optional_object_attributes
        headers["x-amz-optional-object-attributes"] = value.map { |item| item.to_json_object_key }.join(",")
      end
      response = rest_request("ListObjectsV2", "GET", path, headers, nil, "application/xml")
      result = AS::ListObjectsV2Output.from_xml(XML.parse(response.body).root.not_nil!)
      result.request_charged = response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) }
      Core::ParsedResponse(AS::ListObjectsV2Output).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Returns metadata about all versions of the objects in a bucket. You can also use request
    # parameters as selection criteria to return metadata about a subset of all the object versions.
    #
    # To use this operation, you must have permission to perform the `s3:ListBucketVersions` action.
    # Be aware of the name difference.
    #
    # A `200 OK` response can contain valid or invalid XML. Make sure to design your application to
    # parse the contents of the response and handle it appropriately.
    #
    # To use this operation, you must have READ access to the bucket.
    #
    # The following operations are related to `ListObjectVersions`:
    #
    # - [ListObjectsV2](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html)
    #
    # - [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)
    #
    # - [PutObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)
    #
    # - [DeleteObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def list_object_versions(input : AS::ListObjectVersionsRequest) : Core::ParsedResponse(AS::ListObjectVersionsOutput)
      Log.info { "performing 'ListObjectVersions' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("versions", "")
        if value = input.delimiter
          form.add("delimiter", value)
        end
        if value = input.encoding_type.try(&.to_json_object_key)
          form.add("encoding-type", value)
        end
        if value = input.key_marker
          form.add("key-marker", value)
        end
        if value = input.max_keys.try(&.to_s)
          form.add("max-keys", value)
        end
        if value = input.prefix
          form.add("prefix", value)
        end
        if value = input.version_id_marker
          form.add("version-id-marker", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.optional_object_attributes
        headers["x-amz-optional-object-attributes"] = value.map { |item| item.to_json_object_key }.join(",")
      end
      response = rest_request("ListObjectVersions", "GET", path, headers, nil, "application/xml")
      result = AS::ListObjectVersionsOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.request_charged = response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) }
      Core::ParsedResponse(AS::ListObjectVersionsOutput).new(response, result)
    end

    # Lists the parts that have been uploaded for a specific multipart upload.
    #
    # To use this operation, you must provide the `upload ID` in the request. You obtain this uploadID
    # by sending the initiate multipart upload request through
    # [CreateMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html).
    #
    # The `ListParts` request returns a maximum of 1,000 uploaded parts. The limit of 1,000 parts is
    # also the default value. You can restrict the number of parts in a response by specifying the
    # `max-parts` request parameter. If your multipart upload consists of more than 1,000 parts, the
    # response returns an `IsTruncated` field with the value of `true`, and a `NextPartNumberMarker`
    # element. To list remaining uploaded parts, in subsequent `ListParts` requests, include the
    # `part-number-marker` query string parameter and set its value to the `NextPartNumberMarker`
    # field value from the previous response.
    #
    # For more information on multipart uploads, see [Uploading Objects Using Multipart
    # Upload](https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html) in the *Amazon
    # S3 User Guide*.
    #
    # **Directory buckets** - For directory buckets, you must make requests for this API operation to
    # the Zonal endpoint. These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - For information about permissions required to use the
    # multipart upload API, see [Multipart Upload and
    # Permissions](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html) in the
    # *Amazon S3 User Guide*.
    #
    # If the upload was created using server-side encryption with Key Management Service (KMS) keys
    # (SSE-KMS) or dual-layer server-side encryption with Amazon Web Services KMS keys (DSSE-KMS), you
    # must have permission to the `kms:Decrypt` action for the `ListParts` request to succeed.
    #
    # - **Directory bucket permissions** - To grant access to this API operation on a directory
    # bucket, we recommend that you use the [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) API operation for
    # session-based authorization. Specifically, you grant the `s3express:CreateSession` permission to
    # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
    # `CreateSession` API call on the bucket to obtain a session token. With the session token in your
    # request header, you can make API requests to this operation. After the session token expires,
    # you make another `CreateSession` API call to generate a new session token for use. Amazon Web
    # Services CLI or SDKs create session and refresh the session token automatically to avoid service
    # interruptions when a session expires. For more information about authorization, see [
    # `CreateSession` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html).
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `ListParts`:
    #
    # -
    # [CreateMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html)
    #
    # - [UploadPart](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html)
    #
    # -
    # [CompleteMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html)
    #
    # -
    # [AbortMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html)
    #
    # -
    # [GetObjectAttributes](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAttributes.html)
    #
    # -
    # [ListMultipartUploads](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def list_parts(input : AS::ListPartsRequest) : Core::ParsedResponse(AS::ListPartsOutput)
      Log.info { "performing 'ListParts' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("x-id", "ListParts")
        if value = input.max_parts.try(&.to_s)
          form.add("max-parts", value)
        end
        if value = input.part_number_marker
          form.add("part-number-marker", value)
        end
        if value = input.upload_id
          form.add("uploadId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.sse_customer_algorithm
        headers["x-amz-server-side-encryption-customer-algorithm"] = value
      end
      if value = input.sse_customer_key
        headers["x-amz-server-side-encryption-customer-key"] = value
      end
      if value = input.sse_customer_key_md5
        headers["x-amz-server-side-encryption-customer-key-MD5"] = value
      end
      response = rest_request("ListParts", "GET", path, headers, nil, "application/xml")
      result = AS::ListPartsOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.abort_date = Core::HeaderValue.http_time(response.headers["x-amz-abort-date"]?)
      result.abort_rule_id = response.headers["x-amz-abort-rule-id"]?
      result.request_charged = response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) }
      Core::ParsedResponse(AS::ListPartsOutput).new(response, result)
    end

    # Sets the attribute-based access control (ABAC) property of the general purpose bucket. You must
    # have `s3:PutBucketABAC` permission to perform this action. When you enable ABAC, you can use
    # tags for access control on your buckets. Additionally, when ABAC is enabled, you must use the
    # [TagResource](https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_TagResource.html) and
    # [UntagResource](https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_UntagResource.html)
    # actions to manage tags on your buckets. You can nolonger use the
    # [PutBucketTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketTagging.html)
    # and
    # [DeleteBucketTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketTagging.html)
    # actions to tag your bucket. For more information, see [Enabling ABAC in general purpose
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/buckets-tagging-enable-abac.html).
    def put_bucket_abac(input : AS::PutBucketAbacRequest) : Core::Response
      Log.info { "performing 'PutBucketAbac' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("abac", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketAbac", "PUT", path, headers, input.abac_status.try(&.to_xml("AbacStatus")), "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Sets the accelerate configuration of an existing bucket. Amazon S3 Transfer Acceleration is a
    # bucket-level feature that enables you to perform faster data transfers to Amazon S3.
    #
    # To use this operation, you must have permission to perform the `s3:PutAccelerateConfiguration`
    # action. The bucket owner has this permission by default. The bucket owner can grant this
    # permission to others. For more information about permissions, see [Permissions Related to Bucket
    # Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # The Transfer Acceleration state of a bucket can be set to one of the following two values:
    #
    # - Enabled – Enables accelerated data transfers to the bucket.
    #
    # - Suspended – Disables accelerated data transfers to the bucket.
    #
    # The
    # [GetBucketAccelerateConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAccelerateConfiguration.html)
    # action returns the transfer acceleration state of a bucket.
    #
    # After setting the Transfer Acceleration state of a bucket to Enabled, it might take up to thirty
    # minutes before the data transfer rates to the bucket increase.
    #
    # The name of the bucket used for Transfer Acceleration must be DNS-compliant and must not contain
    # periods (".").
    #
    # For more information about transfer acceleration, see [Transfer
    # Acceleration](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html).
    #
    # The following operations are related to `PutBucketAccelerateConfiguration`:
    #
    # -
    # [GetBucketAccelerateConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAccelerateConfiguration.html)
    #
    # - [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_accelerate_configuration(input : AS::PutBucketAccelerateConfigurationRequest) : Core::Response
      Log.info { "performing 'PutBucketAccelerateConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("accelerate", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      response = rest_request("PutBucketAccelerateConfiguration", "PUT", path, headers, input.accelerate_configuration.try(&.to_xml("AccelerateConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # End of support notice: As of October 1, 2025, Amazon S3 has discontinued support for Email
    # Grantee Access Control Lists (ACLs). If you attempt to use an Email Grantee ACL in a request
    # after October 1, 2025, the request will receive an `HTTP 405` (Method Not Allowed) error.
    #
    # This change affects the following Amazon Web Services Regions: US East (N. Virginia), US West
    # (N. California), US West (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific
    # (Tokyo), Europe (Ireland), and South America (São Paulo).
    #
    # This operation is not supported for directory buckets.
    #
    # Sets the permissions on an existing bucket using access control lists (ACL). For more
    # information, see [Using
    # ACLs](https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html). To set the ACL of
    # a bucket, you must have the `WRITE_ACP` permission.
    #
    # You can use one of the following two ways to set a bucket's permissions:
    #
    # - Specify the ACL in the request body
    #
    # - Specify permissions using request headers
    #
    # You cannot specify access permission using both the body and the request headers.
    #
    # Depending on your application needs, you may choose to set the ACL on a bucket using either the
    # request body or the headers. For example, if you have an existing application that updates a
    # bucket ACL using the request body, then you can continue to use that approach.
    #
    # If your bucket uses the bucket owner enforced setting for S3 Object Ownership, ACLs are disabled
    # and no longer affect permissions. You must use policies to grant access to your bucket and the
    # objects in it. Requests to set ACLs or update ACLs fail and return the
    # `AccessControlListNotSupported` error code. Requests to read ACLs are still supported. For more
    # information, see [Controlling object
    # ownership](https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html) in
    # the *Amazon S3 User Guide*.
    #
    # Permissions You can set access permissions by using one of the following methods:
    #
    # - Specify a canned ACL with the `x-amz-acl` request header. Amazon S3 supports a set of
    # predefined ACLs, known as *canned ACLs*. Each canned ACL has a predefined set of grantees and
    # permissions. Specify the canned ACL name as the value of `x-amz-acl`. If you use this header,
    # you cannot use other access control-specific headers in your request. For more information, see
    # [Canned ACL](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL).
    #
    # - Specify access permissions explicitly with the `x-amz-grant-read`, `x-amz-grant-read-acp`,
    # `x-amz-grant-write-acp`, and `x-amz-grant-full-control` headers. When using these headers, you
    # specify explicit access permissions and grantees (Amazon Web Services accounts or Amazon S3
    # groups) who will receive the permission. If you use these ACL-specific headers, you cannot use
    # the `x-amz-acl` header to set a canned ACL. These parameters map to the set of permissions that
    # Amazon S3 supports in an ACL. For more information, see [Access Control List (ACL)
    # Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html).
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
    # For example, the following `x-amz-grant-write` header grants create, overwrite, and delete
    # objects permission to LogDelivery group predefined by Amazon S3 and two Amazon Web Services
    # accounts identified by their email addresses.
    #
    # `x-amz-grant-write: uri="http://acs.amazonaws.com/groups/s3/LogDelivery", id="111122223333",
    # id="555566667777" `
    #
    # You can use either a canned ACL or specify access permissions explicitly. You cannot do both.
    #
    # Grantee Values You can specify the person (grantee) to whom you're assigning access rights
    # (using request elements) in the following ways. For examples of how to specify these grantee
    # values in JSON format, see the Amazon Web Services CLI example in [ Enabling Amazon S3 server
    # access
    # logging](https://docs.aws.amazon.com/AmazonS3/latest/userguide/enable-server-access-logging.html)
    # in the *Amazon S3 User Guide*.
    #
    # - By the person's ID:
    #
    # `<>ID<><>GranteesEmail<> `
    #
    # DisplayName is optional and ignored in the request
    #
    # - By URI:
    #
    # `<>http://acs.amazonaws.com/groups/global/AuthenticatedUsers<>`
    #
    # - By Email address:
    #
    # `<>Grantees@email.com<>&`
    #
    # The grantee is resolved to the CanonicalUser and, in a response to a GET Object acl request,
    # appears as the CanonicalUser.
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
    # The following operations are related to `PutBucketAcl`:
    #
    # - [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
    #
    # - [DeleteBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html)
    #
    # - [GetObjectAcl](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAcl.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_acl(input : AS::PutBucketAclRequest) : Core::Response
      Log.info { "performing 'PutBucketAcl' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("acl", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.acl.try(&.to_json_object_key)
        headers["x-amz-acl"] = value
      end
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.grant_full_control
        headers["x-amz-grant-full-control"] = value
      end
      if value = input.grant_read
        headers["x-amz-grant-read"] = value
      end
      if value = input.grant_read_acp
        headers["x-amz-grant-read-acp"] = value
      end
      if value = input.grant_write
        headers["x-amz-grant-write"] = value
      end
      if value = input.grant_write_acp
        headers["x-amz-grant-write-acp"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketAcl", "PUT", path, headers, input.access_control_policy.try(&.to_xml("AccessControlPolicy")), "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Sets an analytics configuration for the bucket (specified by the analytics configuration ID).
    # You can have up to 1,000 analytics configurations per bucket.
    #
    # You can choose to have storage class analysis export analysis reports sent to a comma-separated
    # values (CSV) flat file. See the `DataExport` request element. Reports are updated daily and are
    # based on the object filters that you configure. When selecting data export, you specify a
    # destination bucket and an optional destination prefix where the file is written. You can export
    # the data to a destination bucket in a different account. However, the destination bucket must be
    # in the same Region as the bucket that you are making the PUT analytics configuration to. For
    # more information, see [Amazon S3 Analytics – Storage Class
    # Analysis](https://docs.aws.amazon.com/AmazonS3/latest/dev/analytics-storage-class.html).
    #
    # You must create a bucket policy on the destination bucket where the exported file is written to
    # grant permissions to Amazon S3 to write objects to the bucket. For an example policy, see
    # [Granting Permissions for Amazon S3 Inventory and Storage Class
    # Analysis](https://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html#example-bucket-policies-use-case-9).
    #
    # To use this operation, you must have permissions to perform the `s3:PutAnalyticsConfiguration`
    # action. The bucket owner has this permission by default. The bucket owner can grant this
    # permission to others. For more information about permissions, see [Permissions Related to Bucket
    # Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # `PutBucketAnalyticsConfiguration` has the following special errors:
    #
    # -
    #
    # - *HTTP Error: HTTP 400 Bad Request*
    #
    # - *Code: InvalidArgument*
    #
    # - *Cause: Invalid argument.*
    #
    # -
    #
    # - *HTTP Error: HTTP 400 Bad Request*
    #
    # - *Code: TooManyConfigurations*
    #
    # - *Cause: You are attempting to create a new configuration but have already reached the
    # 1,000-configuration limit.*
    #
    # -
    #
    # - *HTTP Error: HTTP 403 Forbidden*
    #
    # - *Code: AccessDenied*
    #
    # - *Cause: You are not the owner of the specified bucket, or you do not have the
    # s3:PutAnalyticsConfiguration bucket permission to set the configuration on the bucket.*
    #
    # The following operations are related to `PutBucketAnalyticsConfiguration`:
    #
    # -
    # [GetBucketAnalyticsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAnalyticsConfiguration.html)
    #
    # -
    # [DeleteBucketAnalyticsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketAnalyticsConfiguration.html)
    #
    # -
    # [ListBucketAnalyticsConfigurations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketAnalyticsConfigurations.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_analytics_configuration(input : AS::PutBucketAnalyticsConfigurationRequest) : Core::Response
      Log.info { "performing 'PutBucketAnalyticsConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("analytics", "")
        if value = input.id
          form.add("id", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketAnalyticsConfiguration", "PUT", path, headers, input.analytics_configuration.try(&.to_xml("AnalyticsConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Sets the `cors` configuration for your bucket. If the configuration exists, Amazon S3 replaces
    # it.
    #
    # To use this operation, you must be allowed to perform the `s3:PutBucketCORS` action. By default,
    # the bucket owner has this permission and can grant it to others.
    #
    # You set this configuration on a bucket so that the bucket can service cross-origin requests. For
    # example, you might want to enable a request whose origin is `http://www.example.com` to access
    # your Amazon S3 bucket at `my.example.bucket.com` by using the browser's `XMLHttpRequest`
    # capability.
    #
    # To enable cross-origin resource sharing (CORS) on a bucket, you add the `cors` subresource to
    # the bucket. The `cors` subresource is an XML document in which you configure rules that identify
    # origins and the HTTP methods that can be executed on your bucket. The document is limited to 64
    # KB in size.
    #
    # When Amazon S3 receives a cross-origin request (or a pre-flight OPTIONS request) against a
    # bucket, it evaluates the `cors` configuration on the bucket and uses the first `CORSRule` rule
    # that matches the incoming browser request to enable a cross-origin request. For a rule to match,
    # the following conditions must be met:
    #
    # - The request's `Origin` header must match `AllowedOrigin` elements.
    #
    # - The request method (for example, GET, PUT, HEAD, and so on) or the
    # `Access-Control-Request-Method` header in case of a pre-flight `OPTIONS` request must be one of
    # the `AllowedMethod` elements.
    #
    # - Every header specified in the `Access-Control-Request-Headers` request header of a pre-flight
    # request must match an `AllowedHeader` element.
    #
    # For more information about CORS, go to [Enabling Cross-Origin Resource
    # Sharing](https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html) in the *Amazon S3 User
    # Guide*.
    #
    # The following operations are related to `PutBucketCors`:
    #
    # - [GetBucketCors](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketCors.html)
    #
    # - [DeleteBucketCors](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketCors.html)
    #
    # - [RESTOPTIONSobject](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTOPTIONSobject.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_cors(input : AS::PutBucketCorsRequest) : Core::Response
      Log.info { "performing 'PutBucketCors' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("cors", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketCors", "PUT", path, headers, input.cors_configuration.try(&.to_xml("CORSConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # This operation configures default encryption and Amazon S3 Bucket Keys for an existing bucket.
    # You can also [block encryption
    # types](https://docs.aws.amazon.com/AmazonS3/latest/API/API_BlockedEncryptionTypes.html) using
    # this operation.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # By default, all buckets have a default encryption configuration that uses server-side encryption
    # with Amazon S3 managed keys (SSE-S3).
    #
    # - **General purpose buckets**
    #
    # - You can optionally configure default encryption for a bucket by using server-side encryption
    # with Key Management Service (KMS) keys (SSE-KMS) or dual-layer server-side encryption with
    # Amazon Web Services KMS keys (DSSE-KMS). If you specify default encryption by using SSE-KMS, you
    # can also configure [Amazon S3 Bucket
    # Keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html). For information about
    # the bucket default encryption feature, see [Amazon S3 Bucket Default
    # Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html) in the
    # *Amazon S3 User Guide*.
    #
    # - If you use PutBucketEncryption to set your [default bucket
    # encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html) to SSE-KMS,
    # you should verify that your KMS key ID is correct. Amazon S3 doesn't validate the KMS key ID
    # provided in PutBucketEncryption requests.
    #
    # - **Directory buckets ** - You can optionally configure default encryption for a bucket by using
    # server-side encryption with Key Management Service (KMS) keys (SSE-KMS).
    #
    # - We recommend that the bucket's default encryption uses the desired encryption configuration
    # and you don't override the bucket default encryption in your `CreateSession` requests or `PUT`
    # object requests. Then, new objects are automatically encrypted with the desired encryption
    # settings. For more information about the encryption overriding behaviors in directory buckets,
    # see [Specifying server-side encryption with KMS for new object
    # uploads](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-specifying-kms-encryption.html).
    #
    # - Your SSE-KMS configuration can only support 1 [customer managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk) per
    # directory bucket's lifetime. The [Amazon Web Services managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk)
    # (`aws/s3`) isn't supported.
    #
    # - S3 Bucket Keys are always enabled for `GET` and `PUT` operations in a directory bucket and
    # can’t be disabled. S3 Bucket Keys aren't supported, when you copy SSE-KMS encrypted objects from
    # general purpose buckets to directory buckets, from directory buckets to general purpose buckets,
    # or between directory buckets, through
    # [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html),
    # [UploadPartCopy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html), [the
    # Copy operation in Batch
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-objects-Batch-Ops),
    # or [the import jobs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-import-job).
    # In this case, Amazon S3 makes a call to KMS every time a copy request is made for a
    # KMS-encrypted object.
    #
    # - When you specify an [KMS customer managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk) for
    # encryption in your directory bucket, only use the key ID or key ARN. The key alias format of the
    # KMS key isn't supported.
    #
    # - For directory buckets, if you use PutBucketEncryption to set your [default bucket
    # encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html) to SSE-KMS,
    # Amazon S3 validates the KMS key ID provided in PutBucketEncryption requests.
    #
    # If you're specifying a customer managed KMS key, we recommend using a fully qualified KMS key
    # ARN. If you use a KMS key alias instead, then KMS resolves the key within the requester’s
    # account. This behavior can result in data that's encrypted with a KMS key that belongs to the
    # requester, and not the bucket owner.
    #
    # Also, this action requires Amazon Web Services Signature Version 4. For more information, see [
    # Authenticating Requests (Amazon Web Services Signature Version
    # 4)](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html).
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - The `s3:PutEncryptionConfiguration` permission is
    # required in a policy. The bucket owner has this permission by default. The bucket owner can
    # grant this permission to others. For more information about permissions, see [Permissions
    # Related to Bucket
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:PutEncryptionConfiguration` permission in an IAM identity-based policy instead of a
    # bucket policy. Cross-account access to this API operation isn't supported. This operation can
    # only be performed by the Amazon Web Services account that owns the resource. For more
    # information about directory bucket policies and permissions, see [Amazon Web Services Identity
    # and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # To set a directory bucket default encryption with SSE-KMS, you must also have the
    # `kms:GenerateDataKey` and the `kms:Decrypt` permissions in IAM identity-based policies and KMS
    # key policies for the target KMS key.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `PutBucketEncryption`:
    #
    # -
    # [GetBucketEncryption](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketEncryption.html)
    #
    # -
    # [DeleteBucketEncryption](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketEncryption.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_encryption(input : AS::PutBucketEncryptionRequest) : Core::Response
      Log.info { "performing 'PutBucketEncryption' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("encryption", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketEncryption", "PUT", path, headers, input.server_side_encryption_configuration.try(&.to_xml("ServerSideEncryptionConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Puts a S3 Intelligent-Tiering configuration to the specified bucket. You can have up to 1,000 S3
    # Intelligent-Tiering configurations per bucket.
    #
    # The S3 Intelligent-Tiering storage class is designed to optimize storage costs by automatically
    # moving data to the most cost-effective storage access tier, without performance impact or
    # operational overhead. S3 Intelligent-Tiering delivers automatic cost savings in three low
    # latency and high throughput access tiers. To get the lowest storage cost on data that can be
    # accessed in minutes to hours, you can choose to activate additional archiving capabilities.
    #
    # The S3 Intelligent-Tiering storage class is the ideal storage class for data with unknown,
    # changing, or unpredictable access patterns, independent of object size or retention period. If
    # the size of an object is less than 128 KB, it is not monitored and not eligible for
    # auto-tiering. Smaller objects can be stored, but they are always charged at the Frequent Access
    # tier rates in the S3 Intelligent-Tiering storage class.
    #
    # For more information, see [Storage class for automatically optimizing frequently and
    # infrequently accessed
    # objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access).
    #
    # Operations related to `PutBucketIntelligentTieringConfiguration` include:
    #
    # -
    # [DeleteBucketIntelligentTieringConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketIntelligentTieringConfiguration.html)
    #
    # -
    # [GetBucketIntelligentTieringConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketIntelligentTieringConfiguration.html)
    #
    # -
    # [ListBucketIntelligentTieringConfigurations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketIntelligentTieringConfigurations.html)
    #
    # You only need S3 Intelligent-Tiering enabled on a bucket if you want to automatically move
    # objects stored in the S3 Intelligent-Tiering storage class to the Archive Access or Deep Archive
    # Access tier.
    #
    # `PutBucketIntelligentTieringConfiguration` has the following special errors:
    #
    # HTTP 400 Bad Request Error *Code:* InvalidArgument
    #
    # *Cause:* Invalid Argument
    #
    # HTTP 400 Bad Request Error *Code:* TooManyConfigurations
    #
    # *Cause:* You are attempting to create a new configuration but have already reached the
    # 1,000-configuration limit.
    #
    # HTTP 403 Forbidden Error *Cause:* You are not the owner of the specified bucket, or you do not
    # have the `s3:PutIntelligentTieringConfiguration` bucket permission to set the configuration on
    # the bucket.
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_intelligent_tiering_configuration(input : AS::PutBucketIntelligentTieringConfigurationRequest) : Core::Response
      Log.info { "performing 'PutBucketIntelligentTieringConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("intelligent-tiering", "")
        if value = input.id
          form.add("id", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketIntelligentTieringConfiguration", "PUT", path, headers, input.intelligent_tiering_configuration.try(&.to_xml("IntelligentTieringConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # This implementation of the `PUT` action adds an S3 Inventory configuration (identified by the
    # inventory ID) to the bucket. You can have up to 1,000 inventory configurations per bucket.
    #
    # Amazon S3 inventory generates inventories of the objects in the bucket on a daily or weekly
    # basis, and the results are published to a flat file. The bucket that is inventoried is called
    # the *source* bucket, and the bucket where the inventory flat file is stored is called the
    # *destination* bucket. The *destination* bucket must be in the same Amazon Web Services Region as
    # the *source* bucket.
    #
    # When you configure an inventory for a *source* bucket, you specify the *destination* bucket
    # where you want the inventory to be stored, and whether to generate the inventory daily or
    # weekly. You can also configure what object metadata to include and whether to inventory all
    # object versions or only current versions. For more information, see [Amazon S3
    # Inventory](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-inventory.html) in the Amazon
    # S3 User Guide.
    #
    # You must create a bucket policy on the *destination* bucket to grant permissions to Amazon S3 to
    # write objects to the bucket in the defined location. For an example policy, see [ Granting
    # Permissions for Amazon S3 Inventory and Storage Class
    # Analysis](https://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html#example-bucket-policies-use-case-9).
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions To use this operation, you must have permission to perform the
    # `s3:PutInventoryConfiguration` action. The bucket owner has this permission by default and can
    # grant this permission to others.
    #
    # The `s3:PutInventoryConfiguration` permission allows a user to create an [S3
    # Inventory](https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-inventory.html) report
    # that includes all object metadata fields available and to specify the destination bucket to
    # store the inventory. A user with read access to objects in the destination bucket can also
    # access all object metadata fields that are available in the inventory report.
    #
    # - **General purpose bucket permissions** - The `s3:PutInventoryConfiguration` permission is
    # required in a policy. For more information about general purpose buckets permissions, see [Using
    # Bucket Policies and User
    # Policies](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:PutInventoryConfiguration` permission in an IAM identity-based policy instead of a
    # bucket policy. For more information about directory bucket policies and permissions, see [Amazon
    # Web Services Identity and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # To restrict access to an inventory report, see [Restricting access to an Amazon S3 Inventory
    # report](https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html#example-bucket-policies-s3-inventory)
    # in the *Amazon S3 User Guide*. For more information about the metadata fields available in S3
    # Inventory, see [Amazon S3 Inventory
    # lists](https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-inventory.html#storage-inventory-contents)
    # in the *Amazon S3 User Guide*. For more information about permissions, see [Permissions related
    # to bucket subresource
    # operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Identity and access management in Amazon
    # S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html) in the *Amazon
    # S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # `PutBucketInventoryConfiguration` has the following special errors:
    #
    # HTTP 400 Bad Request Error *Code:* InvalidArgument
    #
    # *Cause:* Invalid Argument
    #
    # HTTP 400 Bad Request Error *Code:* TooManyConfigurations
    #
    # *Cause:* You are attempting to create a new configuration but have already reached the
    # 1,000-configuration limit.
    #
    # HTTP 403 Forbidden Error *Cause:* You are not the owner of the specified bucket, or you do not
    # have the `s3:PutInventoryConfiguration` bucket permission to set the configuration on the
    # bucket.
    #
    # The following operations are related to `PutBucketInventoryConfiguration`:
    #
    # -
    # [GetBucketInventoryConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketInventoryConfiguration.html)
    #
    # -
    # [DeleteBucketInventoryConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketInventoryConfiguration.html)
    #
    # -
    # [ListBucketInventoryConfigurations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketInventoryConfigurations.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_inventory_configuration(input : AS::PutBucketInventoryConfigurationRequest) : Core::Response
      Log.info { "performing 'PutBucketInventoryConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("inventory", "")
        if value = input.id
          form.add("id", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketInventoryConfiguration", "PUT", path, headers, input.inventory_configuration.try(&.to_xml("InventoryConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # Creates a new lifecycle configuration for the bucket or replaces an existing lifecycle
    # configuration. Keep in mind that this will overwrite an existing lifecycle configuration, so if
    # you want to retain any configuration details, they must be included in the new lifecycle
    # configuration. For information about lifecycle configuration, see [Managing your storage
    # lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html).
    #
    # Bucket lifecycle configuration now supports specifying a lifecycle rule using an object key name
    # prefix, one or more object tags, object size, or any combination of these. Accordingly, this
    # section describes the latest API. The previous version of the API supported filtering based only
    # on an object key name prefix, which is supported for backward compatibility. For the related API
    # description, see
    # [PutBucketLifecycle](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycle.html).
    #
    # Rules You specify the lifecycle configuration in your request body. The lifecycle configuration
    # is specified as XML consisting of one or more rules. An Amazon S3 Lifecycle configuration can
    # have up to 1,000 rules. This limit is not adjustable.
    #
    # Bucket lifecycle configuration supports specifying a lifecycle rule using an object key name
    # prefix, one or more object tags, object size, or any combination of these. Accordingly, this
    # section describes the latest API. The previous version of the API supported filtering based only
    # on an object key name prefix, which is supported for backward compatibility for general purpose
    # buckets. For the related API description, see
    # [PutBucketLifecycle](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycle.html).
    #
    # Lifecyle configurations for directory buckets only support expiring objects and cancelling
    # multipart uploads. Expiring of versioned objects,transitions and tag filters are not supported.
    #
    # A lifecycle rule consists of the following:
    #
    # - A filter identifying a subset of objects to which the rule applies. The filter can be based on
    # a key name prefix, object tags, object size, or any combination of these.
    #
    # - A status indicating whether the rule is in effect.
    #
    # - One or more lifecycle transition and expiration actions that you want Amazon S3 to perform on
    # the objects identified by the filter. If the state of your bucket is versioning-enabled or
    # versioning-suspended, you can have many versions of the same object (one current version and
    # zero or more noncurrent versions). Amazon S3 provides predefined actions that you can specify
    # for current and noncurrent object versions.
    #
    # For more information, see [Object Lifecycle
    # Management](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html) and
    # [Lifecycle Configuration
    # Elements](https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html).
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - By default, all Amazon S3 resources are private,
    # including buckets, objects, and related subresources (for example, lifecycle configuration and
    # website configuration). Only the resource owner (that is, the Amazon Web Services account that
    # created it) can access the resource. The resource owner can optionally grant access permissions
    # to others by writing an access policy. For this operation, a user must have the
    # `s3:PutLifecycleConfiguration` permission.
    #
    # You can also explicitly deny permissions. An explicit deny also supersedes any other
    # permissions. If you want to block users or accounts from removing or deleting objects from your
    # bucket, you must deny them permissions for the following actions:
    #
    # - `s3:DeleteObject`
    #
    # - `s3:DeleteObjectVersion`
    #
    # - `s3:PutLifecycleConfiguration`
    #
    # For more information about permissions, see [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # - **Directory bucket permissions** - You must have the `s3express:PutLifecycleConfiguration`
    # permission in an IAM identity-based policy to use this operation. Cross-account access to this
    # API operation isn't supported. The resource owner can optionally grant access permissions to
    # others by creating a role or user for them as long as they are within the same account as the
    # owner and resource.
    #
    # For more information about directory bucket policies and permissions, see [Authorizing Regional
    # endpoint APIs with
    # IAM](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region*.amazonaws.com`.
    #
    # The following operations are related to `PutBucketLifecycleConfiguration`:
    #
    # -
    # [GetBucketLifecycleConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycleConfiguration.html)
    #
    # -
    # [DeleteBucketLifecycle](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketLifecycle.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_lifecycle_configuration(input : AS::PutBucketLifecycleConfigurationRequest) : Core::ParsedResponse(AS::PutBucketLifecycleConfigurationOutput)
      Log.info { "performing 'PutBucketLifecycleConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("lifecycle", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.transition_default_minimum_object_size.try(&.to_json_object_key)
        headers["x-amz-transition-default-minimum-object-size"] = value
      end
      response = rest_request("PutBucketLifecycleConfiguration", "PUT", path, headers, input.lifecycle_configuration.try(&.to_xml("LifecycleConfiguration")), "application/xml")
      result = AS::PutBucketLifecycleConfigurationOutput.new(
        transition_default_minimum_object_size: response.headers["x-amz-transition-default-minimum-object-size"]?.try { |value| AS::TransitionDefaultMinimumObjectSize.from_json_object_key?(value) },
      )
      Core::ParsedResponse(AS::PutBucketLifecycleConfigurationOutput).new(response, result)
    end

    # End of support notice: As of October 1, 2025, Amazon S3 has discontinued support for Email
    # Grantee Access Control Lists (ACLs). If you attempt to use an Email Grantee ACL in a request
    # after October 1, 2025, the request will receive an `HTTP 405` (Method Not Allowed) error.
    #
    # This change affects the following Amazon Web Services Regions: US East (N. Virginia), US West
    # (N. California), US West (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific
    # (Tokyo), Europe (Ireland), and South America (São Paulo).
    #
    # This operation is not supported for directory buckets.
    #
    # Set the logging parameters for a bucket and to specify permissions for who can view and modify
    # the logging parameters. All logs are saved to buckets in the same Amazon Web Services Region as
    # the source bucket. To set the logging status of a bucket, you must be the bucket owner.
    #
    # The bucket owner is automatically granted FULL_CONTROL to all logs. You use the `Grantee`
    # request element to grant access to other people. The `Permissions` request element specifies the
    # kind of access the grantee has to the logs.
    #
    # If the target bucket for log delivery uses the bucket owner enforced setting for S3 Object
    # Ownership, you can't use the `Grantee` request element to grant access to others. Permissions
    # can only be granted using policies. For more information, see [Permissions for server access log
    # delivery](https://docs.aws.amazon.com/AmazonS3/latest/userguide/enable-server-access-logging.html#grant-log-delivery-permissions-general)
    # in the *Amazon S3 User Guide*.
    #
    # Grantee Values You can specify the person (grantee) to whom you're assigning access rights (by
    # using request elements) in the following ways. For examples of how to specify these grantee
    # values in JSON format, see the Amazon Web Services CLI example in [ Enabling Amazon S3 server
    # access
    # logging](https://docs.aws.amazon.com/AmazonS3/latest/userguide/enable-server-access-logging.html)
    # in the *Amazon S3 User Guide*.
    #
    # - By the person's ID:
    #
    # `<>ID<><>GranteesEmail<> `
    #
    # `DisplayName` is optional and ignored in the request.
    #
    # - By Email address:
    #
    # ` <>Grantees@email.com<>`
    #
    # The grantee is resolved to the `CanonicalUser` and, in a response to a `GETObjectAcl` request,
    # appears as the CanonicalUser.
    #
    # - By URI:
    #
    # `<>http://acs.amazonaws.com/groups/global/AuthenticatedUsers<>`
    #
    # To enable logging, you use `LoggingEnabled` and its children request elements. To disable
    # logging, you use an empty `BucketLoggingStatus` request element:
    #
    # ``
    #
    # For more information about server access logging, see [Server Access
    # Logging](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ServerLogs.html) in the *Amazon
    # S3 User Guide*.
    #
    # For more information about creating a bucket, see
    # [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html). For more
    # information about returning the logging status of a bucket, see
    # [GetBucketLogging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLogging.html).
    #
    # The following operations are related to `PutBucketLogging`:
    #
    # - [PutObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)
    #
    # - [DeleteBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html)
    #
    # - [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
    #
    # - [GetBucketLogging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLogging.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_logging(input : AS::PutBucketLoggingRequest) : Core::Response
      Log.info { "performing 'PutBucketLogging' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("logging", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketLogging", "PUT", path, headers, input.bucket_logging_status.try(&.to_xml("BucketLoggingStatus")), "application/xml")
      Core::Response.new(response)
    end

    # Sets a metrics configuration (specified by the metrics configuration ID) for the bucket. You can
    # have up to 1,000 metrics configurations per bucket. If you're updating an existing metrics
    # configuration, note that this is a full replacement of the existing metrics configuration. If
    # you don't include the elements you want to keep, they are erased.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions To use this operation, you must have permissions to perform the
    # `s3:PutMetricsConfiguration` action. The bucket owner has this permission by default. The bucket
    # owner can grant this permission to others. For more information about permissions, see
    # [Permissions Related to Bucket Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # - **General purpose bucket permissions** - The `s3:PutMetricsConfiguration` permission is
    # required in a policy. For more information about general purpose buckets permissions, see [Using
    # Bucket Policies and User
    # Policies](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:PutMetricsConfiguration` permission in an IAM identity-based policy instead of a
    # bucket policy. Cross-account access to this API operation isn't supported. This operation can
    # only be performed by the Amazon Web Services account that owns the resource. For more
    # information about directory bucket policies and permissions, see [Amazon Web Services Identity
    # and Access Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # For information about CloudWatch request metrics for Amazon S3, see [Monitoring Metrics with
    # Amazon CloudWatch](https://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html).
    #
    # The following operations are related to `PutBucketMetricsConfiguration`:
    #
    # -
    # [DeleteBucketMetricsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetricsConfiguration.html)
    #
    # -
    # [GetBucketMetricsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetricsConfiguration.html)
    #
    # -
    # [ListBucketMetricsConfigurations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketMetricsConfigurations.html)
    #
    # `PutBucketMetricsConfiguration` has the following special error:
    #
    # - Error code: `TooManyConfigurations`
    #
    # - Description: You are attempting to create a new configuration but have already reached the
    # 1,000-configuration limit.
    #
    # - HTTP Status Code: HTTP 400 Bad Request
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_metrics_configuration(input : AS::PutBucketMetricsConfigurationRequest) : Core::Response
      Log.info { "performing 'PutBucketMetricsConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("metrics", "")
        if value = input.id
          form.add("id", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketMetricsConfiguration", "PUT", path, headers, input.metrics_configuration.try(&.to_xml("MetricsConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Enables notifications of specified events for a bucket. For more information about event
    # notifications, see [Configuring Event
    # Notifications](https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html).
    #
    # Using this API, you can replace an existing notification configuration. The configuration is an
    # XML file that defines the event types that you want Amazon S3 to publish and the destination
    # where you want Amazon S3 to publish an event notification when it detects an event of the
    # specified type.
    #
    # By default, your bucket has no event notifications configured. That is, the notification
    # configuration will be an empty `NotificationConfiguration`.
    #
    # ``
    #
    # ``
    #
    # This action replaces the existing notification configuration with the configuration you include
    # in the request body.
    #
    # After Amazon S3 receives this request, it first verifies that any Amazon Simple Notification
    # Service (Amazon SNS) or Amazon Simple Queue Service (Amazon SQS) destination exists, and that
    # the bucket owner has permission to publish to it by sending a test notification. In the case of
    # Lambda destinations, Amazon S3 verifies that the Lambda function permissions grant Amazon S3
    # permission to invoke the function from the Amazon S3 bucket. For more information, see
    # [Configuring Notifications for Amazon S3
    # Events](https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html).
    #
    # You can disable notifications by adding the empty NotificationConfiguration element.
    #
    # For more information about the number of event notification configurations that you can create
    # per bucket, see [Amazon S3 service
    # quotas](https://docs.aws.amazon.com/general/latest/gr/s3.html#limits_s3) in *Amazon Web Services
    # General Reference*.
    #
    # By default, only the bucket owner can configure notifications on a bucket. However, bucket
    # owners can use a bucket policy to grant permission to other users to set this configuration with
    # the required `s3:PutBucketNotification` permission.
    #
    # The PUT notification is an atomic operation. For example, suppose your notification
    # configuration includes SNS topic, SQS queue, and Lambda function configurations. When you send a
    # PUT request with this configuration, Amazon S3 sends test messages to your SNS topic. If the
    # message fails, the entire PUT action will fail, and Amazon S3 will not add the configuration to
    # your bucket.
    #
    # If the configuration in the request body includes only one `TopicConfiguration` specifying only
    # the `s3:ReducedRedundancyLostObject` event type, the response will also include the
    # `x-amz-sns-test-message-id` header containing the message ID of the test notification sent to
    # the topic.
    #
    # The following action is related to `PutBucketNotificationConfiguration`:
    #
    # -
    # [GetBucketNotificationConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketNotificationConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_notification_configuration(input : AS::PutBucketNotificationConfigurationRequest) : Core::Response
      Log.info { "performing 'PutBucketNotificationConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("notification", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.skip_destination_validation.try(&.to_s)
        headers["x-amz-skip-destination-validation"] = value
      end
      response = rest_request("PutBucketNotificationConfiguration", "PUT", path, headers, input.notification_configuration.try(&.to_xml("NotificationConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Creates or modifies `OwnershipControls` for an Amazon S3 bucket. To use this operation, you must
    # have the `s3:PutBucketOwnershipControls` permission. For more information about Amazon S3
    # permissions, see [Specifying permissions in a
    # policy](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/using-with-s3-actions.html).
    #
    # For information about Amazon S3 Object Ownership, see [Using object
    # ownership](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/about-object-ownership.html).
    #
    # The following operations are related to `PutBucketOwnershipControls`:
    #
    # - GetBucketOwnershipControls
    #
    # - DeleteBucketOwnershipControls
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_ownership_controls(input : AS::PutBucketOwnershipControlsRequest) : Core::Response
      Log.info { "performing 'PutBucketOwnershipControls' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("ownershipControls", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      response = rest_request("PutBucketOwnershipControls", "PUT", path, headers, input.ownership_controls.try(&.to_xml("OwnershipControls")), "application/xml")
      Core::Response.new(response)
    end

    # Applies an Amazon S3 bucket policy to an Amazon S3 bucket.
    #
    # **Directory buckets ** - For directory buckets, you must make requests for this API operation to
    # the Regional endpoint. These endpoints support path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. For more information about endpoints in Availability Zones, see
    # [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions If you are using an identity other than the root user of the Amazon Web Services
    # account that owns the bucket, the calling identity must both have the `PutBucketPolicy`
    # permissions on the specified bucket and belong to the bucket owner's account in order to use
    # this operation.
    #
    # If you don't have `PutBucketPolicy` permissions, Amazon S3 returns a `403 Access Denied` error.
    # If you have the correct permissions, but you're not using an identity that belongs to the bucket
    # owner's account, Amazon S3 returns a `405 Method Not Allowed` error.
    #
    # To ensure that bucket owners don't inadvertently lock themselves out of their own buckets, the
    # root principal in a bucket owner's Amazon Web Services account can perform the
    # `GetBucketPolicy`, `PutBucketPolicy`, and `DeleteBucketPolicy` API actions, even if their bucket
    # policy explicitly denies the root principal's access. Bucket owner root principals can only be
    # blocked from performing these API actions by VPC endpoint policies and Amazon Web Services
    # Organizations policies.
    #
    # - **General purpose bucket permissions** - The `s3:PutBucketPolicy` permission is required in a
    # policy. For more information about general purpose buckets bucket policies, see [Using Bucket
    # Policies and User
    # Policies](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html) in the
    # *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation, you must have the
    # `s3express:PutBucketPolicy` permission in an IAM identity-based policy instead of a bucket
    # policy. Cross-account access to this API operation isn't supported. This operation can only be
    # performed by the Amazon Web Services account that owns the resource. For more information about
    # directory bucket policies and permissions, see [Amazon Web Services Identity and Access
    # Management (IAM) for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam.html) in the
    # *Amazon S3 User Guide*.
    #
    # Example bucket policies **General purpose buckets example bucket policies** - See [Bucket policy
    # examples](https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html) in
    # the *Amazon S3 User Guide*.
    #
    # **Directory bucket example bucket policies** - See [Example bucket policies for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam-example-bucket-policies.html)
    # in the *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is
    # `s3express-control.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `PutBucketPolicy`:
    #
    # - [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
    #
    # - [DeleteBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_policy(input : AS::PutBucketPolicyRequest) : Core::Response
      Log.info { "performing 'PutBucketPolicy' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("policy", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.confirm_remove_self_bucket_access.try(&.to_s)
        headers["x-amz-confirm-remove-self-bucket-access"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketPolicy", "PUT", path, headers, input.policy, "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Creates a replication configuration or replaces an existing one. For more information, see
    # [Replication](https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html) in the *Amazon
    # S3 User Guide*.
    #
    # Specify the replication configuration in the request body. In the replication configuration, you
    # provide the name of the destination bucket or buckets where you want Amazon S3 to replicate
    # objects, the IAM role that Amazon S3 can assume to replicate objects on your behalf, and other
    # relevant information. You can invoke this request for a specific Amazon Web Services Region by
    # using the [ `aws:RequestedRegion`
    # ](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-requestedregion)
    # condition key.
    #
    # A replication configuration must include at least one rule, and can contain a maximum of 1,000.
    # Each rule identifies a subset of objects to replicate by filtering the objects in the source
    # bucket. To choose additional subsets of objects to replicate, add a rule for each subset.
    #
    # To specify a subset of the objects in the source bucket to apply a replication rule to, add the
    # Filter element as a child of the Rule element. You can filter objects based on an object key
    # prefix, one or more object tags, or both. When you add the Filter element in the configuration,
    # you must also add the following elements: `DeleteMarkerReplication`, `Status`, and `Priority`.
    #
    # If you are using an earlier version of the replication configuration, Amazon S3 handles
    # replication of delete markers differently. For more information, see [Backward
    # Compatibility](https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-add-config.html#replication-backward-compat-considerations).
    #
    # For information about enabling versioning on a bucket, see [Using
    # Versioning](https://docs.aws.amazon.com/AmazonS3/latest/dev/Versioning.html).
    #
    # Handling Replication of Encrypted Objects By default, Amazon S3 doesn't replicate objects that
    # are stored at rest using server-side encryption with KMS keys. To replicate Amazon Web Services
    # KMS-encrypted objects, add the following: `SourceSelectionCriteria`, `SseKmsEncryptedObjects`,
    # `Status`, `EncryptionConfiguration`, and `ReplicaKmsKeyID`. For information about replication
    # configuration, see [Replicating Objects Created with SSE Using KMS
    # keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-config-for-kms-objects.html).
    #
    # For information on `PutBucketReplication` errors, see [List of replication-related error
    # codes](https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ReplicationErrorCodeList)
    #
    # Permissions To create a `PutBucketReplication` request, you must have
    # `s3:PutReplicationConfiguration` permissions for the bucket.
    #
    # By default, a resource owner, in this case the Amazon Web Services account that created the
    # bucket, can perform this operation. The resource owner can also grant others permissions to
    # perform the operation. For more information about permissions, see [Specifying Permissions in a
    # Policy](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html) and
    # [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # To perform this operation, the user or role performing the action must have the
    # [iam:PassRole](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html)
    # permission.
    #
    # The following operations are related to `PutBucketReplication`:
    #
    # -
    # [GetBucketReplication](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketReplication.html)
    #
    # -
    # [DeleteBucketReplication](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketReplication.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_replication(input : AS::PutBucketReplicationRequest) : Core::Response
      Log.info { "performing 'PutBucketReplication' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("replication", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.token
        headers["x-amz-bucket-object-lock-token"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketReplication", "PUT", path, headers, input.replication_configuration.try(&.to_xml("ReplicationConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Sets the request payment configuration for a bucket. By default, the bucket owner pays for
    # downloads from the bucket. This configuration parameter enables the bucket owner (only) to
    # specify that the person requesting the download will be charged for the download. For more
    # information, see [Requester Pays
    # Buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html).
    #
    # The following operations are related to `PutBucketRequestPayment`:
    #
    # - [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
    #
    # -
    # [GetBucketRequestPayment](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketRequestPayment.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_request_payment(input : AS::PutBucketRequestPaymentRequest) : Core::Response
      Log.info { "performing 'PutBucketRequestPayment' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("requestPayment", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketRequestPayment", "PUT", path, headers, input.request_payment_configuration.try(&.to_xml("RequestPaymentConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Sets the tags for a general purpose bucket if attribute based access control (ABAC) is not
    # enabled for the bucket. When you [enable ABAC for a general purpose
    # bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/buckets-tagging-enable-abac.html),
    # you can no longer use this operation for that bucket and must use the
    # [TagResource](https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_TagResource.html) or
    # [UntagResource](https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_UntagResource.html)
    # operations instead.
    #
    # Use tags to organize your Amazon Web Services bill to reflect your own cost structure. To do
    # this, sign up to get your Amazon Web Services account bill with tag key values included. Then,
    # to see the cost of combined resources, organize your billing information according to resources
    # with the same tag key values. For example, you can tag several resources with a specific
    # application name, and then organize your billing information to see the total cost of that
    # application across several services. For more information, see [Cost Allocation and
    # Tagging](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html) and
    # [Using Cost Allocation in Amazon S3 Bucket
    # Tags](https://docs.aws.amazon.com/AmazonS3/latest/userguide/CostAllocTagging.html).
    #
    # When this operation sets the tags for a bucket, it will overwrite any current tags the bucket
    # already has. You cannot use this operation to add tags to an existing list of tags.
    #
    # To use this operation, you must have permissions to perform the `s3:PutBucketTagging` action.
    # The bucket owner has this permission by default and can grant this permission to others. For
    # more information about permissions, see [Permissions Related to Bucket Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html).
    #
    # `PutBucketTagging` has the following special errors. For more Amazon S3 errors see, [Error
    # Responses](https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html).
    #
    # - `InvalidTag` - The tag provided was not a valid tag. This error can occur if the tag did not
    # pass input validation. For more information, see [Using Cost Allocation in Amazon S3 Bucket
    # Tags](https://docs.aws.amazon.com/AmazonS3/latest/userguide/CostAllocTagging.html).
    #
    # - `MalformedXML` - The XML provided does not match the schema.
    #
    # - `OperationAborted` - A conflicting conditional action is currently in progress against this
    # resource. Please try again.
    #
    # - `InternalError` - The service was unable to apply the provided tag to the bucket.
    #
    # The following operations are related to `PutBucketTagging`:
    #
    # - [GetBucketTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketTagging.html)
    #
    # -
    # [DeleteBucketTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketTagging.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_tagging(input : AS::PutBucketTaggingRequest) : Core::Response
      Log.info { "performing 'PutBucketTagging' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("tagging", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketTagging", "PUT", path, headers, input.tagging.try(&.to_xml("Tagging")), "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # When you enable versioning on a bucket for the first time, it might take a short amount of time
    # for the change to be fully propagated. While this change is propagating, you might encounter
    # intermittent `HTTP 404 NoSuchKey` errors for requests to objects created or updated after
    # enabling versioning. We recommend that you wait for 15 minutes after enabling versioning before
    # issuing write operations (`PUT` or `DELETE`) on objects in the bucket.
    #
    # Sets the versioning state of an existing bucket.
    #
    # You can set the versioning state with one of the following values:
    #
    # **Enabled**—Enables versioning for the objects in the bucket. All objects added to the bucket
    # receive a unique version ID.
    #
    # **Suspended**—Disables versioning for the objects in the bucket. All objects added to the bucket
    # receive the version ID null.
    #
    # If the versioning state has never been set on a bucket, it has no versioning state; a
    # [GetBucketVersioning](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html)
    # request does not return a versioning state value.
    #
    # In order to enable MFA Delete, you must be the bucket owner. If you are the bucket owner and
    # want to enable MFA Delete in the bucket versioning configuration, you must include the
    # `x-amz-mfa request` header and the `Status` and the `MfaDelete` request elements in a request to
    # set the versioning state of the bucket.
    #
    # If you have an object expiration lifecycle configuration in your non-versioned bucket and you
    # want to maintain the same permanent delete behavior when you enable versioning, you must add a
    # noncurrent expiration policy. The noncurrent expiration lifecycle configuration will manage the
    # deletes of the noncurrent object versions in the version-enabled bucket. (A version-enabled
    # bucket maintains one current and zero or more noncurrent object versions.) For more information,
    # see [Lifecycle and
    # Versioning](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html#lifecycle-and-other-bucket-config).
    #
    # The following operations are related to `PutBucketVersioning`:
    #
    # - [CreateBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
    #
    # - [DeleteBucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html)
    #
    # -
    # [GetBucketVersioning](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_versioning(input : AS::PutBucketVersioningRequest) : Core::Response
      Log.info { "performing 'PutBucketVersioning' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("versioning", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.mfa
        headers["x-amz-mfa"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketVersioning", "PUT", path, headers, input.versioning_configuration.try(&.to_xml("VersioningConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets.
    #
    # Sets the configuration of the website that is specified in the `website` subresource. To
    # configure a bucket as a website, you can add this subresource on the bucket with website
    # configuration information such as the file name of the index document and any redirect rules.
    # For more information, see [Hosting Websites on Amazon
    # S3](https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html).
    #
    # This PUT action requires the `S3:PutBucketWebsite` permission. By default, only the bucket owner
    # can configure the website attached to a bucket; however, bucket owners can allow other users to
    # set the website configuration by writing a bucket policy that grants them the
    # `S3:PutBucketWebsite` permission.
    #
    # To redirect all website requests sent to the bucket's website endpoint, you add a website
    # configuration with the following elements. Because all requests are sent to another website, you
    # don't need to provide index document name for the bucket.
    #
    # - `WebsiteConfiguration`
    #
    # - `RedirectAllRequestsTo`
    #
    # - `HostName`
    #
    # - `Protocol`
    #
    # If you want granular control over redirects, you can use the following elements to add routing
    # rules that describe conditions for redirecting requests and information about the redirect
    # destination. In this case, the website configuration must provide an index document for the
    # bucket, because some requests might not be redirected.
    #
    # - `WebsiteConfiguration`
    #
    # - `IndexDocument`
    #
    # - `Suffix`
    #
    # - `ErrorDocument`
    #
    # - `Key`
    #
    # - `RoutingRules`
    #
    # - `RoutingRule`
    #
    # - `Condition`
    #
    # - `HttpErrorCodeReturnedEquals`
    #
    # - `KeyPrefixEquals`
    #
    # - `Redirect`
    #
    # - `Protocol`
    #
    # - `HostName`
    #
    # - `ReplaceKeyPrefixWith`
    #
    # - `ReplaceKeyWith`
    #
    # - `HttpRedirectCode`
    #
    # Amazon S3 has a limitation of 50 routing rules per website configuration. If you require more
    # than 50 routing rules, you can use object redirect. For more information, see [Configuring an
    # Object Redirect](https://docs.aws.amazon.com/AmazonS3/latest/dev/how-to-page-redirect.html) in
    # the *Amazon S3 User Guide*.
    #
    # The maximum request length is limited to 128 KB.
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_bucket_website(input : AS::PutBucketWebsiteRequest) : Core::Response
      Log.info { "performing 'PutBucketWebsite' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("website", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutBucketWebsite", "PUT", path, headers, input.website_configuration.try(&.to_xml("WebsiteConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # End of support notice: As of October 1, 2025, Amazon S3 has discontinued support for Email
    # Grantee Access Control Lists (ACLs). If you attempt to use an Email Grantee ACL in a request
    # after October 1, 2025, the request will receive an `HTTP 405` (Method Not Allowed) error.
    #
    # This change affects the following Amazon Web Services Regions: US East (N. Virginia), US West
    # (N. California), US West (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific
    # (Tokyo), Europe (Ireland), and South America (São Paulo).
    #
    # Adds an object to a bucket.
    #
    # - Amazon S3 never adds partial objects; if you receive a success response, Amazon S3 added the
    # entire object to the bucket. You cannot use `PutObject` to only update a single piece of
    # metadata for an existing object. You must put the entire object with updated metadata if you
    # want to update some values.
    #
    # - If your bucket uses the bucket owner enforced setting for Object Ownership, ACLs are disabled
    # and no longer affect permissions. All objects written to the bucket by any account will be owned
    # by the bucket owner.
    #
    # - **Directory buckets** - For directory buckets, you must make requests for this API operation
    # to the Zonal endpoint. These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Amazon S3 is a distributed system. If it receives multiple write requests for the same object
    # simultaneously, it overwrites all but the last object written. However, Amazon S3 provides
    # features that can modify this behavior:
    #
    # - **S3 Object Lock** - To prevent objects from being deleted or overwritten, you can use [Amazon
    # S3 Object Lock](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html) in the
    # *Amazon S3 User Guide*.
    #
    # This functionality is not supported for directory buckets.
    #
    # - **If-None-Match** - Uploads the object only if the object key name does not already exist in
    # the specified bucket. Otherwise, Amazon S3 returns a `412 Precondition Failed` error. If a
    # conflicting operation occurs during the upload, S3 returns a `409 ConditionalRequestConflict`
    # response. On a 409 failure, retry the upload.
    #
    # Expects the * character (asterisk).
    #
    # For more information, see [Add preconditions to S3 operations with conditional
    # requests](https://docs.aws.amazon.com/AmazonS3/latest/userguide/conditional-requests.html) in
    # the *Amazon S3 User Guide* or [RFC 7232](https://datatracker.ietf.org/doc/rfc7232/).
    #
    # This functionality is not supported for S3 on Outposts.
    #
    # - **S3 Versioning** - When you enable versioning for a bucket, if Amazon S3 receives multiple
    # write requests for the same object simultaneously, it stores all versions of the objects. For
    # each write request that is made to the same object, Amazon S3 automatically generates a unique
    # version ID of that object being stored in Amazon S3. You can retrieve, replace, or delete any
    # version of the object. For more information about versioning, see [Adding Objects to
    # Versioning-Enabled
    # Buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/AddingObjectstoVersioningEnabledBuckets.html)
    # in the *Amazon S3 User Guide*. For information about returning the versioning state of a bucket,
    # see
    # [GetBucketVersioning](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html).
    #
    # This functionality is not supported for directory buckets.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - The following permissions are required in your
    # policies when your `PutObject` request includes specific headers.
    #
    # - ** `s3:PutObject` ** - To successfully complete the `PutObject` request, you must always have
    # the `s3:PutObject` permission on a bucket to add an object to it.
    #
    # - ** `s3:PutObjectAcl` ** - To successfully change the objects ACL of your `PutObject` request,
    # you must have the `s3:PutObjectAcl`.
    #
    # - ** `s3:PutObjectTagging` ** - To successfully set the tag-set with your `PutObject` request,
    # you must have the `s3:PutObjectTagging`.
    #
    # - **Directory bucket permissions** - To grant access to this API operation on a directory
    # bucket, we recommend that you use the [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) API operation for
    # session-based authorization. Specifically, you grant the `s3express:CreateSession` permission to
    # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
    # `CreateSession` API call on the bucket to obtain a session token. With the session token in your
    # request header, you can make API requests to this operation. After the session token expires,
    # you make another `CreateSession` API call to generate a new session token for use. Amazon Web
    # Services CLI or SDKs create session and refresh the session token automatically to avoid service
    # interruptions when a session expires. For more information about authorization, see [
    # `CreateSession` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html).
    #
    # If the object is encrypted with SSE-KMS, you must also have the `kms:GenerateDataKey` and
    # `kms:Decrypt` permissions in IAM identity-based policies and KMS key policies for the KMS key.
    #
    # Data integrity with Content-MD5
    #
    # - **General purpose bucket** - To ensure that data is not corrupted traversing the network, use
    # the `Content-MD5` header. When you use this header, Amazon S3 checks the object against the
    # provided MD5 value and, if they do not match, Amazon S3 returns an error. Alternatively, when
    # the object's ETag is its MD5 digest, you can calculate the MD5 while putting the object to
    # Amazon S3 and compare the returned ETag to the calculated MD5 value.
    #
    # - **Directory bucket** - This functionality is not supported for directory buckets.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # Errors
    #
    # - You might receive an `InvalidRequest` error for several reasons. Depending on the reason for
    # the error, you might receive one of the following messages:
    #
    # - Cannot specify both a write offset value and user-defined object metadata for existing
    # objects.
    #
    # - Checksum Type mismatch occurred, expected checksum Type: sha1, actual checksum Type: crc32c.
    #
    # - Request body cannot be empty when 'write offset' is specified.
    #
    # For more information about related Amazon S3 APIs, see the following:
    #
    # - [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html)
    #
    # - [DeleteObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_object(input : AS::PutObjectRequest) : Core::ParsedResponse(AS::PutObjectOutput)
      Log.info { "performing 'PutObject' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("x-id", "PutObject")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.acl.try(&.to_json_object_key)
        headers["x-amz-acl"] = value
      end
      if value = input.cache_control
        headers["Cache-Control"] = value
      end
      if value = input.content_disposition
        headers["Content-Disposition"] = value
      end
      if value = input.content_encoding
        headers["Content-Encoding"] = value
      end
      if value = input.content_language
        headers["Content-Language"] = value
      end
      if value = input.content_length.try(&.to_s)
        headers["Content-Length"] = value
      end
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.content_type
        headers["Content-Type"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.checksum_crc32
        headers["x-amz-checksum-crc32"] = value
      end
      if value = input.checksum_crc32c
        headers["x-amz-checksum-crc32c"] = value
      end
      if value = input.checksum_crc64nvme
        headers["x-amz-checksum-crc64nvme"] = value
      end
      if value = input.checksum_sha1
        headers["x-amz-checksum-sha1"] = value
      end
      if value = input.checksum_sha256
        headers["x-amz-checksum-sha256"] = value
      end
      if value = input.checksum_sha512
        headers["x-amz-checksum-sha512"] = value
      end
      if value = input.checksum_md5
        headers["x-amz-checksum-md5"] = value
      end
      if value = input.checksum_xxhash64
        headers["x-amz-checksum-xxhash64"] = value
      end
      if value = input.checksum_xxhash3
        headers["x-amz-checksum-xxhash3"] = value
      end
      if value = input.checksum_xxhash128
        headers["x-amz-checksum-xxhash128"] = value
      end
      if value = input.expires
        headers["Expires"] = value
      end
      if value = input.if_match
        headers["If-Match"] = value
      end
      if value = input.if_none_match
        headers["If-None-Match"] = value
      end
      if value = input.grant_full_control
        headers["x-amz-grant-full-control"] = value
      end
      if value = input.grant_read
        headers["x-amz-grant-read"] = value
      end
      if value = input.grant_read_acp
        headers["x-amz-grant-read-acp"] = value
      end
      if value = input.grant_write_acp
        headers["x-amz-grant-write-acp"] = value
      end
      if value = input.write_offset_bytes.try(&.to_s)
        headers["x-amz-write-offset-bytes"] = value
      end
      if value = input.server_side_encryption.try(&.to_json_object_key)
        headers["x-amz-server-side-encryption"] = value
      end
      if value = input.storage_class.try(&.to_json_object_key)
        headers["x-amz-storage-class"] = value
      end
      if value = input.website_redirect_location
        headers["x-amz-website-redirect-location"] = value
      end
      if value = input.sse_customer_algorithm
        headers["x-amz-server-side-encryption-customer-algorithm"] = value
      end
      if value = input.sse_customer_key
        headers["x-amz-server-side-encryption-customer-key"] = value
      end
      if value = input.sse_customer_key_md5
        headers["x-amz-server-side-encryption-customer-key-MD5"] = value
      end
      if value = input.ssekms_key_id
        headers["x-amz-server-side-encryption-aws-kms-key-id"] = value
      end
      if value = input.ssekms_encryption_context
        headers["x-amz-server-side-encryption-context"] = value
      end
      if value = input.bucket_key_enabled.try(&.to_s)
        headers["x-amz-server-side-encryption-bucket-key-enabled"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.tagging
        headers["x-amz-tagging"] = value
      end
      if value = input.object_lock_mode.try(&.to_json_object_key)
        headers["x-amz-object-lock-mode"] = value
      end
      if value = input.object_lock_retain_until_date.try { |time| Core::HeaderValue.format_date_time(time) }
        headers["x-amz-object-lock-retain-until-date"] = value
      end
      if value = input.object_lock_legal_hold_status.try(&.to_json_object_key)
        headers["x-amz-object-lock-legal-hold"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      (input.metadata || {} of String => String).each do |key, value|
        headers["x-amz-meta-#{key}"] = value
      end
      response = rest_request("PutObject", "PUT", path, headers, input.body, "application/xml")
      result = AS::PutObjectOutput.new(
        expiration: response.headers["x-amz-expiration"]?,
        e_tag: response.headers["ETag"]?,
        checksum_crc32: response.headers["x-amz-checksum-crc32"]?,
        checksum_crc32c: response.headers["x-amz-checksum-crc32c"]?,
        checksum_crc64nvme: response.headers["x-amz-checksum-crc64nvme"]?,
        checksum_sha1: response.headers["x-amz-checksum-sha1"]?,
        checksum_sha256: response.headers["x-amz-checksum-sha256"]?,
        checksum_sha512: response.headers["x-amz-checksum-sha512"]?,
        checksum_md5: response.headers["x-amz-checksum-md5"]?,
        checksum_xxhash64: response.headers["x-amz-checksum-xxhash64"]?,
        checksum_xxhash3: response.headers["x-amz-checksum-xxhash3"]?,
        checksum_xxhash128: response.headers["x-amz-checksum-xxhash128"]?,
        checksum_type: response.headers["x-amz-checksum-type"]?.try { |value| AS::ChecksumType.from_json_object_key?(value) },
        server_side_encryption: response.headers["x-amz-server-side-encryption"]?.try { |value| AS::ServerSideEncryption.from_json_object_key?(value) },
        version_id: response.headers["x-amz-version-id"]?,
        sse_customer_algorithm: response.headers["x-amz-server-side-encryption-customer-algorithm"]?,
        sse_customer_key_md5: response.headers["x-amz-server-side-encryption-customer-key-MD5"]?,
        ssekms_key_id: response.headers["x-amz-server-side-encryption-aws-kms-key-id"]?,
        ssekms_encryption_context: response.headers["x-amz-server-side-encryption-context"]?,
        bucket_key_enabled: Core::HeaderValue.bool(response.headers["x-amz-server-side-encryption-bucket-key-enabled"]?),
        size: Core::HeaderValue.i64(response.headers["x-amz-object-size"]?),
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
      )
      Core::ParsedResponse(AS::PutObjectOutput).new(response, result)
    end

    # End of support notice: As of October 1, 2025, Amazon S3 has discontinued support for Email
    # Grantee Access Control Lists (ACLs). If you attempt to use an Email Grantee ACL in a request
    # after October 1, 2025, the request will receive an `HTTP 405` (Method Not Allowed) error.
    #
    # This change affects the following Amazon Web Services Regions: US East (N. Virginia), US West
    # (N. California), US West (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific
    # (Tokyo), Europe (Ireland), and South America (São Paulo).
    #
    # This operation is not supported for directory buckets.
    #
    # Uses the `acl` subresource to set the access control list (ACL) permissions for a new or
    # existing object in an S3 bucket. You must have the `WRITE_ACP` permission to set the ACL of an
    # object. For more information, see [What permissions can I
    # grant?](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#permissions) in the
    # *Amazon S3 User Guide*.
    #
    # This functionality is not supported for Amazon S3 on Outposts.
    #
    # Depending on your application needs, you can choose to set the ACL on an object using either the
    # request body or the headers. For example, if you have an existing application that updates a
    # bucket ACL using the request body, you can continue to use that approach. For more information,
    # see [Access Control List (ACL)
    # Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html) in the *Amazon S3
    # User Guide*.
    #
    # If your bucket uses the bucket owner enforced setting for S3 Object Ownership, ACLs are disabled
    # and no longer affect permissions. You must use policies to grant access to your bucket and the
    # objects in it. Requests to set ACLs or update ACLs fail and return the
    # `AccessControlListNotSupported` error code. Requests to read ACLs are still supported. For more
    # information, see [Controlling object
    # ownership](https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html) in
    # the *Amazon S3 User Guide*.
    #
    # Permissions You can set access permissions using one of the following methods:
    #
    # - Specify a canned ACL with the `x-amz-acl` request header. Amazon S3 supports a set of
    # predefined ACLs, known as canned ACLs. Each canned ACL has a predefined set of grantees and
    # permissions. Specify the canned ACL name as the value of `x-amz-ac`l. If you use this header,
    # you cannot use other access control-specific headers in your request. For more information, see
    # [Canned ACL](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL).
    #
    # - Specify access permissions explicitly with the `x-amz-grant-read`, `x-amz-grant-read-acp`,
    # `x-amz-grant-write-acp`, and `x-amz-grant-full-control` headers. When using these headers, you
    # specify explicit access permissions and grantees (Amazon Web Services accounts or Amazon S3
    # groups) who will receive the permission. If you use these ACL-specific headers, you cannot use
    # `x-amz-acl` header to set a canned ACL. These parameters map to the set of permissions that
    # Amazon S3 supports in an ACL. For more information, see [Access Control List (ACL)
    # Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html).
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
    # For example, the following `x-amz-grant-read` header grants list objects permission to the two
    # Amazon Web Services accounts identified by their email addresses.
    #
    # `x-amz-grant-read: emailAddress="xyz@amazon.com", emailAddress="abc@amazon.com" `
    #
    # You can use either a canned ACL or specify access permissions explicitly. You cannot do both.
    #
    # Grantee Values You can specify the person (grantee) to whom you're assigning access rights
    # (using request elements) in the following ways. For examples of how to specify these grantee
    # values in JSON format, see the Amazon Web Services CLI example in [ Enabling Amazon S3 server
    # access
    # logging](https://docs.aws.amazon.com/AmazonS3/latest/userguide/enable-server-access-logging.html)
    # in the *Amazon S3 User Guide*.
    #
    # - By the person's ID:
    #
    # `<>ID<><>GranteesEmail<> `
    #
    # DisplayName is optional and ignored in the request.
    #
    # - By URI:
    #
    # `<>http://acs.amazonaws.com/groups/global/AuthenticatedUsers<>`
    #
    # - By Email address:
    #
    # `<>Grantees@email.com<>lt;/Grantee>`
    #
    # The grantee is resolved to the CanonicalUser and, in a response to a GET Object acl request,
    # appears as the CanonicalUser.
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
    # Versioning The ACL of an object is set at the object version level. By default, PUT sets the ACL
    # of the current version of an object. To set the ACL of a different version, use the `versionId`
    # subresource.
    #
    # The following operations are related to `PutObjectAcl`:
    #
    # - [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html)
    #
    # - [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_object_acl(input : AS::PutObjectAclRequest) : Core::ParsedResponse(AS::PutObjectAclOutput)
      Log.info { "performing 'PutObjectAcl' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("acl", "")
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.acl.try(&.to_json_object_key)
        headers["x-amz-acl"] = value
      end
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.grant_full_control
        headers["x-amz-grant-full-control"] = value
      end
      if value = input.grant_read
        headers["x-amz-grant-read"] = value
      end
      if value = input.grant_read_acp
        headers["x-amz-grant-read-acp"] = value
      end
      if value = input.grant_write
        headers["x-amz-grant-write"] = value
      end
      if value = input.grant_write_acp
        headers["x-amz-grant-write-acp"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutObjectAcl", "PUT", path, headers, input.access_control_policy.try(&.to_xml("AccessControlPolicy")), "application/xml")
      result = AS::PutObjectAclOutput.new(
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
      )
      Core::ParsedResponse(AS::PutObjectAclOutput).new(response, result)
    end

    # Attaches an annotation to an Amazon S3 object. An annotation is a named payload of 1 byte to 1
    # MiB that you can associate with a specific object or object version. Each object can have up to
    # 1,000 annotations.
    #
    # For annotation naming rules and restrictions, see [Annotation naming
    # guidelines](https://docs.aws.amazon.com/AmazonS3/latest/userguide/annotations-overview.html) in
    # the *Amazon S3 User Guide*.
    #
    # Annotations inherit the encryption of their parent object. For objects without server-side
    # encryption, annotations are encrypted with SSE-S3 (the default for new objects). Objects
    # encrypted with SSE-C cannot have annotations.
    #
    # To use this operation, you must have the `s3:PutObjectAnnotation` permission. If the bucket has
    # Requester Pays enabled, you must include the `x-amz-request-payer` header.
    #
    # Annotations are not supported by the following features: S3 Inventory Reports, API Gateway, S3
    # Storage Lens, Amazon S3 File Gateway, Amazon FSx, S3 on Outposts, and S3 Express One Zone
    # (directory buckets).
    #
    # The following operations are related to `PutObjectAnnotation`:
    #
    # -
    # [GetObjectAnnotation](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAnnotation.html)
    #
    # -
    # [ListObjectAnnotations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectAnnotations.html)
    #
    # -
    # [DeleteObjectAnnotation](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObjectAnnotation.html)
    def put_object_annotation(input : AS::PutObjectAnnotationRequest) : Core::ParsedResponse(AS::PutObjectAnnotationOutput)
      Log.info { "performing 'PutObjectAnnotation' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("annotation", "")
        if value = input.version_id
          form.add("versionId", value)
        end
        if value = input.annotation_name
          form.add("annotationName", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.object_if_match
        headers["x-amz-object-if-match"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.checksum_crc32
        headers["x-amz-checksum-crc32"] = value
      end
      if value = input.checksum_crc32c
        headers["x-amz-checksum-crc32c"] = value
      end
      if value = input.checksum_crc64nvme
        headers["x-amz-checksum-crc64nvme"] = value
      end
      if value = input.checksum_sha1
        headers["x-amz-checksum-sha1"] = value
      end
      if value = input.checksum_sha256
        headers["x-amz-checksum-sha256"] = value
      end
      if value = input.checksum_sha512
        headers["x-amz-checksum-sha512"] = value
      end
      if value = input.checksum_md5
        headers["x-amz-checksum-md5"] = value
      end
      if value = input.checksum_xxhash64
        headers["x-amz-checksum-xxhash64"] = value
      end
      if value = input.checksum_xxhash3
        headers["x-amz-checksum-xxhash3"] = value
      end
      if value = input.checksum_xxhash128
        headers["x-amz-checksum-xxhash128"] = value
      end
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutObjectAnnotation", "PUT", path, headers, input.annotation_payload, "application/xml")
      result = AS::PutObjectAnnotationOutput.from_xml(XML.parse(response.body).root.not_nil!)
      result.object_version_id = response.headers["x-amz-object-version-id"]?
      result.e_tag = response.headers["ETag"]?
      result.checksum_crc32 = response.headers["x-amz-checksum-crc32"]?
      result.checksum_crc32c = response.headers["x-amz-checksum-crc32c"]?
      result.checksum_crc64nvme = response.headers["x-amz-checksum-crc64nvme"]?
      result.checksum_sha1 = response.headers["x-amz-checksum-sha1"]?
      result.checksum_sha256 = response.headers["x-amz-checksum-sha256"]?
      result.checksum_sha512 = response.headers["x-amz-checksum-sha512"]?
      result.checksum_md5 = response.headers["x-amz-checksum-md5"]?
      result.checksum_xxhash64 = response.headers["x-amz-checksum-xxhash64"]?
      result.checksum_xxhash3 = response.headers["x-amz-checksum-xxhash3"]?
      result.checksum_xxhash128 = response.headers["x-amz-checksum-xxhash128"]?
      result.checksum_type = response.headers["x-amz-checksum-type"]?.try { |value| AS::ChecksumType.from_json_object_key?(value) }
      result.server_side_encryption = response.headers["x-amz-server-side-encryption"]?.try { |value| AS::ServerSideEncryption.from_json_object_key?(value) }
      result.request_charged = response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) }
      Core::ParsedResponse(AS::PutObjectAnnotationOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Applies a legal hold configuration to the specified object. For more information, see [Locking
    # Objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html).
    #
    # This functionality is not supported for Amazon S3 on Outposts.
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_object_legal_hold(input : AS::PutObjectLegalHoldRequest) : Core::ParsedResponse(AS::PutObjectLegalHoldOutput)
      Log.info { "performing 'PutObjectLegalHold' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("legal-hold", "")
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutObjectLegalHold", "PUT", path, headers, input.legal_hold.try(&.to_xml("LegalHold")), "application/xml")
      result = AS::PutObjectLegalHoldOutput.new(
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
      )
      Core::ParsedResponse(AS::PutObjectLegalHoldOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Places an Object Lock configuration on the specified bucket. The rule specified in the Object
    # Lock configuration will be applied by default to every new object placed in the specified
    # bucket. For more information, see [Locking
    # Objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html).
    #
    # - The `DefaultRetention` settings require both a mode and a period.
    #
    # - The `DefaultRetention` period can be either `Days` or `Years` but you must select one. You
    # cannot specify `Days` and `Years` at the same time.
    #
    # - You can enable Object Lock for new or existing buckets. For more information, see [Configuring
    # Object Lock](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock-configure.html).
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_object_lock_configuration(input : AS::PutObjectLockConfigurationRequest) : Core::ParsedResponse(AS::PutObjectLockConfigurationOutput)
      Log.info { "performing 'PutObjectLockConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("object-lock", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.token
        headers["x-amz-bucket-object-lock-token"] = value
      end
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutObjectLockConfiguration", "PUT", path, headers, input.object_lock_configuration.try(&.to_xml("ObjectLockConfiguration")), "application/xml")
      result = AS::PutObjectLockConfigurationOutput.new(
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
      )
      Core::ParsedResponse(AS::PutObjectLockConfigurationOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Places an Object Retention configuration on an object. For more information, see [Locking
    # Objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html). Users or accounts
    # require the `s3:PutObjectRetention` permission in order to place an Object Retention
    # configuration on objects. Bypassing a Governance Retention configuration requires the
    # `s3:BypassGovernanceRetention` permission.
    #
    # This functionality is not supported for Amazon S3 on Outposts.
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_object_retention(input : AS::PutObjectRetentionRequest) : Core::ParsedResponse(AS::PutObjectRetentionOutput)
      Log.info { "performing 'PutObjectRetention' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("retention", "")
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.bypass_governance_retention.try(&.to_s)
        headers["x-amz-bypass-governance-retention"] = value
      end
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutObjectRetention", "PUT", path, headers, input.retention.try(&.to_xml("Retention")), "application/xml")
      result = AS::PutObjectRetentionOutput.new(
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
      )
      Core::ParsedResponse(AS::PutObjectRetentionOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Sets the supplied tag-set to an object that already exists in a bucket. A tag is a key-value
    # pair. For more information, see [Object
    # Tagging](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-tagging.html).
    #
    # You can associate tags with an object by sending a PUT request against the tagging subresource
    # that is associated with the object. You can retrieve tags by sending a GET request. For more
    # information, see
    # [GetObjectTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html).
    #
    # For tagging-related restrictions related to characters and encodings, see [Tag
    # Restrictions](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html).
    # Note that Amazon S3 limits the maximum number of tags to 10 tags per object.
    #
    # To use this operation, you must have permission to perform the `s3:PutObjectTagging` action. By
    # default, the bucket owner has this permission and can grant this permission to others.
    #
    # To put tags of any other version, use the `versionId` query parameter. You also need permission
    # for the `s3:PutObjectVersionTagging` action.
    #
    # `PutObjectTagging` has the following special errors. For more Amazon S3 errors see, [Error
    # Responses](https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html).
    #
    # - `InvalidTag` - The tag provided was not a valid tag. This error can occur if the tag did not
    # pass input validation. For more information, see [Object
    # Tagging](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-tagging.html).
    #
    # - `MalformedXML` - The XML provided does not match the schema.
    #
    # - `OperationAborted` - A conflicting conditional action is currently in progress against this
    # resource. Please try again.
    #
    # - `InternalError` - The service was unable to apply the provided tag to the object.
    #
    # The following operations are related to `PutObjectTagging`:
    #
    # - [GetObjectTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html)
    #
    # -
    # [DeleteObjectTagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObjectTagging.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_object_tagging(input : AS::PutObjectTaggingRequest) : Core::ParsedResponse(AS::PutObjectTaggingOutput)
      Log.info { "performing 'PutObjectTagging' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("tagging", "")
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      response = rest_request("PutObjectTagging", "PUT", path, headers, input.tagging.try(&.to_xml("Tagging")), "application/xml")
      result = AS::PutObjectTaggingOutput.new(
        version_id: response.headers["x-amz-version-id"]?,
      )
      Core::ParsedResponse(AS::PutObjectTaggingOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Creates or modifies the `PublicAccessBlock` configuration for an Amazon S3 bucket. To use this
    # operation, you must have the `s3:PutBucketPublicAccessBlock` permission. For more information
    # about Amazon S3 permissions, see [Specifying Permissions in a
    # Policy](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-with-s3-actions.html).
    #
    # When Amazon S3 evaluates the `PublicAccessBlock` configuration for a bucket or an object, it
    # checks the `PublicAccessBlock` configuration for both the bucket (or the bucket that contains
    # the object) and the bucket owner's account. Account-level settings automatically inherit from
    # organization-level policies when present. If the `PublicAccessBlock` configurations are
    # different between the bucket and the account, Amazon S3 uses the most restrictive combination of
    # the bucket-level and account-level settings.
    #
    # For more information about when Amazon S3 considers a bucket or an object public, see [The
    # Meaning of
    # "Public"](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status).
    #
    # The following operations are related to `PutPublicAccessBlock`:
    #
    # -
    # [GetPublicAccessBlock](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetPublicAccessBlock.html)
    #
    # -
    # [DeletePublicAccessBlock](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeletePublicAccessBlock.html)
    #
    # -
    # [GetBucketPolicyStatus](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketPolicyStatus.html)
    #
    # - [Using Amazon S3 Block Public
    # Access](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def put_public_access_block(input : AS::PutPublicAccessBlockRequest) : Core::Response
      Log.info { "performing 'PutPublicAccessBlock' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("publicAccessBlock", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("PutPublicAccessBlock", "PUT", path, headers, input.public_access_block_configuration.try(&.to_xml("PublicAccessBlockConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # Renames an existing object in a directory bucket that uses the S3 Express One Zone storage
    # class. You can use `RenameObject` by specifying an existing object’s name as the source and the
    # new name of the object as the destination within the same directory bucket.
    #
    # `RenameObject` is only supported for objects stored in the S3 Express One Zone storage class.
    #
    # To prevent overwriting an object, you can use the `If-None-Match` conditional header.
    #
    # - **If-None-Match** - Renames the object only if an object with the specified name does not
    # already exist in the directory bucket. If you don't want to overwrite an existing object, you
    # can add the `If-None-Match` conditional header with the value `‘*’` in the `RenameObject`
    # request. Amazon S3 then returns a `412 Precondition Failed` error if the object with the
    # specified name already exists. For more information, see [RFC
    # 7232](https://datatracker.ietf.org/doc/rfc7232/).
    #
    # Permissions To grant access to the `RenameObject` operation on a directory bucket, we recommend
    # that you use the `CreateSession` operation for session-based authorization. Specifically, you
    # grant the `s3express:CreateSession` permission to the directory bucket in a bucket policy or an
    # IAM identity-based policy. Then, you make the `CreateSession` API call on the directory bucket
    # to obtain a session token. With the session token in your request header, you can make API
    # requests to this operation. After the session token expires, you make another `CreateSession`
    # API call to generate a new session token for use. The Amazon Web Services CLI and SDKs will
    # create and manage your session including refreshing the session token automatically to avoid
    # service interruptions when a session expires. In your bucket policy, you can specify the
    # `s3express:SessionMode` condition key to control who can create a `ReadWrite` or `ReadOnly`
    # session. A `ReadWrite` session is required for executing all the Zonal endpoint API operations,
    # including `RenameObject`. For more information about authorization, see [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html). To learn more about
    # Zonal endpoint API operations, see [Authorizing Zonal endpoint API operations with
    # CreateSession](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-create-session.html)
    # in the *Amazon S3 User Guide*.
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def rename_object(input : AS::RenameObjectRequest) : Core::ParsedResponse(AS::RenameObjectOutput)
      Log.info { "performing 'RenameObject' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("renameObject", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.rename_source
        headers["x-amz-rename-source"] = value
      end
      if value = input.destination_if_match
        headers["If-Match"] = value
      end
      if value = input.destination_if_none_match
        headers["If-None-Match"] = value
      end
      if value = input.destination_if_modified_since.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["If-Modified-Since"] = value
      end
      if value = input.destination_if_unmodified_since.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["If-Unmodified-Since"] = value
      end
      if value = input.source_if_match
        headers["x-amz-rename-source-if-match"] = value
      end
      if value = input.source_if_none_match
        headers["x-amz-rename-source-if-none-match"] = value
      end
      if value = input.source_if_modified_since.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["x-amz-rename-source-if-modified-since"] = value
      end
      if value = input.source_if_unmodified_since.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["x-amz-rename-source-if-unmodified-since"] = value
      end
      if value = input.client_token
        headers["x-amz-client-token"] = value
      end
      response = rest_request("RenameObject", "PUT", path, headers, nil, "application/xml")
      result = AS::RenameObjectOutput.new
      Core::ParsedResponse(AS::RenameObjectOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Restores an archived copy of an object back into Amazon S3
    #
    # This functionality is not supported for Amazon S3 on Outposts.
    #
    # This action performs the following types of requests:
    #
    # - `restore an archive` - Restore an archived object
    #
    # For more information about the `S3` structure in the request body, see the following:
    #
    # - [PutObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)
    #
    # - [Managing Access with
    # ACLs](https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html) in the *Amazon S3
    # User Guide*
    #
    # - [Protecting Data Using Server-Side
    # Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html) in the
    # *Amazon S3 User Guide*
    #
    # Permissions To use this operation, you must have permissions to perform the `s3:RestoreObject`
    # action. The bucket owner has this permission by default and can grant this permission to others.
    # For more information about permissions, see [Permissions Related to Bucket Subresource
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-with-s3-actions.html#using-with-s3-actions-related-to-bucket-subresources)
    # and [Managing Access Permissions to Your Amazon S3
    # Resources](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html) in the
    # *Amazon S3 User Guide*.
    #
    # Restoring objects Objects that you archive to the S3 Glacier Flexible Retrieval or S3 Glacier
    # Deep Archive storage class, and S3 Intelligent-Tiering Archive or S3 Intelligent-Tiering Deep
    # Archive tiers, are not accessible in real time. For objects in the S3 Glacier Flexible Retrieval
    # or S3 Glacier Deep Archive storage classes, you must first initiate a restore request, and then
    # wait until a temporary copy of the object is available. If you want a permanent copy of the
    # object, create a copy of it in the Amazon S3 Standard storage class in your S3 bucket. To access
    # an archived object, you must restore the object for the duration (number of days) that you
    # specify. For objects in the Archive Access or Deep Archive Access tiers of S3
    # Intelligent-Tiering, you must first initiate a restore request, and then wait until the object
    # is moved into the Frequent Access tier.
    #
    # To restore a specific object version, you can provide a version ID. If you don't provide a
    # version ID, Amazon S3 restores the current version.
    #
    # When restoring an archived object, you can specify one of the following data access tier options
    # in the `Tier` element of the request body:
    #
    # - `Expedited` - Expedited retrievals allow you to quickly access your data stored in the S3
    # Glacier Flexible Retrieval storage class or S3 Intelligent-Tiering Archive tier when occasional
    # urgent requests for restoring archives are required. For all but the largest archived objects
    # (250 MB+), data accessed using Expedited retrievals is typically made available within 1–5
    # minutes. Provisioned capacity ensures that retrieval capacity for Expedited retrievals is
    # available when you need it. Expedited retrievals and provisioned capacity are not available for
    # objects stored in the S3 Glacier Deep Archive storage class or S3 Intelligent-Tiering Deep
    # Archive tier.
    #
    # - `Standard` - Standard retrievals allow you to access any of your archived objects within
    # several hours. This is the default option for retrieval requests that do not specify the
    # retrieval option. Standard retrievals typically finish within 3–5 hours for objects stored in
    # the S3 Glacier Flexible Retrieval storage class or S3 Intelligent-Tiering Archive tier. They
    # typically finish within 12 hours for objects stored in the S3 Glacier Deep Archive storage class
    # or S3 Intelligent-Tiering Deep Archive tier. Standard retrievals are free for objects stored in
    # S3 Intelligent-Tiering.
    #
    # - `Bulk` - Bulk retrievals free for objects stored in the S3 Glacier Flexible Retrieval and S3
    # Intelligent-Tiering storage classes, enabling you to retrieve large amounts, even petabytes, of
    # data at no cost. Bulk retrievals typically finish within 5–12 hours for objects stored in the S3
    # Glacier Flexible Retrieval storage class or S3 Intelligent-Tiering Archive tier. Bulk retrievals
    # are also the lowest-cost retrieval option when restoring objects from S3 Glacier Deep Archive.
    # They typically finish within 48 hours for objects stored in the S3 Glacier Deep Archive storage
    # class or S3 Intelligent-Tiering Deep Archive tier.
    #
    # For more information about archive retrieval options and provisioned capacity for `Expedited`
    # data access, see [Restoring Archived
    # Objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/restoring-objects.html) in the *Amazon
    # S3 User Guide*.
    #
    # You can use Amazon S3 restore speed upgrade to change the restore speed to a faster speed while
    # it is in progress. For more information, see [ Upgrading the speed of an in-progress
    # restore](https://docs.aws.amazon.com/AmazonS3/latest/dev/restoring-objects.html#restoring-objects-upgrade-tier.title.html)
    # in the *Amazon S3 User Guide*.
    #
    # To get the status of object restoration, you can send a `HEAD` request. Operations return the
    # `x-amz-restore` header, which provides information about the restoration status, in the
    # response. You can use Amazon S3 event notifications to notify you when a restore is initiated or
    # completed. For more information, see [Configuring Amazon S3 Event
    # Notifications](https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html) in the
    # *Amazon S3 User Guide*.
    #
    # After restoring an archived object, you can update the restoration period by reissuing the
    # request with a new period. Amazon S3 updates the restoration period relative to the current time
    # and charges only for the request-there are no data transfer charges. You cannot update the
    # restoration period when Amazon S3 is actively processing your current restore request for the
    # object.
    #
    # If your bucket has a lifecycle configuration with a rule that includes an expiration action, the
    # object expiration overrides the life span that you specify in a restore request. For example, if
    # you restore an object copy for 10 days, but the object is scheduled to expire in 3 days, Amazon
    # S3 deletes the object in 3 days. For more information about lifecycle configuration, see
    # [PutBucketLifecycleConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html)
    # and [Object Lifecycle
    # Management](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html) in
    # *Amazon S3 User Guide*.
    #
    # Responses A successful action returns either the `200 OK` or `202 Accepted` status code.
    #
    # - If the object is not previously restored, then Amazon S3 returns `202 Accepted` in the
    # response.
    #
    # - If the object is previously restored, Amazon S3 returns `200 OK` in the response.
    #
    # - Special errors:
    #
    # - *Code: RestoreAlreadyInProgress*
    #
    # - *Cause: Object restore is already in progress.*
    #
    # - *HTTP Status Code: 409 Conflict*
    #
    # - *SOAP Fault Code Prefix: Client*
    #
    # -
    #
    # - *Code: GlacierExpeditedRetrievalNotAvailable*
    #
    # - *Cause: expedited retrievals are currently not available. Try again later. (Returned if there
    # is insufficient capacity to process the Expedited request. This error applies only to Expedited
    # retrievals and not to S3 Standard or Bulk retrievals.)*
    #
    # - *HTTP Status Code: 503*
    #
    # - *SOAP Fault Code Prefix: N/A*
    #
    # The following operations are related to `RestoreObject`:
    #
    # -
    # [PutBucketLifecycleConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html)
    #
    # -
    # [GetBucketNotificationConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketNotificationConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def restore_object(input : AS::RestoreObjectRequest) : Core::ParsedResponse(AS::RestoreObjectOutput)
      Log.info { "performing 'RestoreObject' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("restore", "")
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("RestoreObject", "POST", path, headers, input.restore_request.try(&.to_xml("RestoreRequest")), "application/xml")
      result = AS::RestoreObjectOutput.new(
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
        restore_output_path: response.headers["x-amz-restore-output-path"]?,
      )
      Core::ParsedResponse(AS::RestoreObjectOutput).new(response, result)
    end

    # Updates the annotation table configuration for an Amazon S3 bucket's metadata configuration. Use
    # this operation to enable or disable the annotation table, or to update its associated IAM role.
    #
    # An annotation table is a queryable Iceberg table that contains records of all annotations
    # attached to objects in the bucket. To use this operation, the bucket must have an existing
    # Amazon S3 Metadata configuration.
    #
    # To use this operation, you must have the `s3:UpdateBucketMetadataAnnotationTableConfiguration`
    # permission. If you are specifying or changing the IAM role, you must also have `iam:PassRole`
    # permission for the role.
    #
    # The IAM role must have a trust policy that allows the Amazon S3 metadata service to assume it,
    # and a permissions policy that grants the actions needed to read annotations from your bucket.
    # The following examples show a trust policy and a permissions policy that you can adapt for your
    # bucket and account.
    #
    # The following operations are related to `UpdateBucketMetadataAnnotationTableConfiguration`:
    #
    # -
    # [CreateBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html)
    #
    # -
    # [GetBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetadataConfiguration.html)
    def update_bucket_metadata_annotation_table_configuration(input : AS::UpdateBucketMetadataAnnotationTableConfigurationRequest) : Core::Response
      Log.info { "performing 'UpdateBucketMetadataAnnotationTableConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("metadataAnnotationTable", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("UpdateBucketMetadataAnnotationTableConfiguration", "PUT", path, headers, input.annotation_table_configuration.try(&.to_xml("AnnotationTableConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # Enables or disables a live inventory table for an S3 Metadata configuration on a general purpose
    # bucket. For more information, see [Accelerating data discovery with S3
    # Metadata](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-overview.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions To use this operation, you must have the following permissions. For more
    # information, see [Setting up permissions for configuring metadata
    # tables](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-permissions.html)
    # in the *Amazon S3 User Guide*.
    #
    # If you want to encrypt your inventory table with server-side encryption with Key Management
    # Service (KMS) keys (SSE-KMS), you need additional permissions in your KMS key policy. For more
    # information, see [ Setting up permissions for configuring metadata
    # tables](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-permissions.html)
    # in the *Amazon S3 User Guide*.
    #
    # - `s3:UpdateBucketMetadataInventoryTableConfiguration`
    #
    # - `s3tables:CreateTableBucket`
    #
    # - `s3tables:CreateNamespace`
    #
    # - `s3tables:GetTable`
    #
    # - `s3tables:CreateTable`
    #
    # - `s3tables:PutTablePolicy`
    #
    # - `s3tables:PutTableEncryption`
    #
    # - `kms:DescribeKey`
    #
    # The following operations are related to `UpdateBucketMetadataInventoryTableConfiguration`:
    #
    # -
    # [CreateBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html)
    #
    # -
    # [DeleteBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetadataConfiguration.html)
    #
    # -
    # [GetBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetadataConfiguration.html)
    #
    # -
    # [UpdateBucketMetadataJournalTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UpdateBucketMetadataJournalTableConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def update_bucket_metadata_inventory_table_configuration(input : AS::UpdateBucketMetadataInventoryTableConfigurationRequest) : Core::Response
      Log.info { "performing 'UpdateBucketMetadataInventoryTableConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("metadataInventoryTable", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("UpdateBucketMetadataInventoryTableConfiguration", "PUT", path, headers, input.inventory_table_configuration.try(&.to_xml("InventoryTableConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # Enables or disables journal table record expiration for an S3 Metadata configuration on a
    # general purpose bucket. For more information, see [Accelerating data discovery with S3
    # Metadata](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-overview.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions To use this operation, you must have the
    # `s3:UpdateBucketMetadataJournalTableConfiguration` permission. For more information, see
    # [Setting up permissions for configuring metadata
    # tables](https://docs.aws.amazon.com/AmazonS3/latest/userguide/metadata-tables-permissions.html)
    # in the *Amazon S3 User Guide*.
    #
    # The following operations are related to `UpdateBucketMetadataJournalTableConfiguration`:
    #
    # -
    # [CreateBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html)
    #
    # -
    # [DeleteBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketMetadataConfiguration.html)
    #
    # -
    # [GetBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketMetadataConfiguration.html)
    #
    # -
    # [UpdateBucketMetadataInventoryTableConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UpdateBucketMetadataInventoryTableConfiguration.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def update_bucket_metadata_journal_table_configuration(input : AS::UpdateBucketMetadataJournalTableConfigurationRequest) : Core::Response
      Log.info { "performing 'UpdateBucketMetadataJournalTableConfiguration' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}"
      query = URI::Params.build do |form|
        form.add("metadataJournalTable", "")
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("UpdateBucketMetadataJournalTableConfiguration", "PUT", path, headers, input.journal_table_configuration.try(&.to_xml("JournalTableConfiguration")), "application/xml")
      Core::Response.new(response)
    end

    # This operation is not supported for directory buckets or Amazon S3 on Outposts buckets.
    #
    # Updates the server-side encryption type of an existing encrypted object in a general purpose
    # bucket. You can use the `UpdateObjectEncryption` operation to change encrypted objects from
    # server-side encryption with Amazon S3 managed keys (SSE-S3) to server-side encryption with Key
    # Management Service (KMS) keys (SSE-KMS), or to apply S3 Bucket Keys. You can also use the
    # `UpdateObjectEncryption` operation to change the customer-managed KMS key used to encrypt your
    # data so that you can comply with custom key-rotation standards.
    #
    # Using the `UpdateObjectEncryption` operation, you can atomically update the server-side
    # encryption type of an existing object in a general purpose bucket without any data movement. The
    # `UpdateObjectEncryption` operation uses envelope encryption to re-encrypt the data key used to
    # encrypt and decrypt your object with your newly specified server-side encryption type. In other
    # words, when you use the `UpdateObjectEncryption` operation, your data isn't copied, archived
    # objects in the S3 Glacier Flexible Retrieval and S3 Glacier Deep Archive storage classes aren't
    # restored, and objects in the S3 Intelligent-Tiering storage class aren't moved between tiers.
    # Additionally, the `UpdateObjectEncryption` operation preserves all object metadata properties,
    # including the storage class, creation date, last modified date, ETag, and checksum properties.
    # For more information, see [ Updating server-side encryption for existing
    # objects](https://docs.aws.amazon.com/AmazonS3/latest/userguide/update-sse-encryption.html) in
    # the *Amazon S3 User Guide*.
    #
    # By default, all `UpdateObjectEncryption` requests that specify a customer-managed KMS key are
    # restricted to KMS keys that are owned by the bucket owner's Amazon Web Services account. If
    # you're using Organizations, you can request the ability to use KMS keys owned by other member
    # accounts within your organization by contacting Amazon Web Services Support.
    #
    # Source objects that are unencrypted, or encrypted with either dual-layer server-side encryption
    # with KMS keys (DSSE-KMS) or server-side encryption with customer-provided keys (SSE-C) aren't
    # supported by this operation. Additionally, you cannot specify SSE-S3 encryption as the requested
    # new encryption type `UpdateObjectEncryption` request.
    #
    # Permissions
    #
    # - To use the `UpdateObjectEncryption` operation, you must have the following permissions:
    #
    # - `s3:UpdateObjectEncryption`
    #
    # - `kms:Encrypt`
    #
    # - `kms:Decrypt`
    #
    # - `kms:GenerateDataKey`
    #
    # - `kms:ReEncrypt*`
    #
    # - If you're using Organizations, to use this operation with customer-managed KMS keys from other
    # Amazon Web Services accounts within your organization, you must have the
    # `organizations:DescribeAccount` permission.
    #
    # Errors
    #
    # - You might receive an `InvalidRequest` error for several reasons. Depending on the reason for
    # the error, you might receive one of the following messages:
    #
    # - The `UpdateObjectEncryption` operation doesn't supported unencrypted source objects. Only
    # source objects encrypted with SSE-S3 or SSE-KMS are supported.
    #
    # - The `UpdateObjectEncryption` operation doesn't support source objects with the encryption type
    # DSSE-KMS or SSE-C. Only source objects encrypted with SSE-S3 or SSE-KMS are supported.
    #
    # - The `UpdateObjectEncryption` operation doesn't support updating the encryption type to
    # DSSE-KMS or SSE-C. Modify the request to specify SSE-KMS for the updated encryption type, and
    # then try again.
    #
    # - Requests that modify an object encryption configuration require Amazon Web Services Signature
    # Version 4. Modify the request to use Amazon Web Services Signature Version 4, and then try
    # again.
    #
    # - Requests that modify an object encryption configuration require a valid new encryption type.
    # Valid values are `SSEKMS`. Modify the request to specify SSE-KMS for the updated encryption
    # type, and then try again.
    #
    # - Requests that modify an object's encryption type to SSE-KMS require an Amazon Web Services KMS
    # key Amazon Resource Name (ARN). Modify the request to specify a KMS key ARN, and then try again.
    #
    # - Requests that modify an object's encryption type to SSE-KMS require a valid Amazon Web
    # Services KMS key Amazon Resource Name (ARN). Confirm that you have a correctly formatted KMS key
    # ARN in your request, and then try again.
    #
    # - The `BucketKeyEnabled` value isn't valid. Valid values are `true` or `false`. Modify the
    # request to specify a valid value, and then try again.
    #
    # - You might receive an `AccessDenied` error for several reasons. Depending on the reason for the
    # error, you might receive one of the following messages:
    #
    # - The Amazon Web Services KMS key in the request must be owned by the same account as the
    # bucket. Modify the request to specify a KMS key from the same account, and then try again.
    #
    # - The bucket owner's account was approved to make `UpdateObjectEncryption` requests that use any
    # Amazon Web Services KMS key in their organization, but the bucket owner's account isn't part of
    # an organization in Organizations. Make sure that the bucket owner's account and the specified
    # KMS key belong to the same organization, and then try again.
    #
    # - The specified Amazon Web Services KMS key must be from the same organization in Organizations
    # as the bucket. Specify a KMS key that belongs to the same organization as the bucket, and then
    # try again.
    #
    # - The encryption type for the specified object can’t be updated because that object is protected
    # by S3 Object Lock. If the object has a governance-mode retention period or a legal hold, you
    # must first remove the Object Lock status on the object before you issue your
    # `UpdateObjectEncryption` request. You can't use the `UpdateObjectEncryption` operation with
    # objects that have an Object Lock compliance mode retention period applied to them.
    def update_object_encryption(input : AS::UpdateObjectEncryptionRequest) : Core::ParsedResponse(AS::UpdateObjectEncryptionResponse)
      Log.info { "performing 'UpdateObjectEncryption' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("encryption", "")
        if value = input.version_id
          form.add("versionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      response = rest_request("UpdateObjectEncryption", "PUT", path, headers, input.object_encryption.try(&.to_xml("ObjectEncryption")), "application/xml")
      result = AS::UpdateObjectEncryptionResponse.new(
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
      )
      Core::ParsedResponse(AS::UpdateObjectEncryptionResponse).new(response, result)
    end

    # Uploads a part in a multipart upload.
    #
    # In this operation, you provide new data as a part of an object in your request. However, you
    # have an option to specify your existing Amazon S3 object as a data source for the part you are
    # uploading. To upload a part from an existing object, you use the
    # [UploadPartCopy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html)
    # operation.
    #
    # You must initiate a multipart upload (see
    # [CreateMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html))
    # before you can upload any part. In response to your initiate request, Amazon S3 returns an
    # upload ID, a unique identifier that you must include in your upload part request.
    #
    # Part numbers can be any number from 1 to 10,000, inclusive. A part number uniquely identifies a
    # part and also defines its position within the object being created. If you upload a new part
    # using the same part number that was used with a previous part, the previously uploaded part is
    # overwritten.
    #
    # For information about maximum and minimum part sizes and other multipart upload specifications,
    # see [Multipart upload limits](https://docs.aws.amazon.com/AmazonS3/latest/userguide/qfacts.html)
    # in the *Amazon S3 User Guide*.
    #
    # After you initiate multipart upload and upload one or more parts, you must either complete or
    # abort multipart upload in order to stop getting charged for storage of the uploaded parts. Only
    # after you either complete or abort multipart upload, Amazon S3 frees up the parts storage and
    # stops charging you for the parts storage.
    #
    # For more information on multipart uploads, go to [Multipart Upload
    # Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html) in the *Amazon S3
    # User Guide *.
    #
    # **Directory buckets** - For directory buckets, you must make requests for this API operation to
    # the Zonal endpoint. These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Permissions
    #
    # - **General purpose bucket permissions** - To perform a multipart upload with encryption using
    # an Key Management Service key, the requester must have permission to the `kms:Decrypt` and
    # `kms:GenerateDataKey` actions on the key. The requester must also have permissions for the
    # `kms:GenerateDataKey` action for the `CreateMultipartUpload` API. Then, the requester needs
    # permissions for the `kms:Decrypt` action on the `UploadPart` and `UploadPartCopy` APIs.
    #
    # These permissions are required because Amazon S3 must decrypt and read data from the encrypted
    # file parts before it completes the multipart upload. For more information about KMS permissions,
    # see [Protecting data using server-side encryption with
    # KMS](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingKMSEncryption.html) in the
    # *Amazon S3 User Guide*. For information about the permissions required to use the multipart
    # upload API, see [Multipart upload and
    # permissions](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html) and
    # [Multipart upload API and
    # permissions](https://docs.aws.amazon.com/AmazonS3/latest/userguide/mpuoverview.html#mpuAndPermissions)
    # in the *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - To grant access to this API operation on a directory
    # bucket, we recommend that you use the [ `CreateSession`
    # ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html) API operation for
    # session-based authorization. Specifically, you grant the `s3express:CreateSession` permission to
    # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
    # `CreateSession` API call on the bucket to obtain a session token. With the session token in your
    # request header, you can make API requests to this operation. After the session token expires,
    # you make another `CreateSession` API call to generate a new session token for use. Amazon Web
    # Services CLI or SDKs create session and refresh the session token automatically to avoid service
    # interruptions when a session expires. For more information about authorization, see [
    # `CreateSession` ](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateSession.html).
    #
    # If the object is encrypted with SSE-KMS, you must also have the `kms:GenerateDataKey` and
    # `kms:Decrypt` permissions in IAM identity-based policies and KMS key policies for the KMS key.
    #
    # Data integrity **General purpose bucket** - To ensure that data is not corrupted traversing the
    # network, specify the `Content-MD5` header in the upload part request. Amazon S3 checks the part
    # data against the provided MD5 value. If they do not match, Amazon S3 returns an error. If the
    # upload request is signed with Signature Version 4, then Amazon Web Services S3 uses the
    # `x-amz-content-sha256` header as a checksum instead of `Content-MD5`. For more information see
    # [Authenticating Requests: Using the Authorization Header (Amazon Web Services Signature Version
    # 4)](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-auth-using-authorization-header.html).
    #
    # **Directory buckets** - MD5 is not supported by directory buckets. You can use checksum
    # algorithms to check object integrity.
    #
    # Encryption
    #
    # - **General purpose bucket** - Server-side encryption is for data encryption at rest. Amazon S3
    # encrypts your data as it writes it to disks in its data centers and decrypts it when you access
    # it. You have mutually exclusive options to protect data using server-side encryption in Amazon
    # S3, depending on how you choose to manage the encryption keys. Specifically, the encryption key
    # options are Amazon S3 managed keys (SSE-S3), Amazon Web Services KMS keys (SSE-KMS), and
    # Customer-Provided Keys (SSE-C). Amazon S3 encrypts data with server-side encryption using Amazon
    # S3 managed keys (SSE-S3) by default. You can optionally tell Amazon S3 to encrypt data at rest
    # using server-side encryption with other key options. The option you use depends on whether you
    # want to use KMS keys (SSE-KMS) or provide your own encryption key (SSE-C).
    #
    # Server-side encryption is supported by the S3 Multipart Upload operations. Unless you are using
    # a customer-provided encryption key (SSE-C), you don't need to specify the encryption parameters
    # in each UploadPart request. Instead, you only need to specify the server-side encryption
    # parameters in the initial Initiate Multipart request. For more information, see
    # [CreateMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html).
    #
    # If you have server-side encryption with customer-provided keys (SSE-C) blocked for your general
    # purpose bucket, you will get an HTTP 403 Access Denied error when you specify the SSE-C request
    # headers while writing new data to your bucket. For more information, see [Blocking or unblocking
    # SSE-C for a general purpose
    # bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/blocking-unblocking-s3-c-encryption-gpb.html).
    #
    # If you request server-side encryption using a customer-provided encryption key (SSE-C) in your
    # initiate multipart upload request, you must provide identical encryption information in each
    # part upload using the following request headers.
    #
    # - x-amz-server-side-encryption-customer-algorithm
    #
    # - x-amz-server-side-encryption-customer-key
    #
    # - x-amz-server-side-encryption-customer-key-MD5
    #
    # For more information, see [Using Server-Side
    # Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html) in
    # the *Amazon S3 User Guide*.
    #
    # - **Directory buckets ** - For directory buckets, there are only two supported options for
    # server-side encryption: server-side encryption with Amazon S3 managed keys (SSE-S3) (`AES256`)
    # and server-side encryption with KMS keys (SSE-KMS) (`aws:kms`).
    #
    # Special errors
    #
    # - Error Code: `NoSuchUpload`
    #
    # - Description: The specified multipart upload does not exist. The upload ID might be invalid, or
    # the multipart upload might have been aborted or completed.
    #
    # - HTTP Status Code: 404 Not Found
    #
    # - SOAP Fault Code Prefix: Client
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `UploadPart`:
    #
    # -
    # [CreateMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html)
    #
    # -
    # [CompleteMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html)
    #
    # -
    # [AbortMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html)
    #
    # - [ListParts](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html)
    #
    # -
    # [ListMultipartUploads](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def upload_part(input : AS::UploadPartRequest) : Core::ParsedResponse(AS::UploadPartOutput)
      Log.info { "performing 'UploadPart' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("x-id", "UploadPart")
        if value = input.part_number.try(&.to_s)
          form.add("partNumber", value)
        end
        if value = input.upload_id
          form.add("uploadId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.content_length.try(&.to_s)
        headers["Content-Length"] = value
      end
      if value = input.content_md5
        headers["Content-MD5"] = value
      end
      if value = input.checksum_algorithm.try(&.to_json_object_key)
        headers["x-amz-sdk-checksum-algorithm"] = value
      end
      if value = input.checksum_crc32
        headers["x-amz-checksum-crc32"] = value
      end
      if value = input.checksum_crc32c
        headers["x-amz-checksum-crc32c"] = value
      end
      if value = input.checksum_crc64nvme
        headers["x-amz-checksum-crc64nvme"] = value
      end
      if value = input.checksum_sha1
        headers["x-amz-checksum-sha1"] = value
      end
      if value = input.checksum_sha256
        headers["x-amz-checksum-sha256"] = value
      end
      if value = input.checksum_sha512
        headers["x-amz-checksum-sha512"] = value
      end
      if value = input.checksum_md5
        headers["x-amz-checksum-md5"] = value
      end
      if value = input.checksum_xxhash64
        headers["x-amz-checksum-xxhash64"] = value
      end
      if value = input.checksum_xxhash3
        headers["x-amz-checksum-xxhash3"] = value
      end
      if value = input.checksum_xxhash128
        headers["x-amz-checksum-xxhash128"] = value
      end
      if value = input.sse_customer_algorithm
        headers["x-amz-server-side-encryption-customer-algorithm"] = value
      end
      if value = input.sse_customer_key
        headers["x-amz-server-side-encryption-customer-key"] = value
      end
      if value = input.sse_customer_key_md5
        headers["x-amz-server-side-encryption-customer-key-MD5"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      response = rest_request("UploadPart", "PUT", path, headers, input.body, "application/xml")
      result = AS::UploadPartOutput.new(
        server_side_encryption: response.headers["x-amz-server-side-encryption"]?.try { |value| AS::ServerSideEncryption.from_json_object_key?(value) },
        e_tag: response.headers["ETag"]?,
        checksum_crc32: response.headers["x-amz-checksum-crc32"]?,
        checksum_crc32c: response.headers["x-amz-checksum-crc32c"]?,
        checksum_crc64nvme: response.headers["x-amz-checksum-crc64nvme"]?,
        checksum_sha1: response.headers["x-amz-checksum-sha1"]?,
        checksum_sha256: response.headers["x-amz-checksum-sha256"]?,
        checksum_sha512: response.headers["x-amz-checksum-sha512"]?,
        checksum_md5: response.headers["x-amz-checksum-md5"]?,
        checksum_xxhash64: response.headers["x-amz-checksum-xxhash64"]?,
        checksum_xxhash3: response.headers["x-amz-checksum-xxhash3"]?,
        checksum_xxhash128: response.headers["x-amz-checksum-xxhash128"]?,
        sse_customer_algorithm: response.headers["x-amz-server-side-encryption-customer-algorithm"]?,
        sse_customer_key_md5: response.headers["x-amz-server-side-encryption-customer-key-MD5"]?,
        ssekms_key_id: response.headers["x-amz-server-side-encryption-aws-kms-key-id"]?,
        bucket_key_enabled: Core::HeaderValue.bool(response.headers["x-amz-server-side-encryption-bucket-key-enabled"]?),
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
      )
      Core::ParsedResponse(AS::UploadPartOutput).new(response, result)
    end

    # Uploads a part by copying data from an existing object as data source. To specify the data
    # source, you add the request header `x-amz-copy-source` in your request. To specify a byte range,
    # you add the request header `x-amz-copy-source-range` in your request.
    #
    # For information about maximum and minimum part sizes and other multipart upload specifications,
    # see [Multipart upload limits](https://docs.aws.amazon.com/AmazonS3/latest/userguide/qfacts.html)
    # in the *Amazon S3 User Guide*.
    #
    # Instead of copying data from an existing object as part data, you might use the
    # [UploadPart](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html) action to
    # upload new data as a part of an object in your request.
    #
    # You must initiate a multipart upload before you can upload any part. In response to your
    # initiate request, Amazon S3 returns the upload ID, a unique identifier that you must include in
    # your upload part request.
    #
    # For conceptual information about multipart uploads, see [Uploading Objects Using Multipart
    # Upload](https://docs.aws.amazon.com/AmazonS3/latest/dev/uploadobjusingmpu.html) in the *Amazon
    # S3 User Guide*. For information about copying objects using a single atomic action vs. a
    # multipart upload, see [Operations on
    # Objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectOperations.html) in the *Amazon
    # S3 User Guide*.
    #
    # **Directory buckets** - For directory buckets, you must make requests for this API operation to
    # the Zonal endpoint. These endpoints support virtual-hosted-style requests in the format
    # `https://*amzn-s3-demo-bucket*.s3express-*zone-id*.*region-code*.amazonaws.com/*key-name* `.
    # Path-style requests are not supported. For more information about endpoints in Availability
    # Zones, see [Regional and Zonal endpoints for directory buckets in Availability
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/endpoint-directory-buckets-AZ.html)
    # in the *Amazon S3 User Guide*. For more information about endpoints in Local Zones, see
    # [Concepts for directory buckets in Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-lzs-for-directory-buckets.html)
    # in the *Amazon S3 User Guide*.
    #
    # Authentication and authorization All `UploadPartCopy` requests must be authenticated and signed
    # by using IAM credentials (access key ID and secret access key for the IAM identities). All
    # headers with the `x-amz-` prefix, including `x-amz-copy-source`, must be signed. For more
    # information, see [REST
    # Authentication](https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html).
    #
    # **Directory buckets** - You must use IAM credentials to authenticate and authorize your access
    # to the `UploadPartCopy` API operation, instead of using the temporary security credentials
    # through the `CreateSession` API operation.
    #
    # Amazon Web Services CLI or SDKs handles authentication and authorization on your behalf.
    #
    # Permissions You must have `READ` access to the source object and `WRITE` access to the
    # destination bucket.
    #
    # - **General purpose bucket permissions** - You must have the permissions in a policy based on
    # the bucket types of your source bucket and destination bucket in an `UploadPartCopy` operation.
    #
    # - If the source object is in a general purpose bucket, you must have the ** `s3:GetObject` **
    # permission to read the source object that is being copied.
    #
    # - If the destination bucket is a general purpose bucket, you must have the ** `s3:PutObject` **
    # permission to write the object copy to the destination bucket.
    #
    # - To perform a multipart upload with encryption using an Key Management Service key, the
    # requester must have permission to the `kms:Decrypt` and `kms:GenerateDataKey` actions on the
    # key. The requester must also have permissions for the `kms:GenerateDataKey` action for the
    # `CreateMultipartUpload` API. Then, the requester needs permissions for the `kms:Decrypt` action
    # on the `UploadPart` and `UploadPartCopy` APIs. These permissions are required because Amazon S3
    # must decrypt and read data from the encrypted file parts before it completes the multipart
    # upload. For more information about KMS permissions, see [Protecting data using server-side
    # encryption with
    # KMS](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingKMSEncryption.html) in the
    # *Amazon S3 User Guide*. For information about the permissions required to use the multipart
    # upload API, see [Multipart upload and
    # permissions](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html) and
    # [Multipart upload API and
    # permissions](https://docs.aws.amazon.com/AmazonS3/latest/userguide/mpuoverview.html#mpuAndPermissions)
    # in the *Amazon S3 User Guide*.
    #
    # - **Directory bucket permissions** - You must have permissions in a bucket policy or an IAM
    # identity-based policy based on the source and destination bucket types in an `UploadPartCopy`
    # operation.
    #
    # - If the source object that you want to copy is in a directory bucket, you must have the **
    # `s3express:CreateSession` ** permission in the `Action` element of a policy to read the object.
    # If no session mode is specified, the session will be created with the maximum allowable
    # privilege, attempting `ReadWrite` first, then `ReadOnly` if `ReadWrite` is not permitted. If you
    # want to explicitly restrict the access to be read-only, you can set the `s3express:SessionMode`
    # condition key to `ReadOnly` on the copy source bucket.
    #
    # - If the copy destination is a directory bucket, you must have the ** `s3express:CreateSession`
    # ** permission in the `Action` element of a policy to write the object to the destination. The
    # `s3express:SessionMode` condition key cannot be set to `ReadOnly` on the copy destination.
    #
    # If the object is encrypted with SSE-KMS, you must also have the `kms:GenerateDataKey` and
    # `kms:Decrypt` permissions in IAM identity-based policies and KMS key policies for the KMS key.
    #
    # For example policies, see [Example bucket policies for S3 Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam-example-bucket-policies.html)
    # and [Amazon Web Services Identity and Access Management (IAM) identity-based policies for S3
    # Express One
    # Zone](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam-identity-policies.html)
    # in the *Amazon S3 User Guide*.
    #
    # Encryption
    #
    # - **General purpose buckets ** - For information about using server-side encryption with
    # customer-provided encryption keys with the `UploadPartCopy` operation, see
    # [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html) and
    # [UploadPart](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html).
    #
    # If you have server-side encryption with customer-provided keys (SSE-C) blocked for your general
    # purpose bucket, you will get an HTTP 403 Access Denied error when you specify the SSE-C request
    # headers while writing new data to your bucket. For more information, see [Blocking or unblocking
    # SSE-C for a general purpose
    # bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/blocking-unblocking-s3-c-encryption-gpb.html).
    #
    # - **Directory buckets ** - For directory buckets, there are only two supported options for
    # server-side encryption: server-side encryption with Amazon S3 managed keys (SSE-S3) (`AES256`)
    # and server-side encryption with KMS keys (SSE-KMS) (`aws:kms`). For more information, see
    # [Protecting data with server-side
    # encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-serv-side-encryption.html)
    # in the *Amazon S3 User Guide*.
    #
    # For directory buckets, when you perform a `CreateMultipartUpload` operation and an
    # `UploadPartCopy` operation, the request headers you provide in the `CreateMultipartUpload`
    # request must match the default encryption configuration of the destination bucket.
    #
    # S3 Bucket Keys aren't supported, when you copy SSE-KMS encrypted objects from general purpose
    # buckets to directory buckets, from directory buckets to general purpose buckets, or between
    # directory buckets, through
    # [UploadPartCopy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html). In
    # this case, Amazon S3 makes a call to KMS every time a copy request is made for a KMS-encrypted
    # object.
    #
    # Special errors
    #
    # - Error Code: `NoSuchUpload`
    #
    # - Description: The specified multipart upload does not exist. The upload ID might be invalid, or
    # the multipart upload might have been aborted or completed.
    #
    # - HTTP Status Code: 404 Not Found
    #
    # - Error Code: `InvalidRequest`
    #
    # - Description: The specified copy source is not supported as a byte-range copy source.
    #
    # - HTTP Status Code: 400 Bad Request
    #
    # HTTP Host header syntax **Directory buckets ** - The HTTP Host header syntax is `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`.
    #
    # The following operations are related to `UploadPartCopy`:
    #
    # -
    # [CreateMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html)
    #
    # - [UploadPart](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html)
    #
    # -
    # [CompleteMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html)
    #
    # -
    # [AbortMultipartUpload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html)
    #
    # - [ListParts](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html)
    #
    # -
    # [ListMultipartUploads](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html)
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def upload_part_copy(input : AS::UploadPartCopyRequest) : Core::ParsedResponse(AS::UploadPartCopyOutput)
      Log.info { "performing 'UploadPartCopy' operation" }
      input.validate! if config.validate_input?
      path = "/#{URI.encode_path_segment(input.bucket)}/#{URI.encode_path(input.key)}"
      query = URI::Params.build do |form|
        form.add("x-id", "UploadPartCopy")
        if value = input.part_number.try(&.to_s)
          form.add("partNumber", value)
        end
        if value = input.upload_id
          form.add("uploadId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.copy_source
        headers["x-amz-copy-source"] = value
      end
      if value = input.copy_source_if_match
        headers["x-amz-copy-source-if-match"] = value
      end
      if value = input.copy_source_if_modified_since.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["x-amz-copy-source-if-modified-since"] = value
      end
      if value = input.copy_source_if_none_match
        headers["x-amz-copy-source-if-none-match"] = value
      end
      if value = input.copy_source_if_unmodified_since.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["x-amz-copy-source-if-unmodified-since"] = value
      end
      if value = input.copy_source_range
        headers["x-amz-copy-source-range"] = value
      end
      if value = input.sse_customer_algorithm
        headers["x-amz-server-side-encryption-customer-algorithm"] = value
      end
      if value = input.sse_customer_key
        headers["x-amz-server-side-encryption-customer-key"] = value
      end
      if value = input.sse_customer_key_md5
        headers["x-amz-server-side-encryption-customer-key-MD5"] = value
      end
      if value = input.copy_source_sse_customer_algorithm
        headers["x-amz-copy-source-server-side-encryption-customer-algorithm"] = value
      end
      if value = input.copy_source_sse_customer_key
        headers["x-amz-copy-source-server-side-encryption-customer-key"] = value
      end
      if value = input.copy_source_sse_customer_key_md5
        headers["x-amz-copy-source-server-side-encryption-customer-key-MD5"] = value
      end
      if value = input.request_payer.try(&.to_json_object_key)
        headers["x-amz-request-payer"] = value
      end
      if value = input.expected_bucket_owner
        headers["x-amz-expected-bucket-owner"] = value
      end
      if value = input.expected_source_bucket_owner
        headers["x-amz-source-expected-bucket-owner"] = value
      end
      response = rest_request("UploadPartCopy", "PUT", path, headers, nil, "application/xml")
      result = AS::UploadPartCopyOutput.new(
        copy_source_version_id: response.headers["x-amz-copy-source-version-id"]?,
        server_side_encryption: response.headers["x-amz-server-side-encryption"]?.try { |value| AS::ServerSideEncryption.from_json_object_key?(value) },
        sse_customer_algorithm: response.headers["x-amz-server-side-encryption-customer-algorithm"]?,
        sse_customer_key_md5: response.headers["x-amz-server-side-encryption-customer-key-MD5"]?,
        ssekms_key_id: response.headers["x-amz-server-side-encryption-aws-kms-key-id"]?,
        bucket_key_enabled: Core::HeaderValue.bool(response.headers["x-amz-server-side-encryption-bucket-key-enabled"]?),
        request_charged: response.headers["x-amz-request-charged"]?.try { |value| AS::RequestCharged.from_json_object_key?(value) },
        copy_part_result: CopyPartResult.from_xml(XML.parse(response.body).root.not_nil!),
      )
      Core::ParsedResponse(AS::UploadPartCopyOutput).new(response, result)
    end

    # This operation is not supported for directory buckets.
    #
    # Passes transformed objects to a `GetObject` operation when using Object Lambda access points.
    # For information about Object Lambda access points, see [Transforming objects with Object Lambda
    # access points](https://docs.aws.amazon.com/AmazonS3/latest/userguide/transforming-objects.html)
    # in the *Amazon S3 User Guide*.
    #
    # This operation supports metadata that can be returned by
    # [GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html), in addition to
    # `RequestRoute`, `RequestToken`, `StatusCode`, `ErrorCode`, and `ErrorMessage`. The `GetObject`
    # response metadata is supported so that the `WriteGetObjectResponse` caller, typically an Lambda
    # function, can provide the same metadata when it internally invokes `GetObject`. When
    # `WriteGetObjectResponse` is called by a customer-owned Lambda function, the metadata returned to
    # the end user `GetObject` call might differ from what Amazon S3 would normally return.
    #
    # You can include any number of metadata headers. When including a metadata header, it should be
    # prefaced with `x-amz-meta`. For example, `x-amz-meta-my-custom-header: MyCustomValue`. The
    # primary use case for this is to forward `GetObject` metadata.
    #
    # Amazon Web Services provides some prebuilt Lambda functions that you can use with S3 Object
    # Lambda to detect and redact personally identifiable information (PII) and decompress S3 objects.
    # These Lambda functions are available in the Amazon Web Services Serverless Application
    # Repository, and can be selected through the Amazon Web Services Management Console when you
    # create your Object Lambda access point.
    #
    # Example 1: PII Access Control - This Lambda function uses Amazon Comprehend, a natural language
    # processing (NLP) service using machine learning to find insights and relationships in text. It
    # automatically detects personally identifiable information (PII) such as names, addresses, dates,
    # credit card numbers, and social security numbers from documents in your Amazon S3 bucket.
    #
    # Example 2: PII Redaction - This Lambda function uses Amazon Comprehend, a natural language
    # processing (NLP) service using machine learning to find insights and relationships in text. It
    # automatically redacts personally identifiable information (PII) such as names, addresses, dates,
    # credit card numbers, and social security numbers from documents in your Amazon S3 bucket.
    #
    # Example 3: Decompression - The Lambda function S3ObjectLambdaDecompression, is equipped to
    # decompress objects stored in S3 in one of six compressed file formats including bzip2, gzip,
    # snappy, zlib, zstandard and ZIP.
    #
    # For information on how to view and use these functions, see [Using Amazon Web Services built
    # Lambda functions](https://docs.aws.amazon.com/AmazonS3/latest/userguide/olap-examples.html) in
    # the *Amazon S3 User Guide*.
    #
    # You must URL encode any signed header values that contain spaces. For example, if your header
    # value is `my file.txt`, containing two spaces after `my`, you must URL encode this value to
    # `my%20%20file.txt`.
    def write_get_object_response(input : AS::WriteGetObjectResponseRequest) : Core::Response
      Log.info { "performing 'WriteGetObjectResponse' operation" }
      input.validate! if config.validate_input?
      path = "/WriteGetObjectResponse"
      headers = HTTP::Headers.new
      if value = input.request_route
        headers["x-amz-request-route"] = value
      end
      if value = input.request_token
        headers["x-amz-request-token"] = value
      end
      if value = input.status_code.try(&.to_s)
        headers["x-amz-fwd-status"] = value
      end
      if value = input.error_code
        headers["x-amz-fwd-error-code"] = value
      end
      if value = input.error_message
        headers["x-amz-fwd-error-message"] = value
      end
      if value = input.accept_ranges
        headers["x-amz-fwd-header-accept-ranges"] = value
      end
      if value = input.cache_control
        headers["x-amz-fwd-header-Cache-Control"] = value
      end
      if value = input.content_disposition
        headers["x-amz-fwd-header-Content-Disposition"] = value
      end
      if value = input.content_encoding
        headers["x-amz-fwd-header-Content-Encoding"] = value
      end
      if value = input.content_language
        headers["x-amz-fwd-header-Content-Language"] = value
      end
      if value = input.content_length.try(&.to_s)
        headers["Content-Length"] = value
      end
      if value = input.content_range
        headers["x-amz-fwd-header-Content-Range"] = value
      end
      if value = input.content_type
        headers["x-amz-fwd-header-Content-Type"] = value
      end
      if value = input.checksum_crc32
        headers["x-amz-fwd-header-x-amz-checksum-crc32"] = value
      end
      if value = input.checksum_crc32c
        headers["x-amz-fwd-header-x-amz-checksum-crc32c"] = value
      end
      if value = input.checksum_crc64nvme
        headers["x-amz-fwd-header-x-amz-checksum-crc64nvme"] = value
      end
      if value = input.checksum_sha1
        headers["x-amz-fwd-header-x-amz-checksum-sha1"] = value
      end
      if value = input.checksum_sha256
        headers["x-amz-fwd-header-x-amz-checksum-sha256"] = value
      end
      if value = input.checksum_sha512
        headers["x-amz-fwd-header-x-amz-checksum-sha512"] = value
      end
      if value = input.checksum_md5
        headers["x-amz-fwd-header-x-amz-checksum-md5"] = value
      end
      if value = input.checksum_xxhash64
        headers["x-amz-fwd-header-x-amz-checksum-xxhash64"] = value
      end
      if value = input.checksum_xxhash3
        headers["x-amz-fwd-header-x-amz-checksum-xxhash3"] = value
      end
      if value = input.checksum_xxhash128
        headers["x-amz-fwd-header-x-amz-checksum-xxhash128"] = value
      end
      if value = input.delete_marker.try(&.to_s)
        headers["x-amz-fwd-header-x-amz-delete-marker"] = value
      end
      if value = input.e_tag
        headers["x-amz-fwd-header-ETag"] = value
      end
      if value = input.expires
        headers["x-amz-fwd-header-Expires"] = value
      end
      if value = input.expiration
        headers["x-amz-fwd-header-x-amz-expiration"] = value
      end
      if value = input.last_modified.try { |time| Core::HeaderValue.format_http_time(time) }
        headers["x-amz-fwd-header-Last-Modified"] = value
      end
      if value = input.missing_meta.try(&.to_s)
        headers["x-amz-fwd-header-x-amz-missing-meta"] = value
      end
      if value = input.object_lock_mode.try(&.to_json_object_key)
        headers["x-amz-fwd-header-x-amz-object-lock-mode"] = value
      end
      if value = input.object_lock_legal_hold_status.try(&.to_json_object_key)
        headers["x-amz-fwd-header-x-amz-object-lock-legal-hold"] = value
      end
      if value = input.object_lock_retain_until_date.try { |time| Core::HeaderValue.format_date_time(time) }
        headers["x-amz-fwd-header-x-amz-object-lock-retain-until-date"] = value
      end
      if value = input.parts_count.try(&.to_s)
        headers["x-amz-fwd-header-x-amz-mp-parts-count"] = value
      end
      if value = input.replication_status.try(&.to_json_object_key)
        headers["x-amz-fwd-header-x-amz-replication-status"] = value
      end
      if value = input.request_charged.try(&.to_json_object_key)
        headers["x-amz-fwd-header-x-amz-request-charged"] = value
      end
      if value = input.restore
        headers["x-amz-fwd-header-x-amz-restore"] = value
      end
      if value = input.server_side_encryption.try(&.to_json_object_key)
        headers["x-amz-fwd-header-x-amz-server-side-encryption"] = value
      end
      if value = input.sse_customer_algorithm
        headers["x-amz-fwd-header-x-amz-server-side-encryption-customer-algorithm"] = value
      end
      if value = input.ssekms_key_id
        headers["x-amz-fwd-header-x-amz-server-side-encryption-aws-kms-key-id"] = value
      end
      if value = input.sse_customer_key_md5
        headers["x-amz-fwd-header-x-amz-server-side-encryption-customer-key-MD5"] = value
      end
      if value = input.storage_class.try(&.to_json_object_key)
        headers["x-amz-fwd-header-x-amz-storage-class"] = value
      end
      if value = input.tag_count.try(&.to_s)
        headers["x-amz-fwd-header-x-amz-tagging-count"] = value
      end
      if value = input.version_id
        headers["x-amz-fwd-header-x-amz-version-id"] = value
      end
      if value = input.bucket_key_enabled.try(&.to_s)
        headers["x-amz-fwd-header-x-amz-server-side-encryption-bucket-key-enabled"] = value
      end
      (input.metadata || {} of String => String).each do |key, value|
        headers["x-amz-meta-#{key}"] = value
      end
      response = rest_request("WriteGetObjectResponse", "POST", path, headers, input.body, "application/xml")
      Core::Response.new(response)
    end
  end
end
