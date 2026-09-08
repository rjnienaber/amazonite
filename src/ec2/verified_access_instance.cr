private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Verified Access instance.
  class VerifiedAccessInstance
    # The ID of the Amazon Web Services Verified Access instance.
    property verified_access_instance_id : String | Nil

    # A description for the Amazon Web Services Verified Access instance.
    property description : String | Nil

    # The IDs of the Amazon Web Services Verified Access trust providers.
    property verified_access_trust_providers : Array(VerifiedAccessTrustProviderCondensed) | Nil

    # The creation time.
    property creation_time : String | Nil

    # The last updated time.
    property last_updated_time : String | Nil

    # The tags.
    property tags : Array(Tag) | Nil

    # Indicates whether support for Federal Information Processing Standards (FIPS) is enabled on the
    # instance.
    property fips_enabled : Bool | Nil

    # The custom subdomain.
    property cidr_endpoints_custom_sub_domain : VerifiedAccessInstanceCustomSubDomain | Nil

    def initialize(
      @verified_access_instance_id : String | Nil = nil,
      @description : String | Nil = nil,
      @verified_access_trust_providers : Array(VerifiedAccessTrustProviderCondensed) | Nil = nil,
      @creation_time : String | Nil = nil,
      @last_updated_time : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @fips_enabled : Bool | Nil = nil,
      @cidr_endpoints_custom_sub_domain : VerifiedAccessInstanceCustomSubDomain | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @verified_access_instance_id
        params << {"#{prefix}VerifiedAccessInstanceId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@verified_access_trust_providers || [] of VerifiedAccessTrustProviderCondensed).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}VerifiedAccessTrustProviderSet.#{i}."))
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", value}
      end

      if value = @last_updated_time
        params << {"#{prefix}LastUpdatedTime", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @fips_enabled
        params << {"#{prefix}FipsEnabled", Core::QueryValue.bool(value)}
      end

      if value = @cidr_endpoints_custom_sub_domain
        params.concat(value.to_query_params("#{prefix}CidrEndpointsCustomSubDomain."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        verified_access_instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='verifiedAccessInstanceId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        verified_access_trust_providers: node.xpath_nodes("*[local-name()='verifiedAccessTrustProviderSet']/*[local-name()='item']").map { |n| VerifiedAccessTrustProviderCondensed.from_xml(n) },
        creation_time: Core::XMLValue.string(node.xpath_node("*[local-name()='creationTime']")),
        last_updated_time: Core::XMLValue.string(node.xpath_node("*[local-name()='lastUpdatedTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        fips_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='fipsEnabled']")),
        cidr_endpoints_custom_sub_domain: node.xpath_node("*[local-name()='cidrEndpointsCustomSubDomain']").try { |n| VerifiedAccessInstanceCustomSubDomain.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @verified_access_trust_providers
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @cidr_endpoints_custom_sub_domain
        value.validate!
      end
    end

    def_equals_and_hash(@verified_access_instance_id, @description, @verified_access_trust_providers, @creation_time, @last_updated_time, @tags, @fips_enabled, @cidr_endpoints_custom_sub_domain)
  end
end
