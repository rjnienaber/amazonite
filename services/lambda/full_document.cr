private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum FullDocument
    UpdateLookup
    Default

    def self.to_json(e : FullDocument, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::FullDocument
      value = pull.read_string
      case value
      when "UpdateLookup" then AL::FullDocument::UpdateLookup
      when "Default"      then AL::FullDocument::Default
      else
        raise Exception.new("unknown enum value for 'FullDocument' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::FullDocument?
      case key
      when "UpdateLookup" then AL::FullDocument::UpdateLookup
      when "Default"      then AL::FullDocument::Default
      else
        nil
      end
    end
  end
end
