private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # A structure that includes attributes that describe a document attachment.
  class AttachmentContent
    include JSON::Serializable

    # The name of an attachment.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The size of an attachment in bytes.
    @[JSON::Field(key: "Size")]
    property size : Int64 | Nil

    # The cryptographic hash value of the document content.
    @[JSON::Field(key: "Hash")]
    property hash : String | Nil

    # The hash algorithm used to calculate the hash value.
    @[JSON::Field(key: "HashType", converter: AS::AttachmentHashType)]
    property hash_type : AttachmentHashType | Nil

    # The URL location of the attachment content.
    @[JSON::Field(key: "Url")]
    property url : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @size : Int64 | Nil = nil,
      @hash : String | Nil = nil,
      @hash_type : AttachmentHashType | Nil = nil,
      @url : String | Nil = nil,
    )
    end
  end
end
