private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayRouteTableAnnouncementState
    Available
    Pending
    Failing
    Failed
    Deleting
    Deleted

    def self.to_json(e : TransitGatewayRouteTableAnnouncementState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayRouteTableAnnouncementState::Available then "available"
              when AEC::TransitGatewayRouteTableAnnouncementState::Pending   then "pending"
              when AEC::TransitGatewayRouteTableAnnouncementState::Failing   then "failing"
              when AEC::TransitGatewayRouteTableAnnouncementState::Failed    then "failed"
              when AEC::TransitGatewayRouteTableAnnouncementState::Deleting  then "deleting"
              when AEC::TransitGatewayRouteTableAnnouncementState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayRouteTableAnnouncementState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayRouteTableAnnouncementState
      value = pull.read_string
      case value
      when "available" then AEC::TransitGatewayRouteTableAnnouncementState::Available
      when "pending"   then AEC::TransitGatewayRouteTableAnnouncementState::Pending
      when "failing"   then AEC::TransitGatewayRouteTableAnnouncementState::Failing
      when "failed"    then AEC::TransitGatewayRouteTableAnnouncementState::Failed
      when "deleting"  then AEC::TransitGatewayRouteTableAnnouncementState::Deleting
      when "deleted"   then AEC::TransitGatewayRouteTableAnnouncementState::Deleted
      else
        raise Exception.new("unknown enum value for 'TransitGatewayRouteTableAnnouncementState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayRouteTableAnnouncementState::Available then "available"
      when AEC::TransitGatewayRouteTableAnnouncementState::Pending   then "pending"
      when AEC::TransitGatewayRouteTableAnnouncementState::Failing   then "failing"
      when AEC::TransitGatewayRouteTableAnnouncementState::Failed    then "failed"
      when AEC::TransitGatewayRouteTableAnnouncementState::Deleting  then "deleting"
      when AEC::TransitGatewayRouteTableAnnouncementState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayRouteTableAnnouncementState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayRouteTableAnnouncementState?
      case key
      when "available" then AEC::TransitGatewayRouteTableAnnouncementState::Available
      when "pending"   then AEC::TransitGatewayRouteTableAnnouncementState::Pending
      when "failing"   then AEC::TransitGatewayRouteTableAnnouncementState::Failing
      when "failed"    then AEC::TransitGatewayRouteTableAnnouncementState::Failed
      when "deleting"  then AEC::TransitGatewayRouteTableAnnouncementState::Deleting
      when "deleted"   then AEC::TransitGatewayRouteTableAnnouncementState::Deleted
      else
        nil
      end
    end
  end
end
