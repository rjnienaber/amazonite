private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListTypeRegistrationsInput
    # The kind of extension.
    #
    # Conditional: You must specify either `TypeName` and `Type`, or `Arn`.
    property type : RegistryType | Nil

    # The name of the extension.
    #
    # Conditional: You must specify either `TypeName` and `Type`, or `Arn`.
    property type_name : String | Nil

    # The Amazon Resource Name (ARN) of the extension.
    #
    # Conditional: You must specify either `TypeName` and `Type`, or `Arn`.
    property type_arn : String | Nil

    # The current status of the extension registration request.
    #
    # The default is `IN_PROGRESS`.
    property registration_status_filter : RegistrationStatus | Nil

    # The maximum number of results to be returned with a single call. If the number of available
    # results exceeds this maximum, the response includes a `NextToken` value that you can assign to
    # the `NextToken` request parameter to get the next set of results.
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    property next_token : String | Nil

    def initialize(
      @type : RegistryType | Nil = nil,
      @type_name : String | Nil = nil,
      @type_arn : String | Nil = nil,
      @registration_status_filter : RegistrationStatus | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
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

      if value = @type_arn
        params << {"#{prefix}TypeArn", value}
      end

      if value = @registration_status_filter
        params << {"#{prefix}RegistrationStatusFilter", value.to_json_object_key}
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
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::RegistryType.from_json_object_key?(n.content) : nil,
        type_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeName']")),
        type_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeArn']")),
        registration_status_filter: (n = node.xpath_node("*[local-name()='RegistrationStatusFilter']")) ? ACF::RegistrationStatus.from_json_object_key?(n.content) : nil,
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("TypeName length must be <= 204") if value.size > 204
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}::[A-Za-z0-9]{2,64}(::MODULE){0,1}$"))
      end

      if value = @type_arn
        raise Core::ValidationError.new("TypeArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TypeArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("TypeArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[A-Za-z0-9-]{0,64}:cloudformation:[A-Za-z0-9-]{1,64}:([0-9]{12})?:type/.+$"))
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

    def_equals_and_hash(@type, @type_name, @type_arn, @registration_status_filter, @max_results, @next_token)
  end
end
