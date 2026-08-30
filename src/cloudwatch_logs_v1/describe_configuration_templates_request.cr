private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class DescribeConfigurationTemplatesRequest
    include JSON::Serializable

    # Use this parameter to filter the response to include only the configuration templates that apply
    # to the Amazon Web Services service that you specify here.
    @[JSON::Field(key: "service")]
    property service : String | Nil

    # Use this parameter to filter the response to include only the configuration templates that apply
    # to the log types that you specify here.
    @[JSON::Field(key: "logTypes")]
    property log_types : Array(String) | Nil

    # Use this parameter to filter the response to include only the configuration templates that apply
    # to the resource types that you specify here.
    @[JSON::Field(key: "resourceTypes")]
    property resource_types : Array(String) | Nil

    # Use this parameter to filter the response to include only the configuration templates that apply
    # to the delivery destination types that you specify here.
    @[JSON::Field(key: "deliveryDestinationTypes", converter: Core::ArrayConverter(ACWL::DeliveryDestinationType))]
    property delivery_destination_types : Array(DeliveryDestinationType) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # Use this parameter to limit the number of configuration templates that are returned in the
    # response.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    def initialize(
      @service : String | Nil = nil,
      @log_types : Array(String) | Nil = nil,
      @resource_types : Array(String) | Nil = nil,
      @delivery_destination_types : Array(DeliveryDestinationType) | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @service
        raise Core::ValidationError.new("service length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("service length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("service does not match the required pattern") unless value.matches?(Regex.new("^[\\w_-]*$"))
      end

      if value = @log_types
        raise Core::ValidationError.new("logTypes must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("logTypes must have at most 10 item(s)") if value.size > 10
      end

      if value = @resource_types
        raise Core::ValidationError.new("resourceTypes must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("resourceTypes must have at most 10 item(s)") if value.size > 10
      end

      if value = @delivery_destination_types
        raise Core::ValidationError.new("deliveryDestinationTypes must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("deliveryDestinationTypes must have at most 4 item(s)") if value.size > 4
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@service, @log_types, @resource_types, @delivery_destination_types, @next_token, @limit)
  end
end
