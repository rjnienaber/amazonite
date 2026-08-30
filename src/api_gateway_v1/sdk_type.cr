private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # A type of SDK that API Gateway can generate.
  class SdkType
    include JSON::Serializable

    # The identifier of an SdkType instance.
    @[JSON::Field(key: "id")]
    property id : String | Nil

    # The user-friendly name of an SdkType instance.
    @[JSON::Field(key: "friendlyName")]
    property friendly_name : String | Nil

    # The description of an SdkType.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # A list of configuration properties of an SdkType.
    @[JSON::Field(key: "configurationProperties")]
    property configuration_properties : Array(SdkConfigurationProperty) | Nil

    def initialize(
      @id : String | Nil = nil,
      @friendly_name : String | Nil = nil,
      @description : String | Nil = nil,
      @configuration_properties : Array(SdkConfigurationProperty) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @configuration_properties
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@id, @friendly_name, @description, @configuration_properties)
  end
end
