private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class UpdateDocumentMetadataRequest
    include JSON::Serializable

    # The name of the change template for which a version's metadata is to be updated.
    @[JSON::Field(key: "Name")]
    property name : String

    # The version of a change template in which to update approval metadata.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The change template review details to update.
    @[JSON::Field(key: "DocumentReviews")]
    property document_reviews : DocumentReviews

    def initialize(
      @name : String,
      @document_reviews : DocumentReviews,
      @document_version : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @document_reviews
        value.validate!
      end
    end

    def_equals_and_hash(@name, @document_version, @document_reviews)
  end
end
