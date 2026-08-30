private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class ListDocumentMetadataHistoryResponse
    include JSON::Serializable

    # The name of the change template.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The version of the change template.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # The user ID of the person in the organization who requested the review of the change template.
    @[JSON::Field(key: "Author")]
    property author : String | Nil

    # Information about the response to the change template approval request.
    @[JSON::Field(key: "Metadata")]
    property metadata : DocumentMetadataResponseInfo | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @document_version : String | Nil = nil,
      @author : String | Nil = nil,
      @metadata : DocumentMetadataResponseInfo | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @metadata
        value.validate!
      end
    end

    def_equals_and_hash(@name, @document_version, @author, @metadata, @next_token)
  end
end
