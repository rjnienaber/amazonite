private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # Request to create an ApiKey resource.
  class CreateApiKeyRequest
    include JSON::Serializable

    # The name of the ApiKey.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # The description of the ApiKey.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # Specifies whether the ApiKey can be used by callers.
    @[JSON::Field(key: "enabled")]
    property enabled : Bool | Nil

    # Specifies whether (`true`) or not (`false`) the key identifier is distinct from the created API
    # key value. This parameter is deprecated and should not be used.
    @[JSON::Field(key: "generateDistinctId")]
    property generate_distinct_id : Bool | Nil

    # Specifies a value of the API key.
    @[JSON::Field(key: "value")]
    property value : String | Nil

    # DEPRECATED FOR USAGE PLANS - Specifies stages associated with the API key.
    @[JSON::Field(key: "stageKeys")]
    property stage_keys : Array(StageKey) | Nil

    # An Amazon Web Services Marketplace customer identifier, when integrating with the Amazon Web
    # Services SaaS Marketplace.
    @[JSON::Field(key: "customerId")]
    property customer_id : String | Nil

    # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up
    # to 128 characters and must not start with `aws:`. The tag value can be up to 256 characters.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @enabled : Bool | Nil = nil,
      @generate_distinct_id : Bool | Nil = nil,
      @value : String | Nil = nil,
      @stage_keys : Array(StageKey) | Nil = nil,
      @customer_id : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stage_keys
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@name, @description, @enabled, @generate_distinct_id, @value, @stage_keys, @customer_id, @tags)
  end
end
