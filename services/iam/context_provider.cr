private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the trusted identity propagation context provider configuration for a SAML or OpenID
  # Connect (OIDC) identity provider. The context provider defines how the subject is derived and
  # how keys from the external identity provider's assertion or token are mapped into trusted
  # context keys.
  #
  # This data type is used as a request parameter in the
  # [CreateOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html),
  # [UpdateOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateOpenIDConnectProvider.html),
  # [CreateSAMLProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateSAMLProvider.html),
  # and
  # [UpdateSAMLProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateSAMLProvider.html)
  # operations, and as a response element in the
  # [GetOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOpenIDConnectProvider.html)
  # and
  # [GetSAMLProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetSAMLProvider.html)
  # operations.
  class ContextProvider
    # A list of source-to-target key mappings that define how keys from the external identity
    # provider's assertion or token are mapped into trusted context keys. You can specify from 0 to 10
    # mappings.
    property key_definition_list : Array(ContextProviderKeyDefinition) | Nil

    # The source key that is used to derive the subject for the injected trusted context. This value
    # identifies the claim or attribute in the external identity provider's assertion or token that
    # supplies the subject.
    #
    # The key can contain only ASCII letters (A-Z, a-z), numbers (0-9), single spaces, and the
    # following characters: `_ . : / = + - @ #`. It can't start or end with a space or contain two
    # spaces in a row.
    property subject_source_key : String

    # A static value for the subject type, such as `user` or `workload`.
    #
    # This parameter is optional and is mutually exclusive with `SubjectTypeSourceKey`. Specify either
    # `SubjectTypeValue` or `SubjectTypeSourceKey`, but not both.
    property subject_type_value : String | Nil

    # The source key that supplies the subject type from the external identity provider's assertion or
    # token.
    #
    # The key can contain only ASCII letters (A-Z, a-z), numbers (0-9), single spaces, and the
    # following characters: `_ . : / = + - @ #`. It can't start or end with a space or contain two
    # spaces in a row.
    #
    # This parameter is mutually exclusive with `SubjectTypeValue`. Specify either
    # `SubjectTypeSourceKey` or `SubjectTypeValue`, but not both.
    property subject_type_source_key : String | Nil

    def initialize(
      @subject_source_key : String,
      @key_definition_list : Array(ContextProviderKeyDefinition) | Nil = nil,
      @subject_type_value : String | Nil = nil,
      @subject_type_source_key : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@key_definition_list || [] of ContextProviderKeyDefinition).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}KeyDefinitionList.member.#{i}."))
      end

      params << {"#{prefix}SubjectSourceKey", @subject_source_key}

      if value = @subject_type_value
        params << {"#{prefix}SubjectTypeValue", value}
      end

      if value = @subject_type_source_key
        params << {"#{prefix}SubjectTypeSourceKey", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key_definition_list: node.xpath_nodes("*[local-name()='KeyDefinitionList']/*[local-name()='member']").map { |n| ContextProviderKeyDefinition.from_xml(n) },
        subject_source_key: Core::XMLValue.string(node.xpath_node("*[local-name()='SubjectSourceKey']")).not_nil!,
        subject_type_value: Core::XMLValue.string(node.xpath_node("*[local-name()='SubjectTypeValue']")),
        subject_type_source_key: Core::XMLValue.string(node.xpath_node("*[local-name()='SubjectTypeSourceKey']")),
      )
    end

    def validate! : Nil
      if value = @key_definition_list
        raise Core::ValidationError.new("KeyDefinitionList must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("KeyDefinitionList must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end

      if value = @subject_source_key
        raise Core::ValidationError.new("SubjectSourceKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SubjectSourceKey length must be <= 128") if value.size > 128
      end

      if value = @subject_type_value
        raise Core::ValidationError.new("SubjectTypeValue length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SubjectTypeValue length must be <= 128") if value.size > 128
      end

      if value = @subject_type_source_key
        raise Core::ValidationError.new("SubjectTypeSourceKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SubjectTypeSourceKey length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@key_definition_list, @subject_source_key, @subject_type_value, @subject_type_source_key)
  end
end
