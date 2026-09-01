private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains information about a server certificate without its certificate body, certificate chain,
  # and private key.
  #
  # This data type is used as a response element in the
  # [UploadServerCertificate](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UploadServerCertificate.html)
  # and
  # [ListServerCertificates](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListServerCertificates.html)
  # operations.
  class ServerCertificateMetadata
    # The path to the server certificate. For more information about paths, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property path : String

    # The name that identifies the server certificate.
    property server_certificate_name : String

    # The stable and unique string identifying the server certificate. For more information about IDs,
    # see [IAM identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
    # in the *IAM User Guide*.
    property server_certificate_id : String

    # The Amazon Resource Name (ARN) specifying the server certificate. For more information about
    # ARNs and how to use them in policies, see [IAM
    # identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html) in the
    # *IAM User Guide*.
    property arn : String

    # The date when the server certificate was uploaded.
    property upload_date : Time | Nil

    # The date on which the certificate is set to expire.
    property expiration : Time | Nil

    def initialize(
      @path : String,
      @server_certificate_name : String,
      @server_certificate_id : String,
      @arn : String,
      @upload_date : Time | Nil = nil,
      @expiration : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Path", @path}

      params << {"#{prefix}ServerCertificateName", @server_certificate_name}

      params << {"#{prefix}ServerCertificateId", @server_certificate_id}

      params << {"#{prefix}Arn", @arn}

      if value = @upload_date
        params << {"#{prefix}UploadDate", Core::QueryValue.time(value)}
      end

      if value = @expiration
        params << {"#{prefix}Expiration", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")).not_nil!,
        server_certificate_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServerCertificateName']")).not_nil!,
        server_certificate_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ServerCertificateId']")).not_nil!,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        upload_date: Core::XMLValue.time(node.xpath_node("*[local-name()='UploadDate']")),
        expiration: Core::XMLValue.time(node.xpath_node("*[local-name()='Expiration']")),
      )
    end

    def validate! : Nil
      if value = @path
        raise Core::ValidationError.new("Path length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Path length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Path does not match the required pattern") unless value.matches?(Regex.new("^(/)|(/[!-~]+/)$"))
      end

      if value = @server_certificate_name
        raise Core::ValidationError.new("ServerCertificateName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ServerCertificateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ServerCertificateName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @server_certificate_id
        raise Core::ValidationError.new("ServerCertificateId length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("ServerCertificateId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ServerCertificateId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("Arn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@path, @server_certificate_name, @server_certificate_id, @arn, @upload_date, @expiration)
  end
end
