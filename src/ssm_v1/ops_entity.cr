module Amazonite::SsmV1
  class OpsEntity
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String | Nil

    @[JSON::Field(key: "Data")]
    property data : Hash(String, OpsEntityItem) | Nil

    def initialize(
      @id : String | Nil = nil,
      @data : Hash(String, OpsEntityItem) | Nil = nil
    )
    end
  end
end
