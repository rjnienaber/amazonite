module Amazonite::SsmV1
  # The configuration that provides access details and targets for connecting to a third-party cloud
  # environment.
  class CloudConnectorConfiguration
    include JSON::Serializable

    # The access details and targets for connecting to a Microsoft Azure environment.
    @[JSON::Field(key: "AzureConfiguration")]
    property azure_configuration : AzureConfiguration | Nil

    def initialize(
      @azure_configuration : AzureConfiguration | Nil = nil,
    )
    end

    def_equals_and_hash(@azure_configuration)
  end
end
