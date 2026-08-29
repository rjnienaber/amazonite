private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum PolicyEvaluationDecisionType
    Allowed
    ExplicitDeny
    ImplicitDeny

    def self.to_json(e : PolicyEvaluationDecisionType, json : JSON::Builder) : Nil
      value = case e
              when AI::PolicyEvaluationDecisionType::Allowed      then "allowed"
              when AI::PolicyEvaluationDecisionType::ExplicitDeny then "explicitDeny"
              when AI::PolicyEvaluationDecisionType::ImplicitDeny then "implicitDeny"
              else
                raise Exception.new("unknown enum value for 'PolicyEvaluationDecisionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::PolicyEvaluationDecisionType
      value = pull.read_string
      case value
      when "allowed"      then AI::PolicyEvaluationDecisionType::Allowed
      when "explicitDeny" then AI::PolicyEvaluationDecisionType::ExplicitDeny
      when "implicitDeny" then AI::PolicyEvaluationDecisionType::ImplicitDeny
      else
        raise Exception.new("unknown enum value for 'PolicyEvaluationDecisionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::PolicyEvaluationDecisionType::Allowed      then "allowed"
      when AI::PolicyEvaluationDecisionType::ExplicitDeny then "explicitDeny"
      when AI::PolicyEvaluationDecisionType::ImplicitDeny then "implicitDeny"
      else
        raise Exception.new("unknown enum value for 'PolicyEvaluationDecisionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::PolicyEvaluationDecisionType?
      case key
      when "allowed"      then AI::PolicyEvaluationDecisionType::Allowed
      when "explicitDeny" then AI::PolicyEvaluationDecisionType::ExplicitDeny
      when "implicitDeny" then AI::PolicyEvaluationDecisionType::ImplicitDeny
      else
        nil
      end
    end
  end
end
