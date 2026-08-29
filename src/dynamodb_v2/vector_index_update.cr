module Amazonite::DynamoDBV2
  class VectorIndexUpdate
    include JSON::Serializable

    @[JSON::Field(key: "Create")]
    property create : CreateVectorIndexAction | Nil

    @[JSON::Field(key: "Delete")]
    property delete : DeleteVectorIndexAction | Nil

    def initialize(
      @create : CreateVectorIndexAction | Nil = nil,
      @delete : DeleteVectorIndexAction | Nil = nil,
    )
    end
  end
end
