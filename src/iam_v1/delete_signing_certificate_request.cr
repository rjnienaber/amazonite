private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteSigningCertificateRequest
    property user_name : String | Nil

    property certificate_id : String

    def initialize(
      @certificate_id : String,
      @user_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      params << {"#{prefix}CertificateId", @certificate_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        certificate_id: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateId']")).not_nil!,
      )
    end
  end
end
