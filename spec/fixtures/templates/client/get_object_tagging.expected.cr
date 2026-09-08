private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class Client < Core::Client
    Log               = ::Log.for("amazonite.s3.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AmazonS3", "s3", "1.0", EXCEPTION_FACTORY, config)
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
  end
end
