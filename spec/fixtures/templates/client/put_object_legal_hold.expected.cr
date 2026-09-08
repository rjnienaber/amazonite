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
  end
end
