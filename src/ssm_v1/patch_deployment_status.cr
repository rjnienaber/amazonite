private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum PatchDeploymentStatus
    Approved
    PendingApproval
    ExplicitApproved
    ExplicitRejected

    def self.to_json(e : PatchDeploymentStatus, json : JSON::Builder) : Nil
      value = case e
              when AS::PatchDeploymentStatus::Approved         then "APPROVED"
              when AS::PatchDeploymentStatus::PendingApproval  then "PENDING_APPROVAL"
              when AS::PatchDeploymentStatus::ExplicitApproved then "EXPLICIT_APPROVED"
              when AS::PatchDeploymentStatus::ExplicitRejected then "EXPLICIT_REJECTED"
              else
                raise Exception.new("unknown enum value for 'PatchDeploymentStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::PatchDeploymentStatus
      value = pull.read_string
      case value
      when "APPROVED"          then AS::PatchDeploymentStatus::Approved
      when "PENDING_APPROVAL"  then AS::PatchDeploymentStatus::PendingApproval
      when "EXPLICIT_APPROVED" then AS::PatchDeploymentStatus::ExplicitApproved
      when "EXPLICIT_REJECTED" then AS::PatchDeploymentStatus::ExplicitRejected
      else
        raise Exception.new("unknown enum value for 'PatchDeploymentStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
