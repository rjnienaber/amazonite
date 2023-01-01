private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class AttachmentContent
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Size")]
    property size : Int64 | Nil

    @[JSON::Field(key: "Hash")]
    property hash : String | Nil

    @[JSON::Field(key: "HashType", converter: AS::AttachmentHashType)]
    property hash_type : AttachmentHashType | Nil

    @[JSON::Field(key: "Url")]
    property url : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @size : Int64 | Nil = nil,
      @hash : String | Nil = nil,
      @hash_type : AttachmentHashType | Nil = nil,
      @url : String | Nil = nil
    )
    end
  end
end
