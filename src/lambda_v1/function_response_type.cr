private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum FunctionResponseType
    ReportBatchItemFailures

    def self.to_json(e : FunctionResponseType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::FunctionResponseType
      value = pull.read_string
      case value
      when "ReportBatchItemFailures" then AL::FunctionResponseType::ReportBatchItemFailures
      else
        raise Exception.new("unknown enum value for 'FunctionResponseType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::FunctionResponseType?
      case key
      when "ReportBatchItemFailures" then AL::FunctionResponseType::ReportBatchItemFailures
      else
        nil
      end
    end
  end
end
