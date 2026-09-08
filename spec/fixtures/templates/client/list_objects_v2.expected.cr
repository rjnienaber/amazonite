private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class Client < Core::Client
    Log               = ::Log.for("amazonite.s3.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AmazonS3", "s3", "1.0", EXCEPTION_FACTORY, config)
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
  end
end
