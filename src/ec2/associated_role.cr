private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the associated IAM roles.
  class AssociatedRole
    # The ARN of the associated IAM role.
    property associated_role_arn : String | Nil

    # The name of the Amazon S3 bucket in which the Amazon S3 object is stored.
    property certificate_s3_bucket_name : String | Nil

    # The key of the Amazon S3 object where the certificate, certificate chain, and encrypted private
    # key bundle are stored. The object key is formatted as follows: `role_arn`/`certificate_arn`.
    property certificate_s3_object_key : String | Nil

    # The ID of the KMS key used to encrypt the private key.
    property encryption_kms_key_id : String | Nil

    def initialize(
      @associated_role_arn : String | Nil = nil,
      @certificate_s3_bucket_name : String | Nil = nil,
      @certificate_s3_object_key : String | Nil = nil,
      @encryption_kms_key_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @associated_role_arn
        params << {"#{prefix}AssociatedRoleArn", value}
      end

      if value = @certificate_s3_bucket_name
        params << {"#{prefix}CertificateS3BucketName", value}
      end

      if value = @certificate_s3_object_key
        params << {"#{prefix}CertificateS3ObjectKey", value}
      end

      if value = @encryption_kms_key_id
        params << {"#{prefix}EncryptionKmsKeyId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        associated_role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='associatedRoleArn']")),
        certificate_s3_bucket_name: Core::XMLValue.string(node.xpath_node("*[local-name()='certificateS3BucketName']")),
        certificate_s3_object_key: Core::XMLValue.string(node.xpath_node("*[local-name()='certificateS3ObjectKey']")),
        encryption_kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='encryptionKmsKeyId']")),
      )
    end

    def validate! : Nil
      if value = @associated_role_arn
        raise Core::ValidationError.new("AssociatedRoleArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AssociatedRoleArn length must be <= 1283") if value.size > 1283
      end
    end

    def_equals_and_hash(@associated_role_arn, @certificate_s3_bucket_name, @certificate_s3_object_key, @encryption_kms_key_id)
  end
end
