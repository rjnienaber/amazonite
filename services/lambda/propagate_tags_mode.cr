private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum PropagateTagsMode
    None
    Explicit

    def self.to_json(e : PropagateTagsMode, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::PropagateTagsMode
      value = pull.read_string
      case value
      when "None"     then AL::PropagateTagsMode::None
      when "Explicit" then AL::PropagateTagsMode::Explicit
      else
        raise Exception.new("unknown enum value for 'PropagateTagsMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::PropagateTagsMode?
      case key
      when "None"     then AL::PropagateTagsMode::None
      when "Explicit" then AL::PropagateTagsMode::Explicit
      else
        nil
      end
    end
  end
end
