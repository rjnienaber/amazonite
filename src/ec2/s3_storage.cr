private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the storage parameters for Amazon S3 and Amazon S3 buckets for an instance
  # store-backed AMI.
  class S3Storage
    # The access key ID of the owner of the bucket. Before you specify a value for your access key ID,
    # review and follow the guidance in [Best Practices for Amazon Web Services
    # accounts](https://docs.aws.amazon.com/accounts/latest/reference/best-practices.html) in the
    # *Account ManagementReference Guide*.
    property aws_access_key_id : String | Nil

    # The bucket in which to store the AMI. You can specify a bucket that you already own or a new
    # bucket that Amazon EC2 creates on your behalf. If you specify a bucket that belongs to someone
    # else, Amazon EC2 returns an error.
    property bucket : String | Nil

    # The beginning of the file name of the AMI.
    property prefix : String | Nil

    # An Amazon S3 upload policy that gives Amazon EC2 permission to upload items into Amazon S3 on
    # your behalf.
    property upload_policy : Bytes | Nil

    # The signature of the JSON document.
    property upload_policy_signature : String | Nil

    def initialize(
      @aws_access_key_id : String | Nil = nil,
      @bucket : String | Nil = nil,
      @prefix : String | Nil = nil,
      @upload_policy : Bytes | Nil = nil,
      @upload_policy_signature : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @aws_access_key_id
        params << {"#{prefix}AWSAccessKeyId", value}
      end

      if value = @bucket
        params << {"#{prefix}Bucket", value}
      end

      if value = @prefix
        params << {"#{prefix}Prefix", value}
      end

      if value = @upload_policy
        params << {"#{prefix}UploadPolicy", Core::QueryValue.bytes(value)}
      end

      if value = @upload_policy_signature
        params << {"#{prefix}UploadPolicySignature", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        aws_access_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AWSAccessKeyId']")),
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='bucket']")),
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='prefix']")),
        upload_policy: Core::XMLValue.bytes(node.xpath_node("*[local-name()='uploadPolicy']")),
        upload_policy_signature: Core::XMLValue.string(node.xpath_node("*[local-name()='uploadPolicySignature']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@aws_access_key_id, @bucket, @prefix, @upload_policy, @upload_policy_signature)
  end
end
