private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum CommandFilterKey
    InvokedAfter
    InvokedBefore
    Status
    ExecutionStage
    DocumentName

    def self.to_json(e : CommandFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::CommandFilterKey
      value = pull.read_string
      case value
      when "InvokedAfter"   then AS::CommandFilterKey::InvokedAfter
      when "InvokedBefore"  then AS::CommandFilterKey::InvokedBefore
      when "Status"         then AS::CommandFilterKey::Status
      when "ExecutionStage" then AS::CommandFilterKey::ExecutionStage
      when "DocumentName"   then AS::CommandFilterKey::DocumentName
      else
        raise Exception.new("unknown enum value for 'CommandFilterKey' when deserializing from json: '#{value}'")
      end
    end
  end
end
