private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ServerCertificateMetadata
    property path : String

    property server_certificate_name : String

    property server_certificate_id : String

    property arn : String

    property upload_date : Time | Nil

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
  end
end
