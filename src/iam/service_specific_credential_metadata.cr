private alias AI = Amazonite::Iam
private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains additional details about a service-specific credential.
  class ServiceSpecificCredentialMetadata
    # The name of the IAM user associated with the service-specific credential.
    property user_name : String

    # The status of the service-specific credential. `Active` means that the key is valid for API
    # calls, while `Inactive` means it is not.
    property status : StatusType

    # The generated user name for the service-specific credential.
    property service_user_name : String | Nil

    # For Bedrock API keys and CloudWatch Logs API keys, this is the public portion of the credential
    # that includes the IAM user name and a suffix containing version and creation information.
    property service_credential_alias : String | Nil

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the
    # service-specific credential were created.
    property create_date : Time

    # The date and time when the service specific credential expires. This field is only present for
    # Bedrock API keys and CloudWatch Logs API keys that were created with an expiration period.
    property expiration_date : Time | Nil

    # The unique identifier for the service-specific credential.
    property service_specific_credential_id : String

    # The name of the service associated with the service-specific credential.
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

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @service_user_name
        raise Core::ValidationError.new("ServiceUserName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ServiceUserName length must be <= 200") if value.size > 200
        raise Core::ValidationError.new("ServiceUserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]*$"))
      end

      if value = @service_credential_alias
        raise Core::ValidationError.new("ServiceCredentialAlias length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ServiceCredentialAlias length must be <= 200") if value.size > 200
        raise Core::ValidationError.new("ServiceCredentialAlias does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @service_specific_credential_id
        raise Core::ValidationError.new("ServiceSpecificCredentialId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ServiceSpecificCredentialId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ServiceSpecificCredentialId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end
    end

    def_equals_and_hash(@user_name, @status, @service_user_name, @service_credential_alias, @create_date, @expiration_date, @service_specific_credential_id, @service_name)
  end
end
