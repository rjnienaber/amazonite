private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum SessionFilterKey
    InvokedAfter
    InvokedBefore
    Target
    Owner
    Status
    SessionId

    def self.to_json(e : SessionFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::SessionFilterKey
      value = pull.read_string
      case value
      when "InvokedAfter"  then AS::SessionFilterKey::InvokedAfter
      when "InvokedBefore" then AS::SessionFilterKey::InvokedBefore
      when "Target"        then AS::SessionFilterKey::Target
      when "Owner"         then AS::SessionFilterKey::Owner
      when "Status"        then AS::SessionFilterKey::Status
      when "SessionId"     then AS::SessionFilterKey::SessionId
      else
        raise Exception.new("unknown enum value for 'SessionFilterKey' when deserializing from json: '#{value}'")
      end
    end
  end
end
