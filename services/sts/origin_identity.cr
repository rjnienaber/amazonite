private alias Core = Amazonite::Core

module Amazonite::Sts
  # The session's `aws:OriginIdentity/Subject`, `aws:OriginIdentity/SubjectType`,
  # `aws:OriginIdentity/Issuer` and `aws:OriginIdentity/FederatedProviderArn` keys. A member is
  # absent when the session does not have the key.
  class OriginIdentity
    # The value of the `aws:OriginIdentity/Subject` key: the end user's identifier, taken from the
    # token claim that the context provider maps as the subject.
    property subject : String | Nil

    # The value of the `aws:OriginIdentity/SubjectType` key, which indicates whether the end user is a
    # person (`user`) or a non-human caller such as an application or service (`workload`).
    property subject_type : String | Nil

    # The value of the `aws:OriginIdentity/Issuer` key. For `AssumeRoleWithWebIdentity`, this is the
    # `iss` claim of the token without the `https://` prefix. For `AssumeRoleWithSAML`, this is a hash
    # of the key that signed the SAML assertion, not the `Issuer` element of the assertion.
    property issuer : String | Nil

    # The value of the `aws:OriginIdentity/FederatedProviderArn` key: the ARN of the IAM identity
    # provider that the request federated through.
    property federated_provider_arn : String | Nil

    def initialize(
      @subject : String | Nil = nil,
      @subject_type : String | Nil = nil,
      @issuer : String | Nil = nil,
      @federated_provider_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @subject
        params << {"#{prefix}Subject", value}
      end

      if value = @subject_type
        params << {"#{prefix}SubjectType", value}
      end

      if value = @issuer
        params << {"#{prefix}Issuer", value}
      end

      if value = @federated_provider_arn
        params << {"#{prefix}FederatedProviderArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subject: Core::XMLValue.string(node.xpath_node("*[local-name()='Subject']")),
        subject_type: Core::XMLValue.string(node.xpath_node("*[local-name()='SubjectType']")),
        issuer: Core::XMLValue.string(node.xpath_node("*[local-name()='Issuer']")),
        federated_provider_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='FederatedProviderArn']")),
      )
    end

    def validate! : Nil
      if value = @federated_provider_arn
        raise Core::ValidationError.new("FederatedProviderArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("FederatedProviderArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("FederatedProviderArn does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~\u0085\u00A0-퟿\uE000-�က0-ჿFF]+$"))
      end
    end

    def_equals_and_hash(@subject, @subject_type, @issuer, @federated_provider_arn)
  end
end
