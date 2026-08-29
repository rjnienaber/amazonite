private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  enum ConnectionState
    Creating
    Updating
    Deleting
    Authorized
    Deauthorized
    Authorizing
    Deauthorizing
    Active
    FailedConnectivity

    def self.to_json(e : ConnectionState, json : JSON::Builder) : Nil
      value = case e
              when AEB::ConnectionState::Creating           then "CREATING"
              when AEB::ConnectionState::Updating           then "UPDATING"
              when AEB::ConnectionState::Deleting           then "DELETING"
              when AEB::ConnectionState::Authorized         then "AUTHORIZED"
              when AEB::ConnectionState::Deauthorized       then "DEAUTHORIZED"
              when AEB::ConnectionState::Authorizing        then "AUTHORIZING"
              when AEB::ConnectionState::Deauthorizing      then "DEAUTHORIZING"
              when AEB::ConnectionState::Active             then "ACTIVE"
              when AEB::ConnectionState::FailedConnectivity then "FAILED_CONNECTIVITY"
              else
                raise Exception.new("unknown enum value for 'ConnectionState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::ConnectionState
      value = pull.read_string
      case value
      when "CREATING"            then AEB::ConnectionState::Creating
      when "UPDATING"            then AEB::ConnectionState::Updating
      when "DELETING"            then AEB::ConnectionState::Deleting
      when "AUTHORIZED"          then AEB::ConnectionState::Authorized
      when "DEAUTHORIZED"        then AEB::ConnectionState::Deauthorized
      when "AUTHORIZING"         then AEB::ConnectionState::Authorizing
      when "DEAUTHORIZING"       then AEB::ConnectionState::Deauthorizing
      when "ACTIVE"              then AEB::ConnectionState::Active
      when "FAILED_CONNECTIVITY" then AEB::ConnectionState::FailedConnectivity
      else
        raise Exception.new("unknown enum value for 'ConnectionState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::ConnectionState::Creating           then "CREATING"
      when AEB::ConnectionState::Updating           then "UPDATING"
      when AEB::ConnectionState::Deleting           then "DELETING"
      when AEB::ConnectionState::Authorized         then "AUTHORIZED"
      when AEB::ConnectionState::Deauthorized       then "DEAUTHORIZED"
      when AEB::ConnectionState::Authorizing        then "AUTHORIZING"
      when AEB::ConnectionState::Deauthorizing      then "DEAUTHORIZING"
      when AEB::ConnectionState::Active             then "ACTIVE"
      when AEB::ConnectionState::FailedConnectivity then "FAILED_CONNECTIVITY"
      else
        raise Exception.new("unknown enum value for 'ConnectionState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::ConnectionState?
      case key
      when "CREATING"            then AEB::ConnectionState::Creating
      when "UPDATING"            then AEB::ConnectionState::Updating
      when "DELETING"            then AEB::ConnectionState::Deleting
      when "AUTHORIZED"          then AEB::ConnectionState::Authorized
      when "DEAUTHORIZED"        then AEB::ConnectionState::Deauthorized
      when "AUTHORIZING"         then AEB::ConnectionState::Authorizing
      when "DEAUTHORIZING"       then AEB::ConnectionState::Deauthorizing
      when "ACTIVE"              then AEB::ConnectionState::Active
      when "FAILED_CONNECTIVITY" then AEB::ConnectionState::FailedConnectivity
      else
        nil
      end
    end
  end
end
