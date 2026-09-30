private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class ListTypesInput
    # The scope at which the extensions are visible and usable in CloudFormation operations.
    #
    # Valid values include:
    #
    # - `PRIVATE`: Extensions that are visible and usable within this account and Region. This
    # includes:
    #
    # - Private extensions you have registered in this account and Region.
    #
    # - Public extensions that you have activated in this account and Region.
    #
    # - `PUBLIC`: Extensions that are publicly visible and available to be activated within any Amazon
    # Web Services account. This includes extensions from Amazon Web Services and third-party
    # publishers.
    #
    # The default is `PRIVATE`.
    property visibility : Visibility | Nil

    # For resource types, the provisioning behavior of the resource type. CloudFormation determines
    # the provisioning type during registration, based on the types of handlers in the schema handler
    # package submitted.
    #
    # Valid values include:
    #
    # - `FULLY_MUTABLE`: The resource type includes an update handler to process updates to the type
    # during stack update operations.
    #
    # - `IMMUTABLE`: The resource type doesn't include an update handler, so the type can't be updated
    # and must instead be replaced during stack update operations.
    #
    # - `NON_PROVISIONABLE`: The resource type doesn't include create, read, and delete handlers, and
    # therefore can't actually be provisioned.
    #
    # The default is `FULLY_MUTABLE`.
    property provisioning_type : ProvisioningType | Nil

    # The deprecation status of the extension that you want to get summary information about.
    #
    # Valid values include:
    #
    # - `LIVE`: The extension is registered for use in CloudFormation operations.
    #
    # - `DEPRECATED`: The extension has been deregistered and can no longer be used in CloudFormation
    # operations.
    property deprecated_status : DeprecatedStatus | Nil

    # The type of extension.
    property type : RegistryType | Nil

    # Filter criteria to use in determining which extensions to return.
    #
    # Filters must be compatible with `Visibility` to return valid results. For example, specifying
    # `AWS_TYPES` for `Category` and `PRIVATE` for `Visibility` returns an empty list of types, but
    # specifying `PUBLIC` for `Visibility` returns the desired list.
    property filters : TypeFilters | Nil

    # The maximum number of results to be returned with a single call. If the number of available
    # results exceeds this maximum, the response includes a `NextToken` value that you can assign to
    # the `NextToken` request parameter to get the next set of results.
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
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

    def validate! : Nil
      if value = @filters
        value.validate!
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@visibility, @provisioning_type, @deprecated_status, @type, @filters, @max_results, @next_token)
  end
end
