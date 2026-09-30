private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayAttachmentState
    Initiating
    InitiatingRequest
    PendingAcceptance
    RollingBack
    Pending
    Available
    Modifying
    Deleting
    Deleted
    Failed
    Rejected
    Rejecting
    Failing

    def self.to_json(e : TransitGatewayAttachmentState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayAttachmentState::Initiating        then "initiating"
              when AEC::TransitGatewayAttachmentState::InitiatingRequest then "initiatingRequest"
              when AEC::TransitGatewayAttachmentState::PendingAcceptance then "pendingAcceptance"
              when AEC::TransitGatewayAttachmentState::RollingBack       then "rollingBack"
              when AEC::TransitGatewayAttachmentState::Pending           then "pending"
              when AEC::TransitGatewayAttachmentState::Available         then "available"
              when AEC::TransitGatewayAttachmentState::Modifying         then "modifying"
              when AEC::TransitGatewayAttachmentState::Deleting          then "deleting"
              when AEC::TransitGatewayAttachmentState::Deleted           then "deleted"
              when AEC::TransitGatewayAttachmentState::Failed            then "failed"
              when AEC::TransitGatewayAttachmentState::Rejected          then "rejected"
              when AEC::TransitGatewayAttachmentState::Rejecting         then "rejecting"
              when AEC::TransitGatewayAttachmentState::Failing           then "failing"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayAttachmentState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayAttachmentState
      value = pull.read_string
      case value
      when "initiating"        then AEC::TransitGatewayAttachmentState::Initiating
      when "initiatingRequest" then AEC::TransitGatewayAttachmentState::InitiatingRequest
      when "pendingAcceptance" then AEC::TransitGatewayAttachmentState::PendingAcceptance
      when "rollingBack"       then AEC::TransitGatewayAttachmentState::RollingBack
      when "pending"           then AEC::TransitGatewayAttachmentState::Pending
      when "available"         then AEC::TransitGatewayAttachmentState::Available
      when "modifying"         then AEC::TransitGatewayAttachmentState::Modifying
      when "deleting"          then AEC::TransitGatewayAttachmentState::Deleting
      when "deleted"           then AEC::TransitGatewayAttachmentState::Deleted
      when "failed"            then AEC::TransitGatewayAttachmentState::Failed
      when "rejected"          then AEC::TransitGatewayAttachmentState::Rejected
      when "rejecting"         then AEC::TransitGatewayAttachmentState::Rejecting
      when "failing"           then AEC::TransitGatewayAttachmentState::Failing
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAttachmentState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayAttachmentState::Initiating        then "initiating"
      when AEC::TransitGatewayAttachmentState::InitiatingRequest then "initiatingRequest"
      when AEC::TransitGatewayAttachmentState::PendingAcceptance then "pendingAcceptance"
      when AEC::TransitGatewayAttachmentState::RollingBack       then "rollingBack"
      when AEC::TransitGatewayAttachmentState::Pending           then "pending"
      when AEC::TransitGatewayAttachmentState::Available         then "available"
      when AEC::TransitGatewayAttachmentState::Modifying         then "modifying"
      when AEC::TransitGatewayAttachmentState::Deleting          then "deleting"
      when AEC::TransitGatewayAttachmentState::Deleted           then "deleted"
      when AEC::TransitGatewayAttachmentState::Failed            then "failed"
      when AEC::TransitGatewayAttachmentState::Rejected          then "rejected"
      when AEC::TransitGatewayAttachmentState::Rejecting         then "rejecting"
      when AEC::TransitGatewayAttachmentState::Failing           then "failing"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAttachmentState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayAttachmentState?
      case key
      when "initiating"        then AEC::TransitGatewayAttachmentState::Initiating
      when "initiatingRequest" then AEC::TransitGatewayAttachmentState::InitiatingRequest
      when "pendingAcceptance" then AEC::TransitGatewayAttachmentState::PendingAcceptance
      when "rollingBack"       then AEC::TransitGatewayAttachmentState::RollingBack
      when "pending"           then AEC::TransitGatewayAttachmentState::Pending
      when "available"         then AEC::TransitGatewayAttachmentState::Available
      when "modifying"         then AEC::TransitGatewayAttachmentState::Modifying
      when "deleting"          then AEC::TransitGatewayAttachmentState::Deleting
      when "deleted"           then AEC::TransitGatewayAttachmentState::Deleted
      when "failed"            then AEC::TransitGatewayAttachmentState::Failed
      when "rejected"          then AEC::TransitGatewayAttachmentState::Rejected
      when "rejecting"         then AEC::TransitGatewayAttachmentState::Rejecting
      when "failing"           then AEC::TransitGatewayAttachmentState::Failing
      else
        nil
      end
    end
  end
end
