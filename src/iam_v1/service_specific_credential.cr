private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ServiceSpecificCredential
    property create_date : Time

    property expiration_date : Time | Nil

    property service_name : String

    property service_user_name : String | Nil

    property service_password : String | Nil

    property service_credential_alias : String | Nil

    property service_credential_secret : String | Nil

    property service_specific_credential_id : String

    property user_name : String

    property status : StatusType

    def initialize(
      @create_date : Time,
      @service_name : String,
      @service_specific_credential_id : String,
      @user_name : String,
      @status : StatusType,
      @expiration_date : Time | Nil = nil,
      @service_user_name : String | Nil = nil,
      @service_password : String | Nil = nil,
      @service_credential_alias : String | Nil = nil,
      @service_credential_secret : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}CreateDate", Core::QueryValue.time(@create_date)}

      if value = @expiration_date
        params << {"#{prefix}ExpirationDate", Core::QueryValue.time(value)}
      end

      params << {"#{prefix}ServiceName", @service_name}

      if value = @service_user_name
        params << {"#{prefix}ServiceUserName", value}
      end

      if value = @service_password
        params << {"#{prefix}ServicePassword", value}
      end

      if value = @service_credential_alias
        params << {"#{prefix}ServiceCredentialAlias", value}
      end

      if value = @service_credential_secret
        params << {"#{prefix}ServiceCredentialSecret", value}
      end

      params << {"#{prefix}ServiceSpecificCredentialId", @service_specific_credential_id}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}Status", @status.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")).not_nil!,
        expiration_date: Core::XMLValue.time(node.xpath_node("*[local-name()='ExpirationDate']")),
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceName']")).not_nil!,
        service_user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceUserName']")),
        service_password: Core::XMLValue.string(node.xpath_node("*[local-name()='ServicePassword']")),
        service_credential_alias: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceCredentialAlias']")),
        service_credential_secret: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceCredentialSecret']")),
        service_specific_credential_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceSpecificCredentialId']")).not_nil!,
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        status: (n = node.xpath_node("*[local-name()='Status']")) ? AI::StatusType.from_json_object_key?(n.content) : nil.not_nil!,
      )
    end
  end
end
