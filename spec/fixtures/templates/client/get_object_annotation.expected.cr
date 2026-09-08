private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class Client < Core::Client
    Log               = ::Log.for("amazonite.s3.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AmazonS3", "s3", "1.0", EXCEPTION_FACTORY, config)
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
  end
end
