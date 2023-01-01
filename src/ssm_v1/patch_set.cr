private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum PatchSet
    Os
    Application

    def self.to_json(e : PatchSet, json : JSON::Builder) : Nil
      value = case e
              when AS::PatchSet::Os          then "OS"
              when AS::PatchSet::Application then "APPLICATION"
              else
                raise Exception.new("unknown enum value for 'PatchSet' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::PatchSet
      value = pull.read_string
      case value
      when "OS"          then AS::PatchSet::Os
      when "APPLICATION" then AS::PatchSet::Application
      else
        raise Exception.new("unknown enum value for 'PatchSet' when deserializing from json: '#{value}'")
      end
    end
  end
end
