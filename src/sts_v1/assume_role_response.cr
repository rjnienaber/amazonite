private alias Core = Amazonite::Core

module Amazonite::StsV1
  class AssumeRoleResponse
    property credentials : Credentials | Nil

    property assumed_role_user : AssumedRoleUser | Nil

    property packed_policy_size : Int32 | Nil

    property source_identity : String | Nil

    def initialize(
      @credentials : Credentials | Nil = nil,
      @assumed_role_user : AssumedRoleUser | Nil = nil,
      @packed_policy_size : Int32 | Nil = nil,
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
        source_identity: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceIdentity']")),
      )
    end
  end
end
