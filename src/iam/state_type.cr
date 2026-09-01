private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum StateType
    Unassigned
    Assigned
    PendingApproval
    Finalized
    Accepted
    Rejected
    Expired

    def self.to_json(e : StateType, json : JSON::Builder) : Nil
      value = case e
              when AI::StateType::Unassigned      then "UNASSIGNED"
              when AI::StateType::Assigned        then "ASSIGNED"
              when AI::StateType::PendingApproval then "PENDING_APPROVAL"
              when AI::StateType::Finalized       then "FINALIZED"
              when AI::StateType::Accepted        then "ACCEPTED"
              when AI::StateType::Rejected        then "REJECTED"
              when AI::StateType::Expired         then "EXPIRED"
              else
                raise Exception.new("unknown enum value for 'StateType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::StateType
      value = pull.read_string
      case value
      when "UNASSIGNED"       then AI::StateType::Unassigned
      when "ASSIGNED"         then AI::StateType::Assigned
      when "PENDING_APPROVAL" then AI::StateType::PendingApproval
      when "FINALIZED"        then AI::StateType::Finalized
      when "ACCEPTED"         then AI::StateType::Accepted
      when "REJECTED"         then AI::StateType::Rejected
      when "EXPIRED"          then AI::StateType::Expired
      else
        raise Exception.new("unknown enum value for 'StateType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::StateType::Unassigned      then "UNASSIGNED"
      when AI::StateType::Assigned        then "ASSIGNED"
      when AI::StateType::PendingApproval then "PENDING_APPROVAL"
      when AI::StateType::Finalized       then "FINALIZED"
      when AI::StateType::Accepted        then "ACCEPTED"
      when AI::StateType::Rejected        then "REJECTED"
      when AI::StateType::Expired         then "EXPIRED"
      else
        raise Exception.new("unknown enum value for 'StateType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::StateType?
      case key
      when "UNASSIGNED"       then AI::StateType::Unassigned
      when "ASSIGNED"         then AI::StateType::Assigned
      when "PENDING_APPROVAL" then AI::StateType::PendingApproval
      when "FINALIZED"        then AI::StateType::Finalized
      when "ACCEPTED"         then AI::StateType::Accepted
      when "REJECTED"         then AI::StateType::Rejected
      when "EXPIRED"          then AI::StateType::Expired
      else
        nil
      end
    end
  end
end
