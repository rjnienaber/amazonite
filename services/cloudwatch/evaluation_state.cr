private alias ACW = Amazonite::CloudWatch

module Amazonite::CloudWatch
  enum EvaluationState
    PartialData
    EvaluationFailure
    EvaluationError

    def self.to_json(e : EvaluationState, json : JSON::Builder) : Nil
      value = case e
              when ACW::EvaluationState::PartialData       then "PARTIAL_DATA"
              when ACW::EvaluationState::EvaluationFailure then "EVALUATION_FAILURE"
              when ACW::EvaluationState::EvaluationError   then "EVALUATION_ERROR"
              else
                raise Exception.new("unknown enum value for 'EvaluationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::EvaluationState
      value = pull.read_string
      case value
      when "PARTIAL_DATA"       then ACW::EvaluationState::PartialData
      when "EVALUATION_FAILURE" then ACW::EvaluationState::EvaluationFailure
      when "EVALUATION_ERROR"   then ACW::EvaluationState::EvaluationError
      else
        raise Exception.new("unknown enum value for 'EvaluationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACW::EvaluationState::PartialData       then "PARTIAL_DATA"
      when ACW::EvaluationState::EvaluationFailure then "EVALUATION_FAILURE"
      when ACW::EvaluationState::EvaluationError   then "EVALUATION_ERROR"
      else
        raise Exception.new("unknown enum value for 'EvaluationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACW::EvaluationState?
      case key
      when "PARTIAL_DATA"       then ACW::EvaluationState::PartialData
      when "EVALUATION_FAILURE" then ACW::EvaluationState::EvaluationFailure
      when "EVALUATION_ERROR"   then ACW::EvaluationState::EvaluationError
      else
        nil
      end
    end
  end
end
