private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListTypeVersionsInput
    # The kind of the extension.
    #
    # Conditional: You must specify either `TypeName` and `Type`, or `Arn`.
    property type : RegistryType | Nil

    # The name of the extension for which you want version summary information.
    #
    # Conditional: You must specify either `TypeName` and `Type`, or `Arn`.
    property type_name : String | Nil

    # The Amazon Resource Name (ARN) of the extension for which you want version summary information.
    #
    # Conditional: You must specify either `TypeName` and `Type`, or `Arn`.
    property arn : String | Nil

    # The maximum number of results to be returned with a single call. If the number of available
    # results exceeds this maximum, the response includes a `NextToken` value that you can assign to
    # the `NextToken` request parameter to get the next set of results.
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    property next_token : String | Nil

    # The deprecation status of the extension versions that you want to get summary information about.
    #
    # Valid values include:
    #
    # - `LIVE`: The extension version is registered and can be used in CloudFormation operations,
    # dependent on its provisioning behavior and visibility scope.
    #
    # - `DEPRECATED`: The extension version has been deregistered and can no longer be used in
    # CloudFormation operations.
    #
    # The default is `LIVE`.
    property deprecated_status : DeprecatedStatus | Nil

    # The publisher ID of the extension publisher.
    #
    # Extensions published by Amazon aren't assigned a publisher ID.
    property publisher_id : String | Nil

    def initialize(
      @type : RegistryType | Nil = nil,
      @type_name : String | Nil = nil,
      @arn : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @deprecated_status : DeprecatedStatus | Nil = nil,
      @publisher_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @type_name
        params << {"#{prefix}TypeName", value}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @deprecated_status
        params << {"#{prefix}DeprecatedStatus", value.to_json_object_key}
      end

      if value = @publisher_id
        params << {"#{prefix}PublisherId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::RegistryType.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        deprecated_status: (n = node.xpath_node("*[local-name()='DeprecatedStatus']")) ? ACF::DeprecatedStatus.from_json_object_key?(n.content) : nil,
        publisher_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherId']")),
      )
    end

    def_equals_and_hash(@type, @type_name, @arn, @max_results, @next_token, @deprecated_status, @publisher_id)
  end
end
