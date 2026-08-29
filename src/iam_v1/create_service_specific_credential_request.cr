private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateServiceSpecificCredentialRequest
    property user_name : String

    property service_name : String

    property credential_age_days : Int32 | Nil

    def initialize(
      @user_name : String,
      @service_name : String,
      @credential_age_days : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}ServiceName", @service_name}

      if value = @credential_age_days
        params << {"#{prefix}CredentialAgeDays", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceName']")).not_nil!,
        credential_age_days: Core::XMLValue.i32(node.xpath_node("*[local-name()='CredentialAgeDays']")),
      )
    end
  end
end
