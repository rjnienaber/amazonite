private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum NotificationType
    Command
    Invocation

    def self.to_json(e : NotificationType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::NotificationType
      value = pull.read_string
      case value
      when "Command"    then AS::NotificationType::Command
      when "Invocation" then AS::NotificationType::Invocation
      else
        raise Exception.new("unknown enum value for 'NotificationType' when deserializing from json: '#{value}'")
      end
    end
  end
end
