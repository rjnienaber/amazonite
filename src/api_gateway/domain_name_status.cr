private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  enum DomainNameStatus
    Available
    Updating
    Pending
    PendingCertificateReimport
    PendingOwnershipVerification
    Failed

    def self.to_json(e : DomainNameStatus, json : JSON::Builder) : Nil
      value = case e
              when AAG::DomainNameStatus::Available                    then "AVAILABLE"
              when AAG::DomainNameStatus::Updating                     then "UPDATING"
              when AAG::DomainNameStatus::Pending                      then "PENDING"
              when AAG::DomainNameStatus::PendingCertificateReimport   then "PENDING_CERTIFICATE_REIMPORT"
              when AAG::DomainNameStatus::PendingOwnershipVerification then "PENDING_OWNERSHIP_VERIFICATION"
              when AAG::DomainNameStatus::Failed                       then "FAILED"
              else
                raise Exception.new("unknown enum value for 'DomainNameStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::DomainNameStatus
      value = pull.read_string
      case value
      when "AVAILABLE"                      then AAG::DomainNameStatus::Available
      when "UPDATING"                       then AAG::DomainNameStatus::Updating
      when "PENDING"                        then AAG::DomainNameStatus::Pending
      when "PENDING_CERTIFICATE_REIMPORT"   then AAG::DomainNameStatus::PendingCertificateReimport
      when "PENDING_OWNERSHIP_VERIFICATION" then AAG::DomainNameStatus::PendingOwnershipVerification
      when "FAILED"                         then AAG::DomainNameStatus::Failed
      else
        raise Exception.new("unknown enum value for 'DomainNameStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::DomainNameStatus::Available                    then "AVAILABLE"
      when AAG::DomainNameStatus::Updating                     then "UPDATING"
      when AAG::DomainNameStatus::Pending                      then "PENDING"
      when AAG::DomainNameStatus::PendingCertificateReimport   then "PENDING_CERTIFICATE_REIMPORT"
      when AAG::DomainNameStatus::PendingOwnershipVerification then "PENDING_OWNERSHIP_VERIFICATION"
      when AAG::DomainNameStatus::Failed                       then "FAILED"
      else
        raise Exception.new("unknown enum value for 'DomainNameStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::DomainNameStatus?
      case key
      when "AVAILABLE"                      then AAG::DomainNameStatus::Available
      when "UPDATING"                       then AAG::DomainNameStatus::Updating
      when "PENDING"                        then AAG::DomainNameStatus::Pending
      when "PENDING_CERTIFICATE_REIMPORT"   then AAG::DomainNameStatus::PendingCertificateReimport
      when "PENDING_OWNERSHIP_VERIFICATION" then AAG::DomainNameStatus::PendingOwnershipVerification
      when "FAILED"                         then AAG::DomainNameStatus::Failed
      else
        nil
      end
    end
  end
end
