module Amazonite::ApiGatewayV1
  # A configuration property of an SDK type.
  class SdkConfigurationProperty
    include JSON::Serializable

    # The name of a an SdkType configuration property.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # The user-friendly name of an SdkType configuration property.
    @[JSON::Field(key: "friendlyName")]
    property friendly_name : String | Nil

    # The description of an SdkType configuration property.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # A boolean flag of an SdkType configuration property to indicate if the associated SDK
    # configuration property is required (`true`) or not (`false`).
    @[JSON::Field(key: "required")]
    property required : Bool | Nil

    # The default value of an SdkType configuration property.
    @[JSON::Field(key: "defaultValue")]
    property default_value : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @friendly_name : String | Nil = nil,
      @description : String | Nil = nil,
      @required : Bool | Nil = nil,
      @default_value : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@name, @friendly_name, @description, @required, @default_value)
  end
end
