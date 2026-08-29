private alias Core = Amazonite::Core

module Amazonite::StsV1
  class AssumeRoleWithSAMLResponse
    property credentials : Credentials | Nil

    property assumed_role_user : AssumedRoleUser | Nil

    property packed_policy_size : Int32 | Nil

    property subject : String | Nil

    property subject_type : String | Nil

    property issuer : String | Nil

    property audience : String | Nil

    property name_qualifier : String | Nil

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
