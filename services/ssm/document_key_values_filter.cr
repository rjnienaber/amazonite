private alias Core = Amazonite::Core

module Amazonite::Ssm
  # One or more filters. Use a filter to return a more specific list of documents.
  #
  # For keys, you can specify one or more tags that have been applied to a document.
  #
  # You can also use Amazon Web Services-provided keys, some of which have specific allowed values.
  # These keys and their associated values are as follows:
  #
  # DocumentType
  #
  # - `ApplicationConfiguration`
  #
  # - `ApplicationConfigurationSchema`
  #
  # - `Automation`
  #
  # - `ChangeCalendar`
  #
  # - `Command`
  #
  # - `Package`
  #
  # - `Policy`
  #
  # - `Session`
  #
  # Owner Note that only one `Owner` can be specified in a request. For example:
  # `Key=Owner,Values=Self`.
  #
  # - `Amazon`
  #
  # - `Private`
  #
  # - `Public`
  #
  # - `Self`
  #
  # - `ThirdParty`
  #
  # PlatformTypes
  #
  # - `Linux`
  #
  # - `Windows`
  #
  # `Name` is another Amazon Web Services-provided key. If you use `Name` as a key, you can use a
  # name prefix to return a list of documents. For example, in the Amazon Web Services CLI, to
  # return a list of all documents that begin with `Te`, run the following command:
  #
  # `aws ssm list-documents --filters Key=Name,Values=Te`
  #
  # You can also use the `TargetType` Amazon Web Services-provided key. For a list of valid resource
  # type values that can be used with this key, see [Amazon Web Services resource and property types
  # reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
  # in the *CloudFormation User Guide*.
  #
  # If you specify more than two keys, only documents that are identified by all the tags are
  # returned in the results. If you specify more than two values for a key, documents that are
  # identified by any of the values are returned in the results.
  #
  # To specify a custom key-value pair, use the format `Key=tag:tagName,Values=valueName`.
  #
  # For example, if you created a key called region and are using the Amazon Web Services CLI to
  # call the `list-documents` command:
  #
  # `aws ssm list-documents --filters Key=tag:region,Values=east,west Key=Owner,Values=Self`
  class DocumentKeyValuesFilter
    include JSON::Serializable

    # The name of the filter key.
    @[JSON::Field(key: "Key")]
    property key : String | Nil

    # The value for the filter key.
    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    def initialize(
      @key : String | Nil = nil,
      @values : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@key, @values)
  end
end
