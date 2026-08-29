module Amazonite::SsmV1
  class CloudConnectorConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "AzureConfiguration")]
    property azure_configuration : AzureConfiguration | Nil

    def initialize(
      @azure_configuration : AzureConfiguration | Nil = nil,
    )
    end
  end
end
