private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum PatchComplianceDataState
    Installed
    InstalledOther
    InstalledPendingReboot
    InstalledRejected
    Missing
    NotApplicable
    Failed

    def self.to_json(e : PatchComplianceDataState, json : JSON::Builder) : Nil
      value = case e
              when AS::PatchComplianceDataState::Installed              then "INSTALLED"
              when AS::PatchComplianceDataState::InstalledOther         then "INSTALLED_OTHER"
              when AS::PatchComplianceDataState::InstalledPendingReboot then "INSTALLED_PENDING_REBOOT"
              when AS::PatchComplianceDataState::InstalledRejected      then "INSTALLED_REJECTED"
              when AS::PatchComplianceDataState::Missing                then "MISSING"
              when AS::PatchComplianceDataState::NotApplicable          then "NOT_APPLICABLE"
              when AS::PatchComplianceDataState::Failed                 then "FAILED"
              else
                raise Exception.new("unknown enum value for 'PatchComplianceDataState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::PatchComplianceDataState
      value = pull.read_string
      case value
      when "INSTALLED"                then AS::PatchComplianceDataState::Installed
      when "INSTALLED_OTHER"          then AS::PatchComplianceDataState::InstalledOther
      when "INSTALLED_PENDING_REBOOT" then AS::PatchComplianceDataState::InstalledPendingReboot
      when "INSTALLED_REJECTED"       then AS::PatchComplianceDataState::InstalledRejected
      when "MISSING"                  then AS::PatchComplianceDataState::Missing
      when "NOT_APPLICABLE"           then AS::PatchComplianceDataState::NotApplicable
      when "FAILED"                   then AS::PatchComplianceDataState::Failed
      else
        raise Exception.new("unknown enum value for 'PatchComplianceDataState' when deserializing from json: '#{value}'")
      end
    end
  end
end
