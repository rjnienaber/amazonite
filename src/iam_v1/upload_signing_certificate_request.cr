private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UploadSigningCertificateRequest
    property user_name : String | Nil

    property certificate_body : String

    def initialize(
      @certificate_body : String,
      @user_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      params << {"#{prefix}CertificateBody", @certificate_body}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        certificate_body: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateBody']")).not_nil!,
      )
    end
  end
end
