private alias AK = Amazonite::KinesisV1
private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # `PutRecords` results.
  class PutRecordsOutput
    include JSON::Serializable

    # The number of unsuccessfully processed records in a `PutRecords` request.
    @[JSON::Field(key: "FailedRecordCount")]
    property failed_record_count : Int32 | Nil

    # An array of successfully and unsuccessfully processed record results. A record that is
    # successfully added to a stream includes `SequenceNumber` and `ShardId` in the result. A record
    # that fails to be added to a stream includes `ErrorCode` and `ErrorMessage` in the result.
    @[JSON::Field(key: "Records")]
    property records : Array(PutRecordsResultEntry) = [] of PutRecordsResultEntry

    # The encryption type used on the records. This parameter can be one of the following values:
    #
    # - `NONE`: Do not encrypt the records.
    #
    # - `KMS`: Use server-side encryption on the records using a customer-managed Amazon Web Services
    # KMS key.
    @[JSON::Field(key: "EncryptionType", converter: AK::EncryptionType)]
    property encryption_type : EncryptionType | Nil

    def initialize(
      @records : Array(PutRecordsResultEntry),
      @failed_record_count : Int32 | Nil = nil,
      @encryption_type : EncryptionType | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @failed_record_count
        raise Core::ValidationError.new("FailedRecordCount value must be >= 1") if value < 1
      end

      if value = @records
        raise Core::ValidationError.new("Records must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Records must have at most 500 item(s)") if value.size > 500
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@failed_record_count, @records, @encryption_type)
  end
end
