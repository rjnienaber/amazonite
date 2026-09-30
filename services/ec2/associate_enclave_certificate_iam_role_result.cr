private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateEnclaveCertificateIamRoleResult
    # The name of the Amazon S3 bucket to which the certificate was uploaded.
    property certificate_s3_bucket_name : String | Nil

    # The Amazon S3 object key where the certificate, certificate chain, and encrypted private key
    # bundle are stored. The object key is formatted as follows: `role_arn`/`certificate_arn`.
    property certificate_s3_object_key : String | Nil

    # The ID of the KMS key used to encrypt the private key of the certificate.
    property encryption_kms_key_id : String | Nil

    def initialize(
      @certificate_s3_bucket_name : String | Nil = nil,
      @certificate_s3_object_key : String | Nil = nil,
      @encryption_kms_key_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

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
        certificate_s3_bucket_name: Core::XMLValue.string(node.xpath_node("*[local-name()='certificateS3BucketName']")),
        certificate_s3_object_key: Core::XMLValue.string(node.xpath_node("*[local-name()='certificateS3ObjectKey']")),
        encryption_kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='encryptionKmsKeyId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@certificate_s3_bucket_name, @certificate_s3_object_key, @encryption_kms_key_id)
  end
end
