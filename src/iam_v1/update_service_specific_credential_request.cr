private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateServiceSpecificCredentialRequest
    property user_name : String | Nil

    property service_specific_credential_id : String

    property status : StatusType

    def initialize(
      @service_specific_credential_id : String,
      @status : StatusType,
      @user_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      params << {"#{prefix}ServiceSpecificCredentialId", @service_specific_credential_id}

      params << {"#{prefix}Status", @status.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        service_specific_credential_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceSpecificCredentialId']")).not_nil!,
        status: (n = node.xpath_node("*[local-name()='Status']")) ? AI::StatusType.from_json_object_key?(n.content) : nil.not_nil!,
      )
    end
  end
end
