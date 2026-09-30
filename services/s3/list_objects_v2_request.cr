private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class ListObjectsV2Request
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

    # A delimiter is a character that you use to group keys.
    #
    # `CommonPrefixes` is filtered out from results if it is not lexicographically greater than the
    # `StartAfter` value.
    #
    # - **Directory buckets** - For directory buckets, `/` is the only supported delimiter.
    #
    # - **Directory buckets ** - When you query `ListObjectsV2` with a delimiter during in-progress
    # multipart uploads, the `CommonPrefixes` response parameter contains the prefixes that are
    # associated with the in-progress multipart uploads. For more information about multipart uploads,
    # see [Multipart Upload
    # Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html) in the *Amazon S3
    # User Guide*.
    property delimiter : String | Nil

    # Encoding type used by Amazon S3 to encode the [object
    # keys](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html) in the response.
    # Responses are encoded only in UTF-8. An object key can contain any Unicode character. However,
    # the XML 1.0 parser can't parse certain characters, such as characters with an ASCII value from 0
    # to 10. For characters that aren't supported in XML 1.0, you can add this parameter to request
    # that Amazon S3 encode the keys in the response. For more information about characters to avoid
    # in object key names, see [Object key naming
    # guidelines](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-guidelines).
    #
    # When using the URL encoding type, non-ASCII characters that are used in an object's key name
    # will be percent-encoded according to UTF-8 code values. For example, the object
    # `test_file(3).png` will appear as `test_file%283%29.png`.
    property encoding_type : EncodingType | Nil

    # Sets the maximum number of keys returned in the response. By default, the action returns up to
    # 1,000 key names. The response might contain fewer keys but will never contain more.
    property max_keys : Int32 | Nil

    # Limits the response to keys that begin with the specified prefix.
    #
    # **Directory buckets** - For directory buckets, only prefixes that end in a delimiter (`/`) are
    # supported.
    property prefix : String | Nil

    # `ContinuationToken` indicates to Amazon S3 that the list is being continued on this bucket with
    # a token. `ContinuationToken` is obfuscated and is not a real key. You can use this
    # `ContinuationToken` for pagination of the list results.
    property continuation_token : String | Nil

    # The owner field is not present in `ListObjectsV2` by default. If you want to return the owner
    # field with each key in the result, then set the `FetchOwner` field to `true`.
    #
    # **Directory buckets** - For directory buckets, the bucket owner is returned as the object owner
    # for all objects.
    property fetch_owner : Bool | Nil

    # StartAfter is where you want Amazon S3 to start listing from. Amazon S3 starts listing after
    # this specified key. StartAfter can be any key in the bucket.
    #
    # This functionality is not supported for directory buckets.
    property start_after : String | Nil

    # Confirms that the requester knows that she or he will be charged for the list objects request in
    # V2 style. Bucket owners need not specify this parameter in their requests.
    #
    # This functionality is not supported for directory buckets.
    property request_payer : RequestPayer | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    # Specifies the optional fields that you want returned in the response. Fields that you do not
    # specify are not returned.
    #
    # This functionality is not supported for directory buckets.
    property optional_object_attributes : Array(OptionalObjectAttributes) | Nil

    def initialize(
      @bucket : String,
      @delimiter : String | Nil = nil,
      @encoding_type : EncodingType | Nil = nil,
      @max_keys : Int32 | Nil = nil,
      @prefix : String | Nil = nil,
      @continuation_token : String | Nil = nil,
      @fetch_owner : Bool | Nil = nil,
      @start_after : String | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
      @optional_object_attributes : Array(OptionalObjectAttributes) | Nil = nil,
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
    end

    def_equals_and_hash(@bucket, @delimiter, @encoding_type, @max_keys, @prefix, @continuation_token, @fetch_owner, @start_after, @request_payer, @expected_bucket_owner, @optional_object_attributes)
  end
end
