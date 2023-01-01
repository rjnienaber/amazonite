private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum SessionState
    Active
    History

    def self.to_json(e : SessionState, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::SessionState
      value = pull.read_string
      case value
      when "Active"  then AS::SessionState::Active
      when "History" then AS::SessionState::History
      else
        raise Exception.new("unknown enum value for 'SessionState' when deserializing from json: '#{value}'")
      end
    end
  end
end
