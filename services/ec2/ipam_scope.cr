private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # In IPAM, a scope is the highest-level container within IPAM. An IPAM contains two default
  # scopes. Each scope represents the IP space for a single network. The private scope is intended
  # for all private IP address space. The public scope is intended for all public IP address space.
  # Scopes enable you to reuse IP addresses across multiple unconnected networks without causing IP
  # address overlap or conflict.
  #
  # For more information, see [How IPAM
  # works](https://docs.aws.amazon.com/vpc/latest/ipam/how-it-works-ipam.html) in the *Amazon VPC
  # IPAM User Guide*.
  class IpamScope
    # The Amazon Web Services account ID of the owner of the scope.
    property owner_id : String | Nil

    # The ID of the scope.
    property ipam_scope_id : String | Nil

    # The Amazon Resource Name (ARN) of the scope.
    property ipam_scope_arn : String | Nil

    # The ARN of the IPAM.
    property ipam_arn : String | Nil

    # The Amazon Web Services Region of the IPAM scope.
    property ipam_region : String | Nil

    # The type of the scope.
    property ipam_scope_type : IpamScopeType | Nil

    # Defines if the scope is the default scope or not.
    property is_default : Bool | Nil

    # The description of the scope.
    property description : String | Nil

    # The number of pools in the scope.
    property pool_count : Int32 | Nil

    # The state of the IPAM scope.
    property state : IpamScopeState | Nil

    # The key/value combination of a tag assigned to the resource. Use the tag key in the filter name
    # and the tag value as the filter value. For example, to find all resources that have a tag with
    # the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and `TeamA` for
    # the filter value.
    property tags : Array(Tag) | Nil

    # The external authority configuration for this IPAM scope, if configured.
    #
    # The configuration that links an Amazon VPC IPAM scope to an external authority system. It
    # specifies the type of external system and the external resource identifier that identifies your
    # account or instance in that system.
    #
    # In IPAM, an external authority is a third-party IP address management system that provides CIDR
    # blocks when you provision address space for top-level IPAM pools. This allows you to use your
    # existing IP management system to control which address ranges are allocated to Amazon Web
    # Services while using Amazon VPC IPAM to manage subnets within those ranges.
    property external_authority_configuration : IpamScopeExternalAuthorityConfiguration | Nil

    def initialize(
      @owner_id : String | Nil = nil,
      @ipam_scope_id : String | Nil = nil,
      @ipam_scope_arn : String | Nil = nil,
      @ipam_arn : String | Nil = nil,
      @ipam_region : String | Nil = nil,
      @ipam_scope_type : IpamScopeType | Nil = nil,
      @is_default : Bool | Nil = nil,
      @description : String | Nil = nil,
      @pool_count : Int32 | Nil = nil,
      @state : IpamScopeState | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @external_authority_configuration : IpamScopeExternalAuthorityConfiguration | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @ipam_scope_id
        params << {"#{prefix}IpamScopeId", value}
      end

      if value = @ipam_scope_arn
        params << {"#{prefix}IpamScopeArn", value}
      end

      if value = @ipam_arn
        params << {"#{prefix}IpamArn", value}
      end

      if value = @ipam_region
        params << {"#{prefix}IpamRegion", value}
      end

      if value = @ipam_scope_type
        params << {"#{prefix}IpamScopeType", value.to_json_object_key}
      end

      if value = @is_default
        params << {"#{prefix}IsDefault", Core::QueryValue.bool(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @pool_count
        params << {"#{prefix}PoolCount", value.to_s}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @external_authority_configuration
        params.concat(value.to_query_params("#{prefix}ExternalAuthorityConfiguration."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        ipam_scope_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamScopeId']")),
        ipam_scope_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamScopeArn']")),
        ipam_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamArn']")),
        ipam_region: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamRegion']")),
        ipam_scope_type: (n = node.xpath_node("*[local-name()='ipamScopeType']")) ? AEC::IpamScopeType.from_json_object_key?(n.content) : nil,
        is_default: Core::XMLValue.bool(node.xpath_node("*[local-name()='isDefault']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        pool_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='poolCount']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamScopeState.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        external_authority_configuration: node.xpath_node("*[local-name()='externalAuthorityConfiguration']").try { |n| IpamScopeExternalAuthorityConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_scope_arn
        raise Core::ValidationError.new("IpamScopeArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamScopeArn length must be <= 1283") if value.size > 1283
      end

      if value = @ipam_arn
        raise Core::ValidationError.new("IpamArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @external_authority_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@owner_id, @ipam_scope_id, @ipam_scope_arn, @ipam_arn, @ipam_region, @ipam_scope_type, @is_default, @description, @pool_count, @state, @tags, @external_authority_configuration)
  end
end
