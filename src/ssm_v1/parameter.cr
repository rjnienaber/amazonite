private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # An Amazon Web Services Systems Manager parameter in Parameter Store.
  class Parameter
    include JSON::Serializable

    # The name of the parameter.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The type of parameter. Valid values include the following: `String`, `StringList`, and
    # `SecureString`.
    #
    # If type is `StringList`, the system returns a comma-separated string with no spaces between
    # commas in the `Value` field.
    @[JSON::Field(key: "Type", converter: AS::ParameterType)]
    property type : ParameterType | Nil

    # The parameter value.
    #
    # If type is `StringList`, the system returns a comma-separated string with no spaces between
    # commas in the `Value` field.
    @[JSON::Field(key: "Value")]
    property value : String | Nil

    # The parameter version.
    @[JSON::Field(key: "Version")]
    property version : Int64 | Nil

    # Either the version number or the label used to retrieve the parameter value. Specify selectors
    # by using one of the following formats:
    #
    # parameter_name:version
    #
    # parameter_name:label
    @[JSON::Field(key: "Selector")]
    property selector : String | Nil

    # Applies to parameters that reference information in other Amazon Web Services services.
    # `SourceResult` is the raw result or response from the source.
    @[JSON::Field(key: "SourceResult")]
    property source_result : String | Nil

    # Date the parameter was last changed or updated and the parameter version was created.
    @[JSON::Field(key: "LastModifiedDate", converter: Core::AWSEpochConverter)]
    property last_modified_date : Time | Nil

    # The Amazon Resource Name (ARN) of the parameter.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The data type of the parameter, such as `text` or `aws:ec2:image`. The default is `text`.
    @[JSON::Field(key: "DataType")]
    property data_type : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @type : ParameterType | Nil = nil,
      @value : String | Nil = nil,
      @version : Int64 | Nil = nil,
      @selector : String | Nil = nil,
      @source_result : String | Nil = nil,
      @last_modified_date : Time | Nil = nil,
      @arn : String | Nil = nil,
      @data_type : String | Nil = nil,
    )
    end
  end
end
