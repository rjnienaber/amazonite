module Amazonite::SsmV1
  # Metadata that you assign to your Amazon Web Services resources. Tags enable you to categorize
  # your resources in different ways, for example, by purpose, owner, or environment. In Amazon Web
  # Services Systems Manager, you can apply tags to Systems Manager documents (SSM documents),
  # managed nodes, maintenance windows, parameters, patch baselines, OpsItems, and OpsMetadata.
  class Tag
    include JSON::Serializable

    # The name of the tag.
    @[JSON::Field(key: "Key")]
    property key : String

    # The value of the tag.
    @[JSON::Field(key: "Value")]
    property value : String

    def initialize(
      @key : String,
      @value : String,
    )
    end
  end
end
