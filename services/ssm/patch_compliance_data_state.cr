private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum PatchComplianceDataState
    Installed
    InstalledOther
    InstalledPendingReboot
    InstalledRejected
    Missing
    NotApplicable
    Failed
    AvailableSecurityUpdate

    def self.to_json(e : PatchComplianceDataState, json : JSON::Builder) : Nil
      value = case e
              when AS::PatchComplianceDataState::Installed               then "INSTALLED"
              when AS::PatchComplianceDataState::InstalledOther          then "INSTALLED_OTHER"
              when AS::PatchComplianceDataState::InstalledPendingReboot  then "INSTALLED_PENDING_REBOOT"
              when AS::PatchComplianceDataState::InstalledRejected       then "INSTALLED_REJECTED"
              when AS::PatchComplianceDataState::Missing                 then "MISSING"
              when AS::PatchComplianceDataState::NotApplicable           then "NOT_APPLICABLE"
              when AS::PatchComplianceDataState::Failed                  then "FAILED"
              when AS::PatchComplianceDataState::AvailableSecurityUpdate then "AVAILABLE_SECURITY_UPDATE"
              else
                raise Exception.new("unknown enum value for 'PatchComplianceDataState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::PatchComplianceDataState
      value = pull.read_string
      case value
      when "INSTALLED"                 then AS::PatchComplianceDataState::Installed
      when "INSTALLED_OTHER"           then AS::PatchComplianceDataState::InstalledOther
      when "INSTALLED_PENDING_REBOOT"  then AS::PatchComplianceDataState::InstalledPendingReboot
      when "INSTALLED_REJECTED"        then AS::PatchComplianceDataState::InstalledRejected
      when "MISSING"                   then AS::PatchComplianceDataState::Missing
      when "NOT_APPLICABLE"            then AS::PatchComplianceDataState::NotApplicable
      when "FAILED"                    then AS::PatchComplianceDataState::Failed
      when "AVAILABLE_SECURITY_UPDATE" then AS::PatchComplianceDataState::AvailableSecurityUpdate
      else
        raise Exception.new("unknown enum value for 'PatchComplianceDataState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::PatchComplianceDataState::Installed               then "INSTALLED"
      when AS::PatchComplianceDataState::InstalledOther          then "INSTALLED_OTHER"
      when AS::PatchComplianceDataState::InstalledPendingReboot  then "INSTALLED_PENDING_REBOOT"
      when AS::PatchComplianceDataState::InstalledRejected       then "INSTALLED_REJECTED"
      when AS::PatchComplianceDataState::Missing                 then "MISSING"
      when AS::PatchComplianceDataState::NotApplicable           then "NOT_APPLICABLE"
      when AS::PatchComplianceDataState::Failed                  then "FAILED"
      when AS::PatchComplianceDataState::AvailableSecurityUpdate then "AVAILABLE_SECURITY_UPDATE"
      else
        raise Exception.new("unknown enum value for 'PatchComplianceDataState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::PatchComplianceDataState?
      case key
      when "INSTALLED"                 then AS::PatchComplianceDataState::Installed
      when "INSTALLED_OTHER"           then AS::PatchComplianceDataState::InstalledOther
      when "INSTALLED_PENDING_REBOOT"  then AS::PatchComplianceDataState::InstalledPendingReboot
      when "INSTALLED_REJECTED"        then AS::PatchComplianceDataState::InstalledRejected
      when "MISSING"                   then AS::PatchComplianceDataState::Missing
      when "NOT_APPLICABLE"            then AS::PatchComplianceDataState::NotApplicable
      when "FAILED"                    then AS::PatchComplianceDataState::Failed
      when "AVAILABLE_SECURITY_UPDATE" then AS::PatchComplianceDataState::AvailableSecurityUpdate
      else
        nil
      end
    end
  end
end
