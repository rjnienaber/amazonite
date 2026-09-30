private alias Core = Amazonite::Core

module Amazonite::Ssm
  # The result of the query.
  class OpsEntity
    include JSON::Serializable

    # The query ID.
    @[JSON::Field(key: "Id")]
    property id : String | Nil

    # The data returned by the query.
    @[JSON::Field(key: "Data")]
    property data : Hash(String, OpsEntityItem) | Nil

    def initialize(
      @id : String | Nil = nil,
      @data : Hash(String, OpsEntityItem) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @data
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@id, @data)
  end
end
