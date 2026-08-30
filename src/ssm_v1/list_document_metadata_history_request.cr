private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class ListDocumentMetadataHistoryRequest
    include JSON::Serializable

    # The name of the change template.
    @[JSON::Field(key: "Name")]
    property name : String

    # The version of the change template.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The type of data for which details are being requested. Currently, the only supported value is
    # `DocumentReviews`.
    @[JSON::Field(key: "Metadata", converter: AS::DocumentMetadataEnum)]
    property metadata : DocumentMetadataEnum

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @name : String,
      @metadata : DocumentMetadataEnum,
      @document_version : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@name, @document_version, @metadata, @next_token, @max_results)
  end
end
