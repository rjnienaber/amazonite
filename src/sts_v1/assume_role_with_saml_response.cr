private alias Core = Amazonite::Core

module Amazonite::StsV1
  # Contains the response to a successful AssumeRoleWithSAML request, including temporary Amazon Web
  # Services credentials that can be used to make Amazon Web Services requests.
  class AssumeRoleWithSAMLResponse
    # The temporary security credentials, which include an access key ID, a secret access key, and a
    # security (or session) token.
    #
    # The size of the security token that STS API operations return is not fixed. We strongly
    # recommend that you make no assumptions about the maximum size.
    property credentials : Credentials | Nil

    # The identifiers for the temporary security credentials that the operation returns.
    property assumed_role_user : AssumedRoleUser | Nil

    # A percentage value that indicates the packed size of the session policies and session tags
    # combined passed in the request. The request fails if the packed size is greater than 100
    # percent, which means the policies and tags exceeded the allowed space.
    property packed_policy_size : Int32 | Nil

    # The value of the `NameID` element in the `Subject` element of the SAML assertion.
    property subject : String | Nil

    # The format of the name ID, as defined by the `Format` attribute in the `NameID` element of the
    # SAML assertion. Typical examples of the format are `transient` or `persistent`.
    #
    # If the format includes the prefix `urn:oasis:names:tc:SAML:2.0:nameid-format`, that prefix is
    # removed. For example, `urn:oasis:names:tc:SAML:2.0:nameid-format:transient` is returned as
    # `transient`. If the format includes any other prefix, the format is returned with no
    # modifications.
    property subject_type : String | Nil

    # The value of the `Issuer` element of the SAML assertion.
    property issuer : String | Nil

    # The value of the `Recipient` attribute of the `SubjectConfirmationData` element of the SAML
    # assertion.
    property audience : String | Nil

    # A hash value based on the concatenation of the following:
    #
    # - The `Issuer` response value.
    #
    # - The Amazon Web Services account ID.
    #
    # - The friendly name (the last part of the ARN) of the SAML provider in IAM.
    #
    # The combination of `NameQualifier` and `Subject` can be used to uniquely identify a user.
    #
    # The following pseudocode shows how the hash value is calculated:
    #
    # `BASE64 ( SHA1 ( "https://example.com/saml" + "123456789012" + "/MySAMLIdP" ) )`
    property name_qualifier : String | Nil

    # The value in the `SourceIdentity` attribute in the SAML assertion. The source identity value
    # persists across [chained
    # role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html#iam-term-role-chaining)
    # sessions.
    #
    # You can require users to set a source identity value when they assume a role. You do this by
    # using the `sts:SourceIdentity` condition key in a role trust policy. That way, actions that are
    # taken with the role are associated with that user. After the source identity is set, the value
    # cannot be changed. It is present in the request for all actions that are taken by the role and
    # persists across [chained
    # role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html#id_roles_terms-and-concepts)
    # sessions. You can configure your SAML identity provider to use an attribute associated with your
    # users, like user name or email, as the source identity when calling `AssumeRoleWithSAML`. You do
    # this by adding an attribute to the SAML assertion. For more information about using source
    # identity, see [Monitor and control actions taken with assumed
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html)
    # in the *IAM User Guide*.
    #
    # The regex used to validate this parameter is a string of characters consisting of upper- and
    # lower-case alphanumeric characters with no spaces. You can also include underscores or any of
    # the following characters: =,.@-
    property source_identity : String | Nil

    def initialize(
      @credentials : Credentials | Nil = nil,
      @assumed_role_user : AssumedRoleUser | Nil = nil,
      @packed_policy_size : Int32 | Nil = nil,
      @subject : String | Nil = nil,
      @subject_type : String | Nil = nil,
      @issuer : String | Nil = nil,
      @audience : String | Nil = nil,
      @name_qualifier : String | Nil = nil,
      @source_identity : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @credentials
        params.concat(value.to_query_params("#{prefix}Credentials."))
      end

      if value = @assumed_role_user
        params.concat(value.to_query_params("#{prefix}AssumedRoleUser."))
      end

      if value = @packed_policy_size
        params << {"#{prefix}PackedPolicySize", value.to_s}
      end

      if value = @subject
        params << {"#{prefix}Subject", value}
      end

      if value = @subject_type
        params << {"#{prefix}SubjectType", value}
      end

      if value = @issuer
        params << {"#{prefix}Issuer", value}
      end

      if value = @audience
        params << {"#{prefix}Audience", value}
      end

      if value = @name_qualifier
        params << {"#{prefix}NameQualifier", value}
      end

      if value = @source_identity
        params << {"#{prefix}SourceIdentity", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        credentials: node.xpath_node("*[local-name()='Credentials']").try { |n| Credentials.from_xml(n) },
        assumed_role_user: node.xpath_node("*[local-name()='AssumedRoleUser']").try { |n| AssumedRoleUser.from_xml(n) },
        packed_policy_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='PackedPolicySize']")),
        subject: Core::XMLValue.string(node.xpath_node("*[local-name()='Subject']")),
        subject_type: Core::XMLValue.string(node.xpath_node("*[local-name()='SubjectType']")),
        issuer: Core::XMLValue.string(node.xpath_node("*[local-name()='Issuer']")),
        audience: Core::XMLValue.string(node.xpath_node("*[local-name()='Audience']")),
        name_qualifier: Core::XMLValue.string(node.xpath_node("*[local-name()='NameQualifier']")),
        source_identity: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceIdentity']")),
      )
    end
  end
end
