private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayAttachmentStatusType
    PendingAcceptance
    Pending
    Rejected
    Available
    Deleting
    Deleted

    def self.to_json(e : TransitGatewayAttachmentStatusType, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayAttachmentStatusType::PendingAcceptance then "pending-acceptance"
              when AEC::TransitGatewayAttachmentStatusType::Pending           then "pending"
              when AEC::TransitGatewayAttachmentStatusType::Rejected          then "rejected"
              when AEC::TransitGatewayAttachmentStatusType::Available         then "available"
              when AEC::TransitGatewayAttachmentStatusType::Deleting          then "deleting"
              when AEC::TransitGatewayAttachmentStatusType::Deleted           then "deleted"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayAttachmentStatusType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayAttachmentStatusType
      value = pull.read_string
      case value
      when "pending-acceptance" then AEC::TransitGatewayAttachmentStatusType::PendingAcceptance
      when "pending"            then AEC::TransitGatewayAttachmentStatusType::Pending
      when "rejected"           then AEC::TransitGatewayAttachmentStatusType::Rejected
      when "available"          then AEC::TransitGatewayAttachmentStatusType::Available
      when "deleting"           then AEC::TransitGatewayAttachmentStatusType::Deleting
      when "deleted"            then AEC::TransitGatewayAttachmentStatusType::Deleted
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAttachmentStatusType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayAttachmentStatusType::PendingAcceptance then "pending-acceptance"
      when AEC::TransitGatewayAttachmentStatusType::Pending           then "pending"
      when AEC::TransitGatewayAttachmentStatusType::Rejected          then "rejected"
      when AEC::TransitGatewayAttachmentStatusType::Available         then "available"
      when AEC::TransitGatewayAttachmentStatusType::Deleting          then "deleting"
      when AEC::TransitGatewayAttachmentStatusType::Deleted           then "deleted"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAttachmentStatusType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayAttachmentStatusType?
      case key
      when "pending-acceptance" then AEC::TransitGatewayAttachmentStatusType::PendingAcceptance
      when "pending"            then AEC::TransitGatewayAttachmentStatusType::Pending
      when "rejected"           then AEC::TransitGatewayAttachmentStatusType::Rejected
      when "available"          then AEC::TransitGatewayAttachmentStatusType::Available
      when "deleting"           then AEC::TransitGatewayAttachmentStatusType::Deleting
      when "deleted"            then AEC::TransitGatewayAttachmentStatusType::Deleted
      else
        nil
      end
    end
  end
end
