private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum PatchAction
    AllowAsDependency
    Block

    def self.to_json(e : PatchAction, json : JSON::Builder) : Nil
      value = case e
              when AS::PatchAction::AllowAsDependency then "ALLOW_AS_DEPENDENCY"
              when AS::PatchAction::Block             then "BLOCK"
              else
                raise Exception.new("unknown enum value for 'PatchAction' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::PatchAction
      value = pull.read_string
      case value
      when "ALLOW_AS_DEPENDENCY" then AS::PatchAction::AllowAsDependency
      when "BLOCK"               then AS::PatchAction::Block
      else
        raise Exception.new("unknown enum value for 'PatchAction' when deserializing from json: '#{value}'")
      end
    end
  end
end
