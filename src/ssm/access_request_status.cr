private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum AccessRequestStatus
    Approved
    Rejected
    Revoked
    Expired
    Pending

    def self.to_json(e : AccessRequestStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AccessRequestStatus
      value = pull.read_string
      case value
      when "Approved" then AS::AccessRequestStatus::Approved
      when "Rejected" then AS::AccessRequestStatus::Rejected
      when "Revoked"  then AS::AccessRequestStatus::Revoked
      when "Expired"  then AS::AccessRequestStatus::Expired
      when "Pending"  then AS::AccessRequestStatus::Pending
      else
        raise Exception.new("unknown enum value for 'AccessRequestStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::AccessRequestStatus?
      case key
      when "Approved" then AS::AccessRequestStatus::Approved
      when "Rejected" then AS::AccessRequestStatus::Rejected
      when "Revoked"  then AS::AccessRequestStatus::Revoked
      when "Expired"  then AS::AccessRequestStatus::Expired
      when "Pending"  then AS::AccessRequestStatus::Pending
      else
        nil
      end
    end
  end
end
