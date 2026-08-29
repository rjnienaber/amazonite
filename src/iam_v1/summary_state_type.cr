private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum SummaryStateType
    Available
    NotAvailable
    NotSupported
    Failed

    def self.to_json(e : SummaryStateType, json : JSON::Builder) : Nil
      value = case e
              when AI::SummaryStateType::Available    then "AVAILABLE"
              when AI::SummaryStateType::NotAvailable then "NOT_AVAILABLE"
              when AI::SummaryStateType::NotSupported then "NOT_SUPPORTED"
              when AI::SummaryStateType::Failed       then "FAILED"
              else
                raise Exception.new("unknown enum value for 'SummaryStateType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::SummaryStateType
      value = pull.read_string
      case value
      when "AVAILABLE"     then AI::SummaryStateType::Available
      when "NOT_AVAILABLE" then AI::SummaryStateType::NotAvailable
      when "NOT_SUPPORTED" then AI::SummaryStateType::NotSupported
      when "FAILED"        then AI::SummaryStateType::Failed
      else
        raise Exception.new("unknown enum value for 'SummaryStateType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::SummaryStateType::Available    then "AVAILABLE"
      when AI::SummaryStateType::NotAvailable then "NOT_AVAILABLE"
      when AI::SummaryStateType::NotSupported then "NOT_SUPPORTED"
      when AI::SummaryStateType::Failed       then "FAILED"
      else
        raise Exception.new("unknown enum value for 'SummaryStateType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::SummaryStateType?
      case key
      when "AVAILABLE"     then AI::SummaryStateType::Available
      when "NOT_AVAILABLE" then AI::SummaryStateType::NotAvailable
      when "NOT_SUPPORTED" then AI::SummaryStateType::NotSupported
      when "FAILED"        then AI::SummaryStateType::Failed
      else
        nil
      end
    end
  end
end
