private alias Core = Amazonite::Core

module Amazonite::S3
  class RenameObjectRequest
    # The bucket name of the directory bucket containing the object.
    #
    # You must use virtual-hosted-style requests in the format
    # `Bucket-name.s3express-zone-id.region-code.amazonaws.com`. Path-style requests are not
    # supported. Directory bucket names must be unique in the chosen Availability Zone. Bucket names
    # must follow the format `bucket-base-name--zone-id--x-s3 ` (for example,
    # `amzn-s3-demo-bucket--usw2-az1--x-s3`). For information about bucket naming restrictions, see
    # [Directory bucket naming
    # rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html)
    # in the *Amazon S3 User Guide*.
    property bucket : String = ""

    # Key name of the object to rename.
    property key : String = ""

    # Specifies the source for the rename operation. The value must be URL encoded.
    property rename_source : String = ""

    # Renames the object only if the ETag (entity tag) value provided during the operation matches the
    # ETag of the object in S3. The `If-Match` header field makes the request method conditional on
    # ETags. If the ETag values do not match, the operation returns a `412 Precondition Failed` error.
    #
    # Expects the ETag value as a string.
    property destination_if_match : String | Nil

    # Renames the object only if the destination does not already exist in the specified directory
    # bucket. If the object does exist when you send a request with `If-None-Match:*`, the S3 API will
    # return a `412 Precondition Failed` error, preventing an overwrite. The `If-None-Match` header
    # prevents overwrites of existing data by validating that there's not an object with the same key
    # name already in your directory bucket.
    #
    # Expects the `*` character (asterisk).
    property destination_if_none_match : String | Nil

    # Renames the object if the destination exists and if it has been modified since the specified
    # time.
    property destination_if_modified_since : Time | Nil

    # Renames the object if it hasn't been modified since the specified time.
    property destination_if_unmodified_since : Time | Nil

    # Renames the object if the source exists and if its entity tag (ETag) matches the specified ETag.
    property source_if_match : String | Nil

    # Renames the object if the source exists and if its entity tag (ETag) is different than the
    # specified ETag. If an asterisk (`*`) character is provided, the operation will fail and return a
    # `412 Precondition Failed` error.
    property source_if_none_match : String | Nil

    # Renames the object if the source exists and if it has been modified since the specified time.
    property source_if_modified_since : Time | Nil

    # Renames the object if the source exists and hasn't been modified since the specified time.
    property source_if_unmodified_since : Time | Nil

    # A unique string with a max of 64 ASCII characters in the ASCII range of 33 - 126.
    #
    # `RenameObject` supports idempotency using a client token. To make an idempotent API request
    # using `RenameObject`, specify a client token in the request. You should not reuse the same
    # client token for other API requests. If you retry a request that completed successfully using
    # the same client token and the same parameters, the retry succeeds without performing any further
    # actions. If you retry a successful request using the same client token, but one or more of the
    # parameters are different, the retry fails and an `IdempotentParameterMismatch` error is
    # returned.
    property client_token : String | Nil

    def initialize(
      @bucket : String,
      @key : String,
      @rename_source : String,
      @destination_if_match : String | Nil = nil,
      @destination_if_none_match : String | Nil = nil,
      @destination_if_modified_since : Time | Nil = nil,
      @destination_if_unmodified_since : Time | Nil = nil,
      @source_if_match : String | Nil = nil,
      @source_if_none_match : String | Nil = nil,
      @source_if_modified_since : Time | Nil = nil,
      @source_if_unmodified_since : Time | Nil = nil,
      @client_token : String | Nil = nil,
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

      if value = @rename_source
        raise Core::ValidationError.new("RenameSource does not match the required pattern") unless value.matches?(Regex.new("^\\/?.+\\/.+$"))
      end
    end

    def_equals_and_hash(@bucket, @key, @rename_source, @destination_if_match, @destination_if_none_match, @destination_if_modified_since, @destination_if_unmodified_since, @source_if_match, @source_if_none_match, @source_if_modified_since, @source_if_unmodified_since, @client_token)
  end
end
