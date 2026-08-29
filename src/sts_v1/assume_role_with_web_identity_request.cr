private alias Core = Amazonite::Core

module Amazonite::StsV1
  class AssumeRoleWithWebIdentityRequest
    property role_arn : String

    property role_session_name : String

    property web_identity_token : String

    property provider_id : String | Nil

    property policy_arns : Array(PolicyDescriptorType) | Nil

    property policy : String | Nil

    property duration_seconds : Int32 | Nil

    def initialize(
      @role_arn : String,
      @role_session_name : String,
      @web_identity_token : String,
      @provider_id : String | Nil = nil,
      @policy_arns : Array(PolicyDescriptorType) | Nil = nil,
      @policy : String | Nil = nil,
      @duration_seconds : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleArn", @role_arn}

      params << {"#{prefix}RoleSessionName", @role_session_name}

      params << {"#{prefix}WebIdentityToken", @web_identity_token}

      if value = @provider_id
        params << {"#{prefix}ProviderId", value}
      end

      (@policy_arns || [] of PolicyDescriptorType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PolicyArns.member.#{i}."))
      end

      if value = @policy
        params << {"#{prefix}Policy", value}
      end

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleArn']")).not_nil!,
        role_session_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleSessionName']")).not_nil!,
        web_identity_token: Core::XMLValue.string(node.xpath_node("*[local-name()='WebIdentityToken']")).not_nil!,
        provider_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ProviderId']")),
        policy_arns: node.xpath_nodes("*[local-name()='PolicyArns']/*[local-name()='member']").map { |n| PolicyDescriptorType.from_xml(n) },
        policy: Core::XMLValue.string(node.xpath_node("*[local-name()='Policy']")),
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
      )
    end
  end
end
