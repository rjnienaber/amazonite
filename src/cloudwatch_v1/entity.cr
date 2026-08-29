module Amazonite::CloudWatchV1
  class Entity
    include JSON::Serializable

    @[JSON::Field(key: "KeyAttributes")]
    property key_attributes : Hash(String, String) | Nil

    @[JSON::Field(key: "Attributes")]
    property attributes : Hash(String, String) | Nil

    def initialize(
      @key_attributes : Hash(String, String) | Nil = nil,
      @attributes : Hash(String, String) | Nil = nil,
    )
    end
  end
end
