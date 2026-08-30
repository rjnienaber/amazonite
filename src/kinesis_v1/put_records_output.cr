private alias AK = Amazonite::KinesisV1

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
  end
end
