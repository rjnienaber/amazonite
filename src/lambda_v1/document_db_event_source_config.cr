private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # Specific configuration settings for a DocumentDB event source.
  class DocumentDBEventSourceConfig
    include JSON::Serializable

    # The name of the database to consume within the DocumentDB cluster.
    @[JSON::Field(key: "DatabaseName")]
    property database_name : String | Nil

    # The name of the collection to consume within the database. If you do not specify a collection,
    # Lambda consumes all collections.
    @[JSON::Field(key: "CollectionName")]
    property collection_name : String | Nil

    # Determines what DocumentDB sends to your event stream during document update operations. If set
    # to UpdateLookup, DocumentDB sends a delta describing the changes, along with a copy of the
    # entire document. Otherwise, DocumentDB sends only a partial document that contains the changes.
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
