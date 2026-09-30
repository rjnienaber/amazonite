private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VerifiedAccessEndpointStatusCode
    Pending
    Active
    Updating
    Deleting
    Deleted

    def self.to_json(e : VerifiedAccessEndpointStatusCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::VerifiedAccessEndpointStatusCode::Pending  then "pending"
              when AEC::VerifiedAccessEndpointStatusCode::Active   then "active"
              when AEC::VerifiedAccessEndpointStatusCode::Updating then "updating"
              when AEC::VerifiedAccessEndpointStatusCode::Deleting then "deleting"
              when AEC::VerifiedAccessEndpointStatusCode::Deleted  then "deleted"
              else
                raise Exception.new("unknown enum value for 'VerifiedAccessEndpointStatusCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VerifiedAccessEndpointStatusCode
      value = pull.read_string
      case value
      when "pending"  then AEC::VerifiedAccessEndpointStatusCode::Pending
      when "active"   then AEC::VerifiedAccessEndpointStatusCode::Active
      when "updating" then AEC::VerifiedAccessEndpointStatusCode::Updating
      when "deleting" then AEC::VerifiedAccessEndpointStatusCode::Deleting
      when "deleted"  then AEC::VerifiedAccessEndpointStatusCode::Deleted
      else
        raise Exception.new("unknown enum value for 'VerifiedAccessEndpointStatusCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VerifiedAccessEndpointStatusCode::Pending  then "pending"
      when AEC::VerifiedAccessEndpointStatusCode::Active   then "active"
      when AEC::VerifiedAccessEndpointStatusCode::Updating then "updating"
      when AEC::VerifiedAccessEndpointStatusCode::Deleting then "deleting"
      when AEC::VerifiedAccessEndpointStatusCode::Deleted  then "deleted"
      else
        raise Exception.new("unknown enum value for 'VerifiedAccessEndpointStatusCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VerifiedAccessEndpointStatusCode?
      case key
      when "pending"  then AEC::VerifiedAccessEndpointStatusCode::Pending
      when "active"   then AEC::VerifiedAccessEndpointStatusCode::Active
      when "updating" then AEC::VerifiedAccessEndpointStatusCode::Updating
      when "deleting" then AEC::VerifiedAccessEndpointStatusCode::Deleting
      when "deleted"  then AEC::VerifiedAccessEndpointStatusCode::Deleted
      else
        nil
      end
    end
  end
end
