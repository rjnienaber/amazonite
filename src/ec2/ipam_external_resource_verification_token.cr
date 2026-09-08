private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # A verification token is an Amazon Web Services-generated random value that you can use to prove
  # ownership of an external resource. For example, you can use a verification token to validate
  # that you control a public IP address range when you bring an IP address range to Amazon Web
  # Services (BYOIP).
  class IpamExternalResourceVerificationToken
    # The ID of the token.
    property ipam_external_resource_verification_token_id : String | Nil

    # Token ARN.
    property ipam_external_resource_verification_token_arn : String | Nil

    # The ID of the IPAM that created the token.
    property ipam_id : String | Nil

    # ARN of the IPAM that created the token.
    property ipam_arn : String | Nil

    # Region of the IPAM that created the token.
    property ipam_region : String | Nil

    # Token value.
    property token_value : String | Nil

    # Token name.
    property token_name : String | Nil

    # Token expiration.
    property not_after : Time | Nil

    # Token status.
    property status : TokenState | Nil

    # Token tags.
    property tags : Array(Tag) | Nil

    # Token state.
    property state : IpamExternalResourceVerificationTokenState | Nil

    def initialize(
      @ipam_external_resource_verification_token_id : String | Nil = nil,
      @ipam_external_resource_verification_token_arn : String | Nil = nil,
      @ipam_id : String | Nil = nil,
      @ipam_arn : String | Nil = nil,
      @ipam_region : String | Nil = nil,
      @token_value : String | Nil = nil,
      @token_name : String | Nil = nil,
      @not_after : Time | Nil = nil,
      @status : TokenState | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @state : IpamExternalResourceVerificationTokenState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_external_resource_verification_token_id
        params << {"#{prefix}IpamExternalResourceVerificationTokenId", value}
      end

      if value = @ipam_external_resource_verification_token_arn
        params << {"#{prefix}IpamExternalResourceVerificationTokenArn", value}
      end

      if value = @ipam_id
        params << {"#{prefix}IpamId", value}
      end

      if value = @ipam_arn
        params << {"#{prefix}IpamArn", value}
      end

      if value = @ipam_region
        params << {"#{prefix}IpamRegion", value}
      end

      if value = @token_value
        params << {"#{prefix}TokenValue", value}
      end

      if value = @token_name
        params << {"#{prefix}TokenName", value}
      end

      if value = @not_after
        params << {"#{prefix}NotAfter", Core::QueryValue.time(value)}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_external_resource_verification_token_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamExternalResourceVerificationTokenId']")),
        ipam_external_resource_verification_token_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamExternalResourceVerificationTokenArn']")),
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamId']")),
        ipam_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamArn']")),
        ipam_region: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamRegion']")),
        token_value: Core::XMLValue.string(node.xpath_node("*[local-name()='tokenValue']")),
        token_name: Core::XMLValue.string(node.xpath_node("*[local-name()='tokenName']")),
        not_after: Core::XMLValue.time(node.xpath_node("*[local-name()='notAfter']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::TokenState.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamExternalResourceVerificationTokenState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @ipam_external_resource_verification_token_arn
        raise Core::ValidationError.new("IpamExternalResourceVerificationTokenArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamExternalResourceVerificationTokenArn length must be <= 1283") if value.size > 1283
      end

      if value = @ipam_arn
        raise Core::ValidationError.new("IpamArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_external_resource_verification_token_id, @ipam_external_resource_verification_token_arn, @ipam_id, @ipam_arn, @ipam_region, @token_value, @token_name, @not_after, @status, @tags, @state)
  end
end
