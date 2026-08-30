module Amazonite::DynamoDBV2
  # Represents one of the following:
  #
  # - A new global secondary index to be added to an existing table.
  #
  # - New provisioned throughput parameters for an existing global secondary index.
  #
  # - An existing global secondary index to be removed from an existing table.
  class GlobalSecondaryIndexUpdate
    include JSON::Serializable

    # The name of an existing global secondary index, along with new provisioned throughput settings
    # to be applied to that index.
    @[JSON::Field(key: "Update")]
    property update : UpdateGlobalSecondaryIndexAction | Nil

    # The parameters required for creating a global secondary index on an existing table:
    #
    # - `IndexName `
    #
    # - `KeySchema `
    #
    # - `AttributeDefinitions `
    #
    # - `Projection `
    #
    # - `ProvisionedThroughput `
    @[JSON::Field(key: "Create")]
    property create : CreateGlobalSecondaryIndexAction | Nil

    # The name of an existing global secondary index to be removed.
    @[JSON::Field(key: "Delete")]
    property delete : DeleteGlobalSecondaryIndexAction | Nil

    def initialize(
      @update : UpdateGlobalSecondaryIndexAction | Nil = nil,
      @create : CreateGlobalSecondaryIndexAction | Nil = nil,
      @delete : DeleteGlobalSecondaryIndexAction | Nil = nil,
    )
    end

    def_equals_and_hash(@update, @create, @delete)
  end
end
