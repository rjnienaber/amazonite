private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListTypesInput
    property visibility : Visibility | Nil

    property provisioning_type : ProvisioningType | Nil

    property deprecated_status : DeprecatedStatus | Nil

    property type : RegistryType | Nil

    property filters : TypeFilters | Nil

    property max_results : Int32 | Nil

    property next_token : String | Nil

    def initialize(
      @visibility : Visibility | Nil = nil,
      @provisioning_type : ProvisioningType | Nil = nil,
      @deprecated_status : DeprecatedStatus | Nil = nil,
      @type : RegistryType | Nil = nil,
      @filters : TypeFilters | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @visibility
        params << {"#{prefix}Visibility", value.to_json_object_key}
      end

      if value = @provisioning_type
        params << {"#{prefix}ProvisioningType", value.to_json_object_key}
      end

      if value = @deprecated_status
        params << {"#{prefix}DeprecatedStatus", value.to_json_object_key}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @filters
        params.concat(value.to_query_params("#{prefix}Filters."))
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        visibility: (n = node.xpath_node("*[local-name()='Visibility']")) ? ACF::Visibility.from_json_object_key?(n.content) : nil,
        provisioning_type: (n = node.xpath_node("*[local-name()='ProvisioningType']")) ? ACF::ProvisioningType.from_json_object_key?(n.content) : nil,
        deprecated_status: (n = node.xpath_node("*[local-name()='DeprecatedStatus']")) ? ACF::DeprecatedStatus.from_json_object_key?(n.content) : nil,
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::RegistryType.from_json_object_key?(n.content) : nil,
        filters: node.xpath_node("*[local-name()='Filters']").try { |n| TypeFilters.from_xml(n) },
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
