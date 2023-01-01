private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class AttachmentsSource
    include JSON::Serializable

    @[JSON::Field(key: "Key", converter: AS::AttachmentsSourceKey)]
    property key : AttachmentsSourceKey | Nil

    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @key : AttachmentsSourceKey | Nil = nil,
      @values : Array(String) | Nil = nil,
      @name : String | Nil = nil
    )
    end
  end
end
