private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Learn Amazon S3 Select is no longer available to new customers. Existing customers of Amazon S3
  # Select can continue to use the feature as usual. [Learn
  # more](http://aws.amazon.com/blogs/storage/how-to-optimize-querying-your-data-in-amazon-s3/)
  #
  # Request to filter the contents of an Amazon S3 object based on a simple Structured Query
  # Language (SQL) statement. In the request, along with the SQL expression, you must specify a data
  # serialization format (JSON or CSV) of the object. Amazon S3 uses this to parse object data into
  # records. It returns only records that match the specified SQL expression. You must also specify
  # the data serialization format for the response. For more information, see [S3Select API
  # Documentation](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectSELECTContent.html).
  class SelectObjectContentRequest
    # The S3 bucket.
    property bucket : String = ""

    # The object key.
    property key : String = ""

    # The server-side encryption (SSE) algorithm used to encrypt the object. This parameter is needed
    # only when the object was created using a checksum algorithm. For more information, see
    # [Protecting data using SSE-C
    # keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html) in
    # the *Amazon S3 User Guide*.
    property sse_customer_algorithm : String | Nil

    # The server-side encryption (SSE) customer managed key. This parameter is needed only when the
    # object was created using a checksum algorithm. For more information, see [Protecting data using
    # SSE-C
    # keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html) in
    # the *Amazon S3 User Guide*.
    property sse_customer_key : String | Nil

    # The MD5 server-side encryption (SSE) customer managed key. This parameter is needed only when
    # the object was created using a checksum algorithm. For more information, see [Protecting data
    # using SSE-C
    # keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html) in
    # the *Amazon S3 User Guide*.
    property sse_customer_key_md5 : String | Nil

    # The expression that is used to query the object.
    property expression : String

    # The type of the provided expression (for example, SQL).
    property expression_type : ExpressionType

    # Specifies if periodic request progress information should be enabled.
    property request_progress : RequestProgress | Nil

    # Describes the format of the data in the object that is being queried.
    property input_serialization : InputSerialization

    # Describes the format of the data that you want Amazon S3 to return in response.
    property output_serialization : OutputSerialization

    # Specifies the byte range of the object to get the records from. A record is processed when its
    # first byte is contained by the range. This parameter is optional, but when specified, it must
    # not be empty. See RFC 2616, Section 14.35.1 about how to specify the start and end of the range.
    #
    # `ScanRange`may be used in the following ways:
    #
    # - `50100` - process only the records starting between the bytes 50 and 100 (inclusive, counting
    # from zero)
    #
    # - `50` - process only the records starting after the byte 50
    #
    # - `50` - process only the records within the last 50 bytes of the file.
    property scan_range : ScanRange | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @key : String,
      @expression : String,
      @expression_type : ExpressionType,
      @input_serialization : InputSerialization,
      @output_serialization : OutputSerialization,
      @sse_customer_algorithm : String | Nil = nil,
      @sse_customer_key : String | Nil = nil,
      @sse_customer_key_md5 : String | Nil = nil,
      @request_progress : RequestProgress | Nil = nil,
      @scan_range : ScanRange | Nil = nil,
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
      xml.element("Expression") { xml.text @expression }

      xml.element("ExpressionType") { xml.text @expression_type.to_json_object_key }

      if value = @request_progress
        xml.element("RequestProgress") { value.build_xml(xml) }
      end

      xml.element("InputSerialization") { @input_serialization.build_xml(xml) }

      xml.element("OutputSerialization") { @output_serialization.build_xml(xml) }

      if value = @scan_range
        xml.element("ScanRange") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        expression: Core::XMLValue.string(node.xpath_node("*[local-name()='Expression']")).not_nil!,
        expression_type: ((n = node.xpath_node("*[local-name()='ExpressionType']")) ? AS::ExpressionType.from_json_object_key?(n.content) : nil).not_nil!,
        request_progress: node.xpath_node("*[local-name()='RequestProgress']").try { |n| RequestProgress.from_xml(n) },
        input_serialization: node.xpath_node("*[local-name()='InputSerialization']").try { |n| InputSerialization.from_xml(n) }.not_nil!,
        output_serialization: node.xpath_node("*[local-name()='OutputSerialization']").try { |n| OutputSerialization.from_xml(n) }.not_nil!,
        scan_range: node.xpath_node("*[local-name()='ScanRange']").try { |n| ScanRange.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end

      if value = @request_progress
        value.validate!
      end

      if value = @input_serialization
        value.validate!
      end

      if value = @output_serialization
        value.validate!
      end

      if value = @scan_range
        value.validate!
      end
    end

    def_equals_and_hash(@bucket, @key, @sse_customer_algorithm, @sse_customer_key, @sse_customer_key_md5, @expression, @expression_type, @request_progress, @input_serialization, @output_serialization, @scan_range, @expected_bucket_owner)
  end
end
