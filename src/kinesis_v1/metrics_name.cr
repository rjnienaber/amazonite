private alias AK = Amazonite::KinesisV1

module Amazonite::KinesisV1
  enum MetricsName
    IncomingBytes
    IncomingRecords
    OutgoingBytes
    OutgoingRecords
    WriteProvisionedThroughputExceeded
    ReadProvisionedThroughputExceeded
    IteratorAgeMilliseconds
    All

    def self.to_json(e : MetricsName, json : JSON::Builder) : Nil
      value = case e
              when AK::MetricsName::IncomingBytes                      then "IncomingBytes"
              when AK::MetricsName::IncomingRecords                    then "IncomingRecords"
              when AK::MetricsName::OutgoingBytes                      then "OutgoingBytes"
              when AK::MetricsName::OutgoingRecords                    then "OutgoingRecords"
              when AK::MetricsName::WriteProvisionedThroughputExceeded then "WriteProvisionedThroughputExceeded"
              when AK::MetricsName::ReadProvisionedThroughputExceeded  then "ReadProvisionedThroughputExceeded"
              when AK::MetricsName::IteratorAgeMilliseconds            then "IteratorAgeMilliseconds"
              when AK::MetricsName::All                                then "ALL"
              else
                raise Exception.new("unknown enum value for 'MetricsName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::MetricsName
      value = pull.read_string
      case value
      when "IncomingBytes"                      then AK::MetricsName::IncomingBytes
      when "IncomingRecords"                    then AK::MetricsName::IncomingRecords
      when "OutgoingBytes"                      then AK::MetricsName::OutgoingBytes
      when "OutgoingRecords"                    then AK::MetricsName::OutgoingRecords
      when "WriteProvisionedThroughputExceeded" then AK::MetricsName::WriteProvisionedThroughputExceeded
      when "ReadProvisionedThroughputExceeded"  then AK::MetricsName::ReadProvisionedThroughputExceeded
      when "IteratorAgeMilliseconds"            then AK::MetricsName::IteratorAgeMilliseconds
      when "ALL"                                then AK::MetricsName::All
      else
        raise Exception.new("unknown enum value for 'MetricsName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::MetricsName::IncomingBytes                      then "IncomingBytes"
      when AK::MetricsName::IncomingRecords                    then "IncomingRecords"
      when AK::MetricsName::OutgoingBytes                      then "OutgoingBytes"
      when AK::MetricsName::OutgoingRecords                    then "OutgoingRecords"
      when AK::MetricsName::WriteProvisionedThroughputExceeded then "WriteProvisionedThroughputExceeded"
      when AK::MetricsName::ReadProvisionedThroughputExceeded  then "ReadProvisionedThroughputExceeded"
      when AK::MetricsName::IteratorAgeMilliseconds            then "IteratorAgeMilliseconds"
      when AK::MetricsName::All                                then "ALL"
      else
        raise Exception.new("unknown enum value for 'MetricsName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::MetricsName?
      case key
      when "IncomingBytes"                      then AK::MetricsName::IncomingBytes
      when "IncomingRecords"                    then AK::MetricsName::IncomingRecords
      when "OutgoingBytes"                      then AK::MetricsName::OutgoingBytes
      when "OutgoingRecords"                    then AK::MetricsName::OutgoingRecords
      when "WriteProvisionedThroughputExceeded" then AK::MetricsName::WriteProvisionedThroughputExceeded
      when "ReadProvisionedThroughputExceeded"  then AK::MetricsName::ReadProvisionedThroughputExceeded
      when "IteratorAgeMilliseconds"            then AK::MetricsName::IteratorAgeMilliseconds
      when "ALL"                                then AK::MetricsName::All
      else
        nil
      end
    end
  end
end
