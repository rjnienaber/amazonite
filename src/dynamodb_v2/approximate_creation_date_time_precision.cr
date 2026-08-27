private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum ApproximateCreationDateTimePrecision
    Millisecond
    Microsecond

    def self.to_json(e : ApproximateCreationDateTimePrecision, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ApproximateCreationDateTimePrecision::Millisecond then "MILLISECOND"
              when ADDB::ApproximateCreationDateTimePrecision::Microsecond then "MICROSECOND"
              else
                raise Exception.new("unknown enum value for 'ApproximateCreationDateTimePrecision' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ApproximateCreationDateTimePrecision
      value = pull.read_string
      case value
      when "MILLISECOND" then ADDB::ApproximateCreationDateTimePrecision::Millisecond
      when "MICROSECOND" then ADDB::ApproximateCreationDateTimePrecision::Microsecond
      else
        raise Exception.new("unknown enum value for 'ApproximateCreationDateTimePrecision' when deserializing from json: '#{value}'")
      end
    end
  end
end
