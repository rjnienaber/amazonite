private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # A resource that can be distributed to callers for executing Method resources that require an API
  # key. API keys can be mapped to any Stage on any RestApi, which indicates that the callers with
  # the API key can make requests to that stage.
  class ApiKey
    include JSON::Serializable

    # The identifier of the API Key.
    @[JSON::Field(key: "id")]
    property id : String | Nil

    # The value of the API Key.
    @[JSON::Field(key: "value")]
    property value : String | Nil

    # The name of the API Key.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # An Amazon Web Services Marketplace customer identifier, when integrating with the Amazon Web
    # Services SaaS Marketplace.
    @[JSON::Field(key: "customerId")]
    property customer_id : String | Nil

    # The description of the API Key.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # Specifies whether the API Key can be used by callers.
    @[JSON::Field(key: "enabled")]
    property enabled : Bool | Nil

    # The timestamp when the API Key was created.
    @[JSON::Field(key: "createdDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # The timestamp when the API Key was last updated.
    @[JSON::Field(key: "lastUpdatedDate", converter: Core::AWSEpochConverter)]
    property last_updated_date : Time | Nil

    # A list of Stage resources that are associated with the ApiKey resource.
    @[JSON::Field(key: "stageKeys")]
    property stage_keys : Array(String) | Nil

    # The collection of tags. Each tag element is associated with a given resource.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @id : String | Nil = nil,
      @value : String | Nil = nil,
      @name : String | Nil = nil,
      @customer_id : String | Nil = nil,
      @description : String | Nil = nil,
      @enabled : Bool | Nil = nil,
      @created_date : Time | Nil = nil,
      @last_updated_date : Time | Nil = nil,
      @stage_keys : Array(String) | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @value, @name, @customer_id, @description, @enabled, @created_date, @last_updated_date, @stage_keys, @tags)
  end
end
