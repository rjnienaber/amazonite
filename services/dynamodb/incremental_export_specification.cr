private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Optional object containing the parameters specific to an incremental export.
  class IncrementalExportSpecification
    include JSON::Serializable

    # Time in the past which provides the inclusive start range for the export table's data, counted
    # in seconds from the start of the Unix epoch. The incremental export will reflect the table's
    # state including and after this point in time.
    @[JSON::Field(key: "ExportFromTime", converter: Core::AWSEpochConverter)]
    property export_from_time : Time | Nil

    # Time in the past which provides the exclusive end range for the export table's data, counted in
    # seconds from the start of the Unix epoch. The incremental export will reflect the table's state
    # just prior to this point in time. If this is not provided, the latest time with data available
    # will be used.
    @[JSON::Field(key: "ExportToTime", converter: Core::AWSEpochConverter)]
    property export_to_time : Time | Nil

    # The view type that was chosen for the export. Valid values are `NEW_AND_OLD_IMAGES` and
    # `NEW_IMAGES`. The default value is `NEW_AND_OLD_IMAGES`.
    #
    # `NEW_AND_OLD_IMAGES` exports both the new and old images of each changed item, while
    # `NEW_IMAGES` exports only the new (latest) image. The view type you choose determines the
    # structure of each item in the output for `insert`, `update`, and `delete` operations. For
    # details and examples of how each view type shapes the export output, see [DynamoDB table export
    # output
    # format](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/S3DataExport.Output.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ExportViewType", converter: ADDB::ExportViewType)]
    property export_view_type : ExportViewType | Nil

    def initialize(
      @export_from_time : Time | Nil = nil,
      @export_to_time : Time | Nil = nil,
      @export_view_type : ExportViewType | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@export_from_time, @export_to_time, @export_view_type)
  end
end
