private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about an X.509 signing certificate.
  #
  # This data type is used as a response element in the
  # [UploadSigningCertificate](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UploadSigningCertificate.html)
  # and
  # [ListSigningCertificates](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListSigningCertificates.html)
  # operations.
  class SigningCertificate
    # The name of the user the signing certificate is associated with.
    property user_name : String

    # The ID for the signing certificate.
    property certificate_id : String

    # The contents of the signing certificate.
    property certificate_body : String

    # The status of the signing certificate. `Active` means that the key is valid for API calls, while
    # `Inactive` means it is not.
    property status : StatusType

    # The date when the signing certificate was uploaded.
    property upload_date : Time | Nil

    def initialize(
      @user_name : String,
      @certificate_id : String,
      @certificate_body : String,
      @status : StatusType,
      @upload_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}CertificateId", @certificate_id}

      params << {"#{prefix}CertificateBody", @certificate_body}

      params << {"#{prefix}Status", @status.to_json_object_key}

      if value = @upload_date
        params << {"#{prefix}UploadDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        certificate_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateId']")).not_nil!,
        certificate_body: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateBody']")).not_nil!,
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AI::StatusType.from_json_object_key?(n.content) : nil).not_nil!,
        upload_date: Core::XMLValue.time(node.xpath_node("*[local-name()='UploadDate']")),
      )
    end

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @certificate_id
        raise Core::ValidationError.new("CertificateId length must be >= 24") if value.size < 24
        raise Core::ValidationError.new("CertificateId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("CertificateId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end

      if value = @certificate_body
        raise Core::ValidationError.new("CertificateBody length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CertificateBody length must be <= 16384") if value.size > 16384
        raise Core::ValidationError.new("CertificateBody does not match the required pattern") unless value.matches?(Regex.new("^[\\u0009\\u000A\\u000D\\u0020-\\u00FF]+$"))
      end
    end

    def_equals_and_hash(@user_name, @certificate_id, @certificate_body, @status, @upload_date)
  end
end
