private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class DocumentDBEventSourceConfig
    include JSON::Serializable

    @[JSON::Field(key: "DatabaseName")]
    property database_name : String | Nil

    @[JSON::Field(key: "CollectionName")]
    property collection_name : String | Nil

    @[JSON::Field(key: "FullDocument", converter: AL::FullDocument)]
    property full_document : FullDocument | Nil

    def initialize(
      @database_name : String | Nil = nil,
      @collection_name : String | Nil = nil,
      @full_document : FullDocument | Nil = nil,
    )
    end
  end
end
