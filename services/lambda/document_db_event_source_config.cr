private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @database_name
        raise Core::ValidationError.new("DatabaseName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DatabaseName length must be <= 63") if value.size > 63
        raise Core::ValidationError.new("DatabaseName does not match the required pattern") unless value.matches?(Regex.new("^[^ /\\.$\\x22]*$"))
      end

      if value = @collection_name
        raise Core::ValidationError.new("CollectionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CollectionName length must be <= 57") if value.size > 57
        raise Core::ValidationError.new("CollectionName does not match the required pattern") unless value.matches?(Regex.new("^(^(?!(system\\x2e)))(^[_a-zA-Z0-9])([^$]*)$"))
      end
    end

    def_equals_and_hash(@database_name, @collection_name, @full_document)
  end
end
