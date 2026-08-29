private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ServiceSpecificCredentialMetadata
    property user_name : String

    property status : StatusType

    property service_user_name : String | Nil

    property service_credential_alias : String | Nil

    property create_date : Time

    property expiration_date : Time | Nil

    property service_specific_credential_id : String

    property service_name : String

    def initialize(
      @user_name : String,
      @status : StatusType,
      @create_date : Time,
      @service_specific_credential_id : String,
      @service_name : String,
      @service_user_name : String | Nil = nil,
      @service_credential_alias : String | Nil = nil,
      @expiration_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}Status", @status.to_json_object_key}

      if value = @service_user_name
        params << {"#{prefix}ServiceUserName", value}
      end

      if value = @service_credential_alias
        params << {"#{prefix}ServiceCredentialAlias", value}
      end

      params << {"#{prefix}CreateDate", Core::QueryValue.time(@create_date)}

      if value = @expiration_date
        params << {"#{prefix}ExpirationDate", Core::QueryValue.time(value)}
      end

      params << {"#{prefix}ServiceSpecificCredentialId", @service_specific_credential_id}

      params << {"#{prefix}ServiceName", @service_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AI::StatusType.from_json_object_key?(n.content) : nil).not_nil!,
        service_user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceUserName']")),
        service_credential_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceCredentialAlias']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")).not_nil!,
        expiration_date: Core::XMLValue.time(node.xpath_node("*[local-name()='ExpirationDate']")),
        service_specific_credential_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceSpecificCredentialId']")).not_nil!,
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceName']")).not_nil!,
      )
    end
  end
end
