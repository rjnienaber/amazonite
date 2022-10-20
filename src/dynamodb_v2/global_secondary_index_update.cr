module Amazonite::DynamoDBv2
  class GlobalSecondaryIndexUpdate
    include JSON::Serializable

    @[JSON::Field(key: "Update")]
    property update : UpdateGlobalSecondaryIndexAction | Nil

    @[JSON::Field(key: "Create")]
    property create : CreateGlobalSecondaryIndexAction | Nil

    @[JSON::Field(key: "Delete")]
    property delete : DeleteGlobalSecondaryIndexAction | Nil

    def initialize(
      @update : UpdateGlobalSecondaryIndexAction | Nil = nil,
      @create : CreateGlobalSecondaryIndexAction | Nil = nil,
      @delete : DeleteGlobalSecondaryIndexAction | Nil = nil
    )
    end
  end
end
