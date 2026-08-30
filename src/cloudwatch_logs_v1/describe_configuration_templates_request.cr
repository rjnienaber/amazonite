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
  end
end
