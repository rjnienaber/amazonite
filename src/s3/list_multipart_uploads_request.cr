private alias AS = Amazonite::S3

module Amazonite::S3
  class ListMultipartUploadsRequest
    # The name of the bucket to which the multipart upload was initiated.
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

    # Character you use to group keys.
    #
    # All keys that contain the same string between the prefix, if specified, and the first occurrence
    # of the delimiter after the prefix are grouped under a single result element, `CommonPrefixes`.
    # If you don't specify the prefix parameter, then the substring starts at the beginning of the
    # key. The keys that are grouped under `CommonPrefixes` result element are not returned elsewhere
    # in the response.
    #
    # `CommonPrefixes` is filtered out from results if it is not lexicographically greater than the
    # key-marker.
    #
    # **Directory buckets** - For directory buckets, `/` is the only supported delimiter.
    property delimiter : String | Nil

    property encoding_type : EncodingType | Nil

    # Specifies the multipart upload after which listing should begin.
    #
    # - **General purpose buckets** - For general purpose buckets, `key-marker` is an object key.
    # Together with `upload-id-marker`, this parameter specifies the multipart upload after which
    # listing should begin.
    #
    # If `upload-id-marker` is not specified, only the keys lexicographically greater than the
    # specified `key-marker` will be included in the list.
    #
    # If `upload-id-marker` is specified, any multipart uploads for a key equal to the `key-marker`
    # might also be included, provided those multipart uploads have upload IDs lexicographically
    # greater than the specified `upload-id-marker`.
    #
    # - **Directory buckets** - For directory buckets, `key-marker` is obfuscated and isn't a real
    # object key. The `upload-id-marker` parameter isn't supported by directory buckets. To list the
    # additional multipart uploads, you only need to set the value of `key-marker` to the
    # `NextKeyMarker` value from the previous response.
    #
    # In the `ListMultipartUploads` response, the multipart uploads aren't sorted lexicographically
    # based on the object keys.
    property key_marker : String | Nil

    # Sets the maximum number of multipart uploads, from 1 to 1,000, to return in the response body.
    # 1,000 is the maximum number of uploads that can be returned in a response.
    property max_uploads : Int32 | Nil

    # Lists in-progress uploads only for those keys that begin with the specified prefix. You can use
    # prefixes to separate a bucket into different grouping of keys. (You can think of using `prefix`
    # to make groups in the same way that you'd use a folder in a file system.)
    #
    # **Directory buckets** - For directory buckets, only prefixes that end in a delimiter (`/`) are
    # supported.
    property prefix : String | Nil

    # Together with key-marker, specifies the multipart upload after which listing should begin. If
    # key-marker is not specified, the upload-id-marker parameter is ignored. Otherwise, any multipart
    # uploads for a key equal to the key-marker might be included in the list only if they have an
    # upload ID lexicographically greater than the specified `upload-id-marker`.
    #
    # This functionality is not supported for directory buckets.
    property upload_id_marker : String | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    property request_payer : RequestPayer | Nil

    def initialize(
      @bucket : String,
      @delimiter : String | Nil = nil,
      @encoding_type : EncodingType | Nil = nil,
      @key_marker : String | Nil = nil,
      @max_uploads : Int32 | Nil = nil,
      @prefix : String | Nil = nil,
      @upload_id_marker : String | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
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

    def_equals_and_hash(@bucket, @delimiter, @encoding_type, @key_marker, @max_uploads, @prefix, @upload_id_marker, @expected_bucket_owner, @request_payer)
  end
end
