private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum BulkOperationPerformanceTier
    Standard
    Accelerated

    def self.to_json(e : BulkOperationPerformanceTier, json : JSON::Builder) : Nil
      value = case e
              when ADDB::BulkOperationPerformanceTier::Standard    then "STANDARD"
              when ADDB::BulkOperationPerformanceTier::Accelerated then "ACCELERATED"
              else
                raise Exception.new("unknown enum value for 'BulkOperationPerformanceTier' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::BulkOperationPerformanceTier
      value = pull.read_string
      case value
      when "STANDARD"    then ADDB::BulkOperationPerformanceTier::Standard
      when "ACCELERATED" then ADDB::BulkOperationPerformanceTier::Accelerated
      else
        raise Exception.new("unknown enum value for 'BulkOperationPerformanceTier' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::BulkOperationPerformanceTier::Standard    then "STANDARD"
      when ADDB::BulkOperationPerformanceTier::Accelerated then "ACCELERATED"
      else
        raise Exception.new("unknown enum value for 'BulkOperationPerformanceTier' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::BulkOperationPerformanceTier?
      case key
      when "STANDARD"    then ADDB::BulkOperationPerformanceTier::Standard
      when "ACCELERATED" then ADDB::BulkOperationPerformanceTier::Accelerated
      else
        nil
      end
    end
  end
end
