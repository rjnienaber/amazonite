private alias Core = Amazonite::Core

module Amazonite::Iam
  class CreateServiceSpecificCredentialRequest
    # The name of the IAM user that is to be associated with the credentials. The new service-specific
    # credentials have the same permissions as the associated user except that they can be used only
    # to access the specified service.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String

    # The name of the Amazon Web Services service that is to be associated with the credentials. The
    # service you specify here is the only service that can be accessed using these credentials.
    property service_name : String

    # The number of days until the service specific credential expires. This field is only valid for
    # services that support long-term API keys and must be a positive integer. When not specified, the
    # credential will not expire.
    #
    # To see which services support long-term API keys, refer to [API keys for Amazon Web Services
    # services](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_api_keys_for_aws_services.html)
    # in the *IAM User Guide*.
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

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @credential_age_days
        raise Core::ValidationError.new("CredentialAgeDays value must be >= 1") if value < 1
        raise Core::ValidationError.new("CredentialAgeDays value must be <= 36600") if value > 36600
      end
    end

    def_equals_and_hash(@user_name, @service_name, @credential_age_days)
  end
end
