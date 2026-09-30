private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpcPeeringConnectionStateReasonCode
    InitiatingRequest
    PendingAcceptance
    Active
    Deleted
    Rejected
    Failed
    Expired
    Provisioning
    Deleting

    def self.to_json(e : VpcPeeringConnectionStateReasonCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpcPeeringConnectionStateReasonCode::InitiatingRequest then "initiating-request"
              when AEC::VpcPeeringConnectionStateReasonCode::PendingAcceptance then "pending-acceptance"
              when AEC::VpcPeeringConnectionStateReasonCode::Active            then "active"
              when AEC::VpcPeeringConnectionStateReasonCode::Deleted           then "deleted"
              when AEC::VpcPeeringConnectionStateReasonCode::Rejected          then "rejected"
              when AEC::VpcPeeringConnectionStateReasonCode::Failed            then "failed"
              when AEC::VpcPeeringConnectionStateReasonCode::Expired           then "expired"
              when AEC::VpcPeeringConnectionStateReasonCode::Provisioning      then "provisioning"
              when AEC::VpcPeeringConnectionStateReasonCode::Deleting          then "deleting"
              else
                raise Exception.new("unknown enum value for 'VpcPeeringConnectionStateReasonCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpcPeeringConnectionStateReasonCode
      value = pull.read_string
      case value
      when "initiating-request" then AEC::VpcPeeringConnectionStateReasonCode::InitiatingRequest
      when "pending-acceptance" then AEC::VpcPeeringConnectionStateReasonCode::PendingAcceptance
      when "active"             then AEC::VpcPeeringConnectionStateReasonCode::Active
      when "deleted"            then AEC::VpcPeeringConnectionStateReasonCode::Deleted
      when "rejected"           then AEC::VpcPeeringConnectionStateReasonCode::Rejected
      when "failed"             then AEC::VpcPeeringConnectionStateReasonCode::Failed
      when "expired"            then AEC::VpcPeeringConnectionStateReasonCode::Expired
      when "provisioning"       then AEC::VpcPeeringConnectionStateReasonCode::Provisioning
      when "deleting"           then AEC::VpcPeeringConnectionStateReasonCode::Deleting
      else
        raise Exception.new("unknown enum value for 'VpcPeeringConnectionStateReasonCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpcPeeringConnectionStateReasonCode::InitiatingRequest then "initiating-request"
      when AEC::VpcPeeringConnectionStateReasonCode::PendingAcceptance then "pending-acceptance"
      when AEC::VpcPeeringConnectionStateReasonCode::Active            then "active"
      when AEC::VpcPeeringConnectionStateReasonCode::Deleted           then "deleted"
      when AEC::VpcPeeringConnectionStateReasonCode::Rejected          then "rejected"
      when AEC::VpcPeeringConnectionStateReasonCode::Failed            then "failed"
      when AEC::VpcPeeringConnectionStateReasonCode::Expired           then "expired"
      when AEC::VpcPeeringConnectionStateReasonCode::Provisioning      then "provisioning"
      when AEC::VpcPeeringConnectionStateReasonCode::Deleting          then "deleting"
      else
        raise Exception.new("unknown enum value for 'VpcPeeringConnectionStateReasonCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpcPeeringConnectionStateReasonCode?
      case key
      when "initiating-request" then AEC::VpcPeeringConnectionStateReasonCode::InitiatingRequest
      when "pending-acceptance" then AEC::VpcPeeringConnectionStateReasonCode::PendingAcceptance
      when "active"             then AEC::VpcPeeringConnectionStateReasonCode::Active
      when "deleted"            then AEC::VpcPeeringConnectionStateReasonCode::Deleted
      when "rejected"           then AEC::VpcPeeringConnectionStateReasonCode::Rejected
      when "failed"             then AEC::VpcPeeringConnectionStateReasonCode::Failed
      when "expired"            then AEC::VpcPeeringConnectionStateReasonCode::Expired
      when "provisioning"       then AEC::VpcPeeringConnectionStateReasonCode::Provisioning
      when "deleting"           then AEC::VpcPeeringConnectionStateReasonCode::Deleting
      else
        nil
      end
    end
  end
end
