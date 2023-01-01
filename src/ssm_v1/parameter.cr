private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class Parameter
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Type", converter: AS::ParameterType)]
    property type : ParameterType | Nil

    @[JSON::Field(key: "Value")]
    property value : String | Nil

    @[JSON::Field(key: "Version")]
    property version : Int64 | Nil

    @[JSON::Field(key: "Selector")]
    property selector : String | Nil

    @[JSON::Field(key: "SourceResult")]
    property source_result : String | Nil

    @[JSON::Field(key: "LastModifiedDate", converter: Core::AWSEpochConverter)]
    property last_modified_date : Time | Nil

    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

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
      @data_type : String | Nil = nil
    )
    end
  end
end
