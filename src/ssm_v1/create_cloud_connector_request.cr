module Amazonite::SsmV1
  class CreateCloudConnectorRequest
    include JSON::Serializable

    @[JSON::Field(key: "DisplayName")]
    property display_name : String

    @[JSON::Field(key: "RoleArn")]
    property role_arn : String

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "Configuration")]
    property configuration : CloudConnectorConfiguration

    @[JSON::Field(key: "ConfigConnectorArn")]
    property config_connector_arn : String

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @display_name : String,
      @role_arn : String,
      @configuration : CloudConnectorConfiguration,
      @config_connector_arn : String,
      @description : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end
  end
end
