private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class SigningCertificate
    property user_name : String

    property certificate_id : String

    property certificate_body : String

    property status : StatusType

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
        status: (n = node.xpath_node("*[local-name()='Status']")) ? AI::StatusType.from_json_object_key?(n.content) : nil.not_nil!,
        upload_date: Core::XMLValue.time(node.xpath_node("*[local-name()='UploadDate']")),
      )
    end
  end
end
