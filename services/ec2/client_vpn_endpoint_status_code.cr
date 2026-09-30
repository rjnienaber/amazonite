private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ClientVpnEndpointStatusCode
    PendingAssociate
    Available
    Deleting
    Deleted
    Pending

    def self.to_json(e : ClientVpnEndpointStatusCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::ClientVpnEndpointStatusCode::PendingAssociate then "pending-associate"
              when AEC::ClientVpnEndpointStatusCode::Available        then "available"
              when AEC::ClientVpnEndpointStatusCode::Deleting         then "deleting"
              when AEC::ClientVpnEndpointStatusCode::Deleted          then "deleted"
              when AEC::ClientVpnEndpointStatusCode::Pending          then "pending"
              else
                raise Exception.new("unknown enum value for 'ClientVpnEndpointStatusCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ClientVpnEndpointStatusCode
      value = pull.read_string
      case value
      when "pending-associate" then AEC::ClientVpnEndpointStatusCode::PendingAssociate
      when "available"         then AEC::ClientVpnEndpointStatusCode::Available
      when "deleting"          then AEC::ClientVpnEndpointStatusCode::Deleting
      when "deleted"           then AEC::ClientVpnEndpointStatusCode::Deleted
      when "pending"           then AEC::ClientVpnEndpointStatusCode::Pending
      else
        raise Exception.new("unknown enum value for 'ClientVpnEndpointStatusCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ClientVpnEndpointStatusCode::PendingAssociate then "pending-associate"
      when AEC::ClientVpnEndpointStatusCode::Available        then "available"
      when AEC::ClientVpnEndpointStatusCode::Deleting         then "deleting"
      when AEC::ClientVpnEndpointStatusCode::Deleted          then "deleted"
      when AEC::ClientVpnEndpointStatusCode::Pending          then "pending"
      else
        raise Exception.new("unknown enum value for 'ClientVpnEndpointStatusCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ClientVpnEndpointStatusCode?
      case key
      when "pending-associate" then AEC::ClientVpnEndpointStatusCode::PendingAssociate
      when "available"         then AEC::ClientVpnEndpointStatusCode::Available
      when "deleting"          then AEC::ClientVpnEndpointStatusCode::Deleting
      when "deleted"           then AEC::ClientVpnEndpointStatusCode::Deleted
      when "pending"           then AEC::ClientVpnEndpointStatusCode::Pending
      else
        nil
      end
    end
  end
end
