module Amazonite::CloudWatchLogsV1
  # This structure contains the information about one processor in a log transformer.
  class Processor
    include JSON::Serializable

    # Use this parameter to include the [
    # addKeys](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-addKeys)
    # processor in your transformer.
    @[JSON::Field(key: "addKeys")]
    property add_keys : AddKeys | Nil

    # Use this parameter to include the [
    # copyValue](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-copyValue)
    # processor in your transformer.
    @[JSON::Field(key: "copyValue")]
    property copy_value : CopyValue | Nil

    # Use this parameter to include the [
    # CSV](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-CSV)
    # processor in your transformer.
    @[JSON::Field(key: "csv")]
    property csv : CSV | Nil

    # Use this parameter to include the [
    # datetimeConverter](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-datetimeConverter)
    # processor in your transformer.
    @[JSON::Field(key: "dateTimeConverter")]
    property date_time_converter : DateTimeConverter | Nil

    # Use this parameter to include the [
    # deleteKeys](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-deleteKeys)
    # processor in your transformer.
    @[JSON::Field(key: "deleteKeys")]
    property delete_keys : DeleteKeys | Nil

    # Use this parameter to include the [
    # grok](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-grok)
    # processor in your transformer.
    @[JSON::Field(key: "grok")]
    property grok : Grok | Nil

    # Use this parameter to include the [
    # listToMap](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-listToMap)
    # processor in your transformer.
    @[JSON::Field(key: "listToMap")]
    property list_to_map : ListToMap | Nil

    # Use this parameter to include the [
    # lowerCaseString](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-lowerCaseString)
    # processor in your transformer.
    @[JSON::Field(key: "lowerCaseString")]
    property lower_case_string : LowerCaseString | Nil

    # Use this parameter to include the [
    # moveKeys](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-moveKeys)
    # processor in your transformer.
    @[JSON::Field(key: "moveKeys")]
    property move_keys : MoveKeys | Nil

    # Use this parameter to include the [
    # parseCloudfront](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseCloudfront)
    # processor in your transformer.
    #
    # If you use this processor, it must be the first processor in your transformer.
    @[JSON::Field(key: "parseCloudfront")]
    property parse_cloudfront : ParseCloudfront | Nil

    # Use this parameter to include the [
    # parseJSON](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseJSON)
    # processor in your transformer.
    @[JSON::Field(key: "parseJSON")]
    property parsejson : ParseJSON | Nil

    # Use this parameter to include the [
    # parseKeyValue](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseKeyValue)
    # processor in your transformer.
    @[JSON::Field(key: "parseKeyValue")]
    property parse_key_value : ParseKeyValue | Nil

    # Use this parameter to include the [
    # parseRoute53](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseRoute53)
    # processor in your transformer.
    #
    # If you use this processor, it must be the first processor in your transformer.
    @[JSON::Field(key: "parseRoute53")]
    property parse_route_53 : ParseRoute53 | Nil

    # Use this parameter to convert logs into Open Cybersecurity Schema (OCSF) format.
    @[JSON::Field(key: "parseToOCSF")]
    property parse_to_ocsf : ParseToOCSF | Nil

    # Use this parameter to include the [
    # parsePostGres](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parsePostGres)
    # processor in your transformer.
    #
    # If you use this processor, it must be the first processor in your transformer.
    @[JSON::Field(key: "parsePostgres")]
    property parse_postgres : ParsePostgres | Nil

    # Use this parameter to include the [
    # parseVPC](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseVPC)
    # processor in your transformer.
    #
    # If you use this processor, it must be the first processor in your transformer.
    @[JSON::Field(key: "parseVPC")]
    property parsevpc : ParseVPC | Nil

    # Use this parameter to include the [
    # parseWAF](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseWAF)
    # processor in your transformer.
    #
    # If you use this processor, it must be the first processor in your transformer.
    @[JSON::Field(key: "parseWAF")]
    property parsewaf : ParseWAF | Nil

    # Use this parameter to include the [
    # renameKeys](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-renameKeys)
    # processor in your transformer.
    @[JSON::Field(key: "renameKeys")]
    property rename_keys : RenameKeys | Nil

    # Use this parameter to include the [
    # splitString](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-splitString)
    # processor in your transformer.
    @[JSON::Field(key: "splitString")]
    property split_string : SplitString | Nil

    # Use this parameter to include the [
    # substituteString](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-substituteString)
    # processor in your transformer.
    @[JSON::Field(key: "substituteString")]
    property substitute_string : SubstituteString | Nil

    # Use this parameter to include the [
    # trimString](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-trimString)
    # processor in your transformer.
    @[JSON::Field(key: "trimString")]
    property trim_string : TrimString | Nil

    # Use this parameter to include the [
    # typeConverter](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-typeConverter)
    # processor in your transformer.
    @[JSON::Field(key: "typeConverter")]
    property type_converter : TypeConverter | Nil

    # Use this parameter to include the [
    # upperCaseString](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-upperCaseString)
    # processor in your transformer.
    @[JSON::Field(key: "upperCaseString")]
    property upper_case_string : UpperCaseString | Nil

    def initialize(
      @add_keys : AddKeys | Nil = nil,
      @copy_value : CopyValue | Nil = nil,
      @csv : CSV | Nil = nil,
      @date_time_converter : DateTimeConverter | Nil = nil,
      @delete_keys : DeleteKeys | Nil = nil,
      @grok : Grok | Nil = nil,
      @list_to_map : ListToMap | Nil = nil,
      @lower_case_string : LowerCaseString | Nil = nil,
      @move_keys : MoveKeys | Nil = nil,
      @parse_cloudfront : ParseCloudfront | Nil = nil,
      @parsejson : ParseJSON | Nil = nil,
      @parse_key_value : ParseKeyValue | Nil = nil,
      @parse_route_53 : ParseRoute53 | Nil = nil,
      @parse_to_ocsf : ParseToOCSF | Nil = nil,
      @parse_postgres : ParsePostgres | Nil = nil,
      @parsevpc : ParseVPC | Nil = nil,
      @parsewaf : ParseWAF | Nil = nil,
      @rename_keys : RenameKeys | Nil = nil,
      @split_string : SplitString | Nil = nil,
      @substitute_string : SubstituteString | Nil = nil,
      @trim_string : TrimString | Nil = nil,
      @type_converter : TypeConverter | Nil = nil,
      @upper_case_string : UpperCaseString | Nil = nil,
    )
    end

    def_equals_and_hash(@add_keys, @copy_value, @csv, @date_time_converter, @delete_keys, @grok, @list_to_map, @lower_case_string, @move_keys, @parse_cloudfront, @parsejson, @parse_key_value, @parse_route_53, @parse_to_ocsf, @parse_postgres, @parsevpc, @parsewaf, @rename_keys, @split_string, @substitute_string, @trim_string, @type_converter, @upper_case_string)
  end
end
